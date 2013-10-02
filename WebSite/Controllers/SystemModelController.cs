using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class SystemModelController : Controller
    {
        public ISystemModelManager SystemModelManager { get; set; }

        //
        // GET: /SystemModel/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 保存或者更新系统模块
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveSystemModel(SystemModel systemModel)
        {
            if (systemModel.ID == new Guid()) systemModel.ID = Guid.NewGuid();


            return Content("1");
        }
    }
}
