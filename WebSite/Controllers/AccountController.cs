using System;
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
    }
}
