﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/
        public IUserInfoManager UserInfoManager { get; set; }
       
        public ActionResult Index()
        {
           this.ViewData["userInfo"] = UserInfoManager.GetUserSession();
           this.ViewData["avatar"] = UserInfoManager.GetUserAvatar();
            return View();
        }

        /// <summary>
        /// 修改个人资料
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateProfile(UserInfo userModel)
        {
            UserInfo initEntity = UserInfoManager.Get(userModel.ID);

            initEntity.Phone = userModel.Phone;
            initEntity.Email = userModel.Email;
            initEntity.QQ = userModel.QQ;

            UserInfoManager.Update(initEntity);
            UserInfoManager.SetUserSession(initEntity);
            return Content("1");
        }

        /// <summary>
        /// 上传头像
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UploadAvatar(string avatar)
        {
            UserInfoManager.UploadAvatar(avatar);
            return Content("1");
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdatePassword(string oldPassword, string newPassword, string newPasswordAgain)
        {
            #region 数据合法性验证
            if (oldPassword.Trim() == string.Empty)
                return Content("请输入新密码");
            if (newPassword.Trim() == string.Empty)
                return Content("请输入新密码");
            if (newPasswordAgain.Trim() == string.Empty)
                return Content("请再次输入新密码");
            if (newPassword.Trim() != newPasswordAgain.Trim())
                return Content("两次输入的新密码不一致，请重试");
            if (!UserInfoManager.IsCorrectPassword(oldPassword.Trim()))
            {
                return Content("旧密码输入不正确");
            }
            #endregion
            UserInfoManager.Update(UserInfoManager.GetUserSession(), newPassword.Trim());
            return Content("1");
            
        }

        /// <summary>
        /// 保存或者更新系统用户
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveSysUser(UserInfo userInfo)
        {
            if (userInfo.ID == new Guid())
                userInfo.ID = Guid.NewGuid();
            userInfo.CreateTime = DateTime.Now;
            userInfo.UpdateTime = DateTime.Now;
            userInfo.Password = Atom.Common.DEncrypt.HashEncode.HashCode(userInfo.Account.ToUpper() + "123456" + userInfo.CreateTime.ToLongDateString());
            UserInfoManager.SaveOrUpdate(userInfo);

            return Content("1");
        }

        /// <summary>
        /// 删除模块
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteSysUser(UserInfo userInfo)
        {
            UserInfoManager.Delete(userInfo.ID);

            return Content("1");
        }

        /// <summary>
        /// 修改模块，返回待修改模块的相关数据
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateSysUser(UserInfo userInfo)
        {
            return Content(Atom.Common.JsonHelper.GetJson<UserInfo>(UserInfoManager.LoadAll().FirstOrDefault(f => f.ID == userInfo.ID)));
        }
    }
}
