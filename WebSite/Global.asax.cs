using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Text;
using Spring.Web.Mvc;
using Spring.Context;
using Spring.Context.Support;
using Service;
using System.Data;
using Atom.Common;

namespace WebSite
{
    // 注意: 有关启用 IIS6 或 IIS7 经典模式的说明，
    // 请访问 http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : SpringMvcApplication
    {
        private static log4net.ILog logger = log4net.LogManager.GetLogger("Logger");

        protected override void Application_Start(object sender, EventArgs e)
        {
            //初始化log4net
            log4net.Config.XmlConfigurator.Configure();

            base.Application_Start(sender, e);

            this.SetInitAccount();

            this.SetGlobalSetting();

            this.LoadSystemModel();
        }

        /// <summary>
        /// 设置初始账号
        /// </summary>
        private void SetInitAccount()
        {
            IApplicationContext cxt = ContextRegistry.GetContext();
            IUserInfoManager manger = (IUserInfoManager)cxt.GetObject("Manager.UserInfo");

            const string account = "admin";
            var user = manger.Get(account);
            if (user == null)
            {
                user = new Domain.UserInfo
                {
                    Account = account,
                    Name = "管理员",
                    ID = Guid.NewGuid(),
                    CreateTime = DateTime.Now,
                    UpdateTime = DateTime.Now,
                    IsEnabled = true,
                    IsAdmin = true
                };

                manger.Save(user);
            }
        }

        /// <summary>
        /// 设置初始全局变量
        /// </summary>
        private void SetGlobalSetting()
        {
            IApplicationContext cxt = ContextRegistry.GetContext();
            IGlobalSettingManager manger = (IGlobalSettingManager)cxt.GetObject("Manager.GlobalSetting");
            
            var global = manger.LoadAll().FirstOrDefault();
            if (global == null)
            {
                global = new Domain.GlobalSetting
                {
                    ID = Guid.NewGuid(),
                    CompanyName = "原子科技"
                };
                manger.Save(global);
            }
        }

        /// <summary>
        /// 按config文件夹中的viewModel.xml配置文件加载系统模块
        /// </summary>
        private void LoadSystemModel()
        {
            string xmlPath = "~/Config/ViewModel.xml";
            IApplicationContext cxt = ContextRegistry.GetContext();
            ISystemModelManager manger = (ISystemModelManager)cxt.GetObject("Manager.SystemModel");
            IList<Domain.SystemModel> modelList = manger.LoadAll();
            if (modelList.Count == 0)
            {
                //manger.LoadSystemModelWithXML();
                // 把xml文件转换成dataSet
                Atom.Common.XML.XMLProcess xmlProcess = new Atom.Common.XML.XMLProcess();
                DataSet xmlDS = xmlProcess.GetDataSetByXml(xmlPath);
                // 生成目录
                for (int i = 0; i < xmlDS.Tables[0].Rows.Count; i++)
                {
                    int DirectId = xmlDS.Tables[0].Rows[i]["Direct_Id"].ToInt();
                    Guid guid = manger.FastAddSystemModel(new Guid(), "", xmlDS.Tables[0].Rows[i]["Name"].ToString(), i);
                    // 生成页面
                    DataRow[] drs = xmlDS.Tables[1].Select("Direct_Id=" + DirectId.ToStr());
                    for (int j = 0; j < drs.Length; j++)
                    {
                        manger.FastAddSystemModel(guid, drs[j]["value"].ToString(), drs[j]["Name"].ToString(), j);
                    }
                }
            }
        }

        protected override void RegisterRoutes(RouteCollection routes)
        {
            var guidRegx = @"^\w{8}-(\w{4}-){3}\w{12}$";

            routes.MapRoute(
                "Admin", // 路由名称
                "Admin", // 带有参数的 URL
                new { controller = "Home", action = "Admin" } // 参数默认值
            );

            routes.MapRoute(
                "LogOn", // 路由名称
                "LogOn", // 带有参数的 URL
                new { controller = "Home", action = "LogOn" } // 参数默认值
            );

            routes.MapRoute(
                "CategoryById", // 路由名称
                "{forumId}/{id}/Category.html", // 带有参数的 URL
                new { controller = "Category", action = "List", id = UrlParameter.Optional }, // 参数默认值
                new { forumId = guidRegx, id = guidRegx }
            );

            routes.MapRoute(
                "Category", // 路由名称
                "{forumId}/Category.html", // 带有参数的 URL
                new { controller = "Category", action = "List" }, // 参数默认值
                new { forumId = guidRegx }
            );

            routes.MapRoute(
                "Article", // 路由名称
                "Article/{id}.html", // 带有参数的 URL
                new { controller = "Article", action = "Get" }, // 参数默认值
                new { id = guidRegx }
            );

            routes.MapRoute(
                "Index", // 路由名称
                "Index.html", // 带有参数的 URL
                new { controller = "Home", action = "Index" } // 参数默认值
            );

            base.RegisterRoutes(routes);
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            if (this.Server.GetLastError() == null)
            {
                return;
            }

            Exception ex = this.Server.GetLastError().GetBaseException();
            StringBuilder sb = new StringBuilder();

            sb.Append(ex.Message);
            sb.Append("\r\nSOURCE: " + ex.Source);
            if (Request.Form != null)
            {
                sb.Append("\r\nFORM: " + this.Request.Form.ToString());
            }
            if (Request.QueryString != null)
            {
                sb.Append("\r\nQUERYSTRING: " + this.Request.QueryString.ToString());
            }

            sb.Append("\r\n引发当前异常的原因: " + ex.TargetSite);
            sb.Append("\r\n堆栈跟踪: " + ex.StackTrace);
            logger.Error(sb.ToString());

            var key = System.Configuration.ConfigurationManager.AppSettings["IsDebug"];
            bool isDebug;
            if (!bool.TryParse(key, out isDebug) || !isDebug)
            {
                this.Server.ClearError();
            }
        }

        protected void Session_Start()
        {
            this.Session["isCN"] = this.Request.UserLanguages.Length < 1 
                || string.IsNullOrEmpty(this.Request.UserLanguages[0]) 
                || this.Request.UserLanguages[0].ToLower() == "zh-cn";
        }
    }

    //public class MvcApplication : System.Web.HttpApplication
    //{
    //    public static void RegisterRoutes(RouteCollection routes)
    //    {
    //        routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

    //        routes.MapRoute(
    //            "Default", // 路由名称
    //            "{controller}/{action}/{id}", // 带有参数的 URL
    //            new { controller = "Home", action = "Index", id = UrlParameter.Optional } // 参数默认值
    //        );

    //    }

    //    protected void Application_Start()
    //    {
    //        AreaRegistration.RegisterAllAreas();

    //        RegisterRoutes(RouteTable.Routes);
    //    }
    //}
}