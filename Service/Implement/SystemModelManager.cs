using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;
using System.Data;
using Atom.Common;

namespace Service.Implement
{
    public class SystemModelManager : GenericManagerBase<SystemModel>, ISystemModelManager
    {
        /// <summary>
        /// 快速添加系统模块
        /// </summary>
        /// <param name="parentId">父id</param>
        /// <param name="url">访问路径</param>
        /// <param name="name">名称</param>
        /// <param name="orderIndex">排序码</param>
        public Guid FastAddSystemModel(Guid parentId, string url, string name, int orderIndex)
        {
            SystemModel entity = new SystemModel();
            entity.ID = Guid.NewGuid();
            entity.ParentId = parentId;
            entity.Url = url;
            entity.Name = name;
            entity.IsEnabled = true;
            entity.OrderIndex = orderIndex;
            base.Save(entity);
            return entity.ID;
        }

        /// <summary>
        /// 根据模块名称返回模块实体类集合
        /// </summary>
        /// <returns></returns>
        public SystemModel LoadAllByName(string modelName)
        {
            SystemModel model = base.LoadAll().FirstOrDefault(f => f.Name == modelName);
            if (model == null)
            {
                model = new SystemModel();
                model.ID = Guid.NewGuid();
            }
            return model;
        }

        /// <summary>
        /// 加入新的系统模块后重置系统模块排序码
        /// </summary>
        public void ResetOrderIndex()
        { 
            
        }
    }
}
