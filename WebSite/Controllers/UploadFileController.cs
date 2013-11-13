using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class UploadFileController : Controller
    {
        public IUploadFileManager UploadFileManager { get; set; }

        //
        // GET: /SystemModel/

       
        /// <summary>
        /// 删除附件
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(UploadFile uploadFile)
        {
            UploadFileManager.Delete(uploadFile.ID);
            
            return Content("1");
        }
    }
}
