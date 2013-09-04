using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Domain;

namespace Service
{
    public interface ISystemUserManager : IGenericManager<SystemUser>
    {
        IList<SystemUser> LoadAllByPage(out long total, int page, int rows, string order, string sort);

        IList<SystemUser> LoadAllEnable();
    }
}
