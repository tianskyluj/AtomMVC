using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace Service.Implement
{
    public class SystemUserManager : GenericManagerBase<SystemUser>, ISystemUserManager
    {
        public IList<SystemUser> LoadAllByPage(out long total, int page, int rows, string order, string sort)
        {
            return ((Dao.ISystemUserRepository)(this.CurrentRepository))
                .LoadAllByPage(out total, page, rows, order, sort).ToList();
        }

        public IList<SystemUser> LoadAllEnable()
        {
            return ((Dao.ISystemUserRepository)(this.CurrentRepository)).LoadAllEnable().ToList();
        }
    }
}
