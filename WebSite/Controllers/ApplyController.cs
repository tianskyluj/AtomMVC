using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class ApplyController : Controller
    {
        public IApplyManager ApplyManager { get; set; }
        public IApplyTypeManager ApplyTypeManager { get; set; }
        public IRoleManager RoleManager { get; set; }
        public IUserInfoManager UserInfoManager { get; set; }
        public ICheckLogManager CheckLogManager { get; set; }
        public IRoleUserManager RoleUserManager { get; set; }
        //
        // GET: /SystemModel/

        public ActionResult NewApply()
        {
            ViewData["ApplyType"] = ApplyTypeManager.LoadAll();
            ViewData["Role"] = RoleManager.LoadAll();
            return View("NewApply");
        }

        public ActionResult MyApply()
        {
            ViewData["Checked"] = ApplyManager.LoadAll().Where(f => f.SendUser.ID == UserInfoManager.GetUserSession().ID && f.CheckState == 1);
            ViewData["CheckLog"] = CheckLogManager.LoadAll().Where(f => f.Apply.SendUser.ID == UserInfoManager.GetUserSession().ID);
            return View("MyApply");
        }

        public ActionResult MyCheck()
        {
            ViewData["CheckLog"] = CheckLogManager.LoadAll().Where(f => f.UserInfo.ID == UserInfoManager.GetUserSession().ID);
            return View("MyCheck");
        }

        /// <summary>
        /// 保存或者更新系统模块v
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveApply(Apply apply,string role,string applyType)
        {
            #region 保存申请
            if (apply.ID == new Guid())
                apply.ID = Guid.NewGuid();
            apply.ApplyType = ApplyTypeManager.Get(new Guid(applyType));
            apply.SendUser = UserInfoManager.GetUserSession();
            apply.CreateTime = DateTime.Now;
            apply.CheckState = 0;
            apply.CheckStateName = "待审核";
            ApplyManager.SaveOrUpdate(apply);
            #endregion
            
            #region 保存待审核用户的信息
            // 读取需要进行审核角色的用户
            
            IList<RoleUser> roleUser = RoleUserManager.LoadAll().Where(f => f.Role.ID == new Guid(role)).ToList();
            
            Guid roleId = new Guid(role);
            Role checkRole = RoleManager.Get(roleId);
            if (roleUser.Count ==0)
                return Content("-1");
            for (int i = 0; i < roleUser.Count; i++)
            {
                CheckLog checkLog = new CheckLog();
                checkLog.ID = Guid.NewGuid();
                checkLog.Apply = apply;
                checkLog.CheckState = 0;
                checkLog.CheckTime = DateTime.Now;
                checkLog.CreateTime = DateTime.Now;
                checkLog.Remark = "";
                checkLog.Role = checkRole;
                checkLog.UserInfo = roleUser[i].User;
                CheckLogManager.Save(checkLog);
            }
            #endregion

            return Content("1");
        }

        /// <summary>
        /// 删除模块
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteApply(Apply apply)
        {
            //CityManager.Delete(city.ID);
            
            return Content("1");
        }

        /// <summary>
        /// 修改模块，返回待修改模块的相关数据
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateApply(Apply apply)
        {
            //return Content(Atom.Common.JsonHelper.GenerateStringByJsonDotNet<City>(CityManager.LoadAll().FirstOrDefault(f => f.ID == city.ID)));
            return Content("1");
        }
    }
}
