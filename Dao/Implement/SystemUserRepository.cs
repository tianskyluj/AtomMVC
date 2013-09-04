using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Dynamic;
using Domain;

namespace Dao.Implement
{
    public class SystemUserRepository : RepositoryBase<SystemUser>, ISystemUserRepository
    {
        public IQueryable<SystemUser> LoadAllByPage(out long total, int page, int rows, string order, string sort)
        {
            var list = this.LoadAll();

            total = list.LongCount();

            list = list.OrderByDescending(o => o.ID);
            list = list.OrderBy(sort + " " + order);

            list = list.Skip((page - 1) * rows).Take(rows);

            return list;
        }

        public IQueryable<SystemUser> LoadAllEnable()
        {
            return from li in this.LoadAll()
                   where li.IsEnabled
                   orderby li.ID descending
                   orderby li.CreateTime descending
                   select li;
        }
    }
}
