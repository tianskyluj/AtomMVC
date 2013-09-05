using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace Service
{
    public interface IUserInfoManager : IGenericManager<UserInfo>
    {
        IList<UserInfo> LoadAllByPage(out long total, int page, int rows, string order, string sort);

        UserInfo Get(string account);

        UserInfo Get(string account, string password);

        void Update(UserInfo entity, string password);

        /// <summary>
        /// 从session中获取登录用户资料
        /// </summary>
        /// <returns></returns>
        UserInfo GetUserSession();

        /// <summary>
        /// 用户登录操作
        /// </summary>
        /// <returns></returns>
        bool DoLogOn(UserInfo user);

        /// <summary>
        /// 判断是否登录
        /// </summary>
        /// <returns></returns>
        bool IfLogOn();

        /// <summary>
        /// 登出
        /// </summary>
        /// <returns></returns>
        void LogOut();
    }
}
