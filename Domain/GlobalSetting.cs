using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace Domain
{
    public class GlobalSetting
    {
        /// <summary>
        /// ID
        /// </summary>
        public virtual Guid ID { get; set; }

        /// <summary>
        /// 公司名称
        /// </summary>
        public virtual string CompanyName { get; set; }
    }
}