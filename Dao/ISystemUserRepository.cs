using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace Dao
{
    public interface ISystemUserRepository : IRepository<SystemUser>
    {
        IQueryable<SystemUser> LoadAllByPage(out long total, int page, int rows, string order, string sort);

        IQueryable<SystemUser> LoadAllEnable();
    }
}
