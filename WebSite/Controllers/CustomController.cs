using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class CustomController : Controller
    {
        public ICustomManager CustomManager { get; set; }
        public ICustomTypeManager CustomTypeManager { get; set; }
        public IUserInfoManager UserInfoManager { get; set; }
        public ICustomMaintainManager CustomMaintainManager { get; set; }
        public IMaintainMethodManager MaintainMethodManager { get; set; }
        public IMaintainTypeManager MaintainTypeManager { get; set; }
        //
        // GET: /SystemModel/

        public ActionResult NewCustom()
        {
            ViewData["CustomType"] = CustomTypeManager.LoadAll();
            return View("NewCustom");
        }

        public ActionResult CustomList()
        {
            ViewData["Custom"] = CustomManager.LoadAll();
            return View("CustomList");
        }

        public ActionResult CustomBirthday()
        {
            ViewData["Custom"] = CustomManager.LoadAll().Where(f=>f.Birthday.Month == DateTime.Now.Month && f.Birthday.Day == DateTime.Now.Day);
            return View("CustomBirthday");
        }

        public ActionResult NewActive()
        {
            ViewData["MaintainMethod"] = MaintainMethodManager.LoadAll();
            ViewData["MaintainType"] = MaintainTypeManager.LoadAll();
            ViewData["Custom"] = CustomManager.LoadAll();
            return View("NewActive");
        }

        public ActionResult ActiveSummary()
        {
            ViewData["CustomMaintain"] = CustomMaintainManager.LoadAll();
            return View("ActiveSummary");
        }

        public ActionResult ActiveWarnning()
        {
            ViewData["CustomMaintain"] = CustomMaintainManager.LoadAll();
            return View("ActiveSummary");
        }


        /// <summary>
        /// 保存或者更新系统模块v
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveCustom(Custom custom,string customType)
        {
            #region 保存申请
            if (custom.ID == new Guid())
                custom.ID = Guid.NewGuid();
            custom.CustomType = CustomTypeManager.Get(new Guid(customType));
            custom.CreateUser = UserInfoManager.GetUserSession();
            custom.CreateTime = DateTime.Now;
            CustomManager.SaveOrUpdate(custom);
            #endregion
            
            return Content("1");
        }

        /// <summary>
        /// 保存或者更新系客户维护数据
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveMaintain(CustomMaintain customMaintain,
                                         String maintainMethod,
                                         String maintainType,
                                         String custom)
        {
            #region 保存申请
            if (customMaintain.ID == new Guid())
                customMaintain.ID = Guid.NewGuid();
            customMaintain.MaintainMethod = MaintainMethodManager.Get(new Guid(maintainMethod));
            customMaintain.MaintainType = MaintainTypeManager.Get(new Guid(maintainType));
            customMaintain.Custom = CustomManager.Get(new Guid(custom));
            customMaintain.MaintainUser = UserInfoManager.GetUserSession();
            customMaintain.CreateUser = UserInfoManager.GetUserSession();
            customMaintain.CreateTime = DateTime.Now;
            CustomMaintainManager.SaveOrUpdate(customMaintain);
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
