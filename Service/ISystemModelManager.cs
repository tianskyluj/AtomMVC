using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace Service
{
    public interface ISystemModelManager : IGenericManager<SystemModel>
    {
        /// <summary>
        /// 快速添加系统模块
        /// </summary>
        /// <param name="parentId">父id</param>
        /// <param name="url">访问路径</param>
        /// <param name="name">名称</param>
        /// <param name="orderIndex">排序码</param>
        Guid FastAddSystemModel(Guid parentId, string url, string name, int orderIndex);

        /// <summary>
        /// 根据xml配置加载系统模块
        /// </summary>
        /// <param name="xmlPath"></param>
        //void LoadSystemModelWithXML();
    }
}
