using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class SystemController : Controller
    {
        public IGlobalSettingManager GlobalSettingManager { get; set; }
        public ISystemModelManager SystemModelManager { get; set; }
        //
        // GET: /System/

        public ActionResult Index()
        {
            ViewData["companyName"] = GlobalSettingManager.GetGlobalCache().CompanyName;
            ViewData["isProvince"] = GlobalSettingManager.GetGlobalCache().IsProvince;
            ViewData["isCity"] = GlobalSettingManager.GetGlobalCache().IsCity;
            ViewData["isRegion"] = GlobalSettingManager.GetGlobalCache().IsRegion;
            ViewData["isDepartment"] = GlobalSettingManager.GetGlobalCache().IsDepartment;
            ViewData["SystemModel"] = SystemModelManager.LoadAll();
            ViewData["NullGuid"] = new Guid();
            return View();
        }

        /// <summary>
        /// 更新全局变量
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult UpdateGolbal(GlobalSetting globalModel)
        {
            GlobalSetting entity = GlobalSettingManager.GetGlobalCache();
            globalModel.ID = entity.ID;
            GlobalSettingManager.SaveOrUpdate(globalModel);
            GlobalSettingManager.SetGlobalCache();

            return Content("1");
        }

       
    }
}
