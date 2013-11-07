using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Service;
using Domain;

namespace WebSite.Controllers
{
    public class DocPassController : Controller
    {
        public IDocPassManager DocPassManager { get; set; }
        public IDocReceiveUserRelationManager DocReceiveUserRelationManager { get; set; }
        public IUserInfoManager UserInfoManager { set; get; }

        //
        // GET: /SystemModel/

        public ActionResult NewPass()
        {
            ViewData["UserInfo"] = UserInfoManager.LoadAll();
            return View("NewPass");
        }

        public ActionResult MyDoc()
        {
            Guid userId = UserInfoManager.GetUserSession().ID;
            ViewData["MyDoc"] = DocPassManager.LoadAll().Where(f => f.SendUser.ID == userId);
            ViewData["ReceiveUserRelation"] = DocReceiveUserRelationManager.LoadAll().Where(f => f.DocPass.SendUser.ID == userId);
            return View("MyDoc");
        }

        public ActionResult MyPass()
        {
            Guid userId = UserInfoManager.GetUserSession().ID;
            ViewData["ReceiveUserRelation"] = DocReceiveUserRelationManager.LoadAll().Where(f => f.ReceiveUser.ID == userId);
            return View("MyPass");
        }

        /// <summary>
        /// 保存或者更新系统模块v
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SavePass(DocPass docPass, string receiveUsers)
        {
            if (docPass.ID == new Guid())
                docPass.ID = Guid.NewGuid();
            docPass.CreateTime = DateTime.Now;
            docPass.SendUser = UserInfoManager.GetUserSession();
            DocPassManager.SaveOrUpdate(docPass);

            // 初始化邮件和收件人的关系
            DocReceiveUserRelationManager.InitDocPassReceiveUserRelation(docPass);

            string[] receiveStrs = receiveUsers.Trim(',').Split(',');
            for (int i = 0; i < receiveStrs.Length; i++)
            {
                Guid reveiveID = new Guid(receiveStrs[i].ToString());
                DocReceiveUserRelation entity = new DocReceiveUserRelation();
                entity.ID = Guid.NewGuid();
                entity.ReceiveUser = UserInfoManager.Get(reveiveID);
                entity.DocPass = docPass;
                entity.State = 0;
                entity.ReadTime = DateTime.Now;
                if (entity.ReceiveUser == null)
                {}
                DocReceiveUserRelationManager.Save(entity);
            }

            return Content("1");
        }

        /// <summary>
        /// 删除模块
        /// </summary>
        /// <param name="globalModel"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DeleteTask(Task task)
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
        public ActionResult UpdateTask(Task task)
        {
            //return Content(Atom.Common.JsonHelper.GenerateStringByJsonDotNet<City>(CityManager.LoadAll().FirstOrDefault(f => f.ID == city.ID)));
            return Content("1");
        }
    }
}
