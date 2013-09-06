using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;
using System.IO;
using AtomOA.Common.Sys;

namespace Service.Implement
{
    public class UserInfoManager : GenericManagerBase<UserInfo>, IUserInfoManager
    {
        public IList<UserInfo> LoadAllByPage(out long total, int page, int rows, string order, string sort)
        {
            return ((Dao.IUserInfoRepository)(this.CurrentRepository))
                .LoadAllByPage(out total, page, rows, order, sort).ToList();
        }

        /// <summary>
        /// 判断是否登录
        /// </summary>
        /// <returns></returns>
        public bool IfLogOn()
        {
            if (Atom.Common.DataSession.getSessionValue("userInfo") != null)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 登出
        /// </summary>
        /// <returns></returns>
        public void LogOut()
        {
            Atom.Common.DataSession.destroySession();
        }

        /// <summary>
        /// 将用户资料存储在session中
        /// </summary>
        /// <param name="user"></param>
        public void SetUserSession(UserInfo user)
        {
            Atom.Common.DataSession.setSession("userInfo", user);
        }

        /// <summary>
        /// 从session中获取登录用户资料
        /// </summary>
        /// <returns></returns>
        public UserInfo GetUserSession()
        {
            return (UserInfo)Atom.Common.DataSession.getSessionValue("userInfo");
        }

        /// <summary>
        /// 检测用户能否登录
        /// </summary>
        /// <returns></returns>
        public bool DoLogOn(UserInfo user)
        {
            UserInfo entity = this.Get(user.Account, user.Password);
            if (entity == null)
                return false;
            else
            {
                this.SetUserSession(entity);
                return true;
            }
        }

        /// <summary>
        /// 获取MD5值
        /// </summary>
        /// <param name="key">加密的字符串</param>
        /// <returns>返回MD5值</returns>
        private string HashCode(string key)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(key, "MD5");
        }

        public override object Save(UserInfo entity)
        {
            entity.Password = this.HashCode(entity.Account.ToUpper() + "123456" + entity.CreateTime.ToLongDateString());
            return base.Save(entity);
        }

        public UserInfo Get(string account)
        {
            return ((Dao.IUserInfoRepository)(this.CurrentRepository)).Get(account);
        }

        public UserInfo Get(string account, string password)
        {
            var entity = ((Dao.IUserInfoRepository)(this.CurrentRepository)).Get(account);

            if (entity != null)
            {
                if (entity.Password !=
                        this.HashCode(entity.Account.ToUpper() + password 
                            + entity.CreateTime.ToLongDateString()))
                {
                    return null;
                }
            }

            return entity;
        }

        public void Update(UserInfo entity, string password)
        {
            entity.Password = this.HashCode(entity.Account.ToUpper() + password + entity.CreateTime.ToLongDateString());
            base.Update(entity);
        }

        /// <summary>
        /// 获取当前用户头像
        /// </summary>
        /// <returns></returns>
        public string GetUserAvatar()
        {
            string fileUrl = Atom.Common.inc.getApplicationPath() + "/Upload/Avatar/" + this.GetUserSession().ID.ToString() + "_avatar.txt";
            string avatarString = "";

            StreamReader sr;
            if (System.IO.File.Exists(SysHelper.GetPath(fileUrl)))
            {
                sr = System.IO.File.OpenText(SysHelper.GetPath(fileUrl));
                avatarString = sr.ReadLine();
                sr.Close();
                sr.Dispose();
            }

            return avatarString;
        }

        /// <summary>
        /// 获取指定用户头像
        /// </summary>
        /// <returns></returns>
        public string GetUserAvatar(string userId)
        {
            string fileUrl = Atom.Common.inc.getApplicationPath() + "/Upload/Avatar/" + userId.Trim() + "_avatar.txt";
            string avatarString = "";

            StreamReader sr;
            if (System.IO.File.Exists(SysHelper.GetPath(fileUrl)))
            {
                sr = System.IO.File.OpenText(SysHelper.GetPath(fileUrl));
                avatarString = sr.ReadLine();
                sr.Close();
                sr.Dispose();
            }

            return avatarString;
        }
    }
}
