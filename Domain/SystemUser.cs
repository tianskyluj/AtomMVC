using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Domain
{
    /// <summary>
    /// 用户表
    /// </summary>
    public class SystemUser
    {
        /// <summary>
        /// 唯一标识
        /// </summary>
        public virtual Guid ID { get; set; }

        /// <summary>
        /// 用户名
        /// </summary>
        public virtual string UserName { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        public virtual string PassWord { get; set; }

        /// <summary>
        /// 姓名
        /// </summary>
        public virtual string Name { get; set; }

        /// <summary>
        /// 联系电话
        /// </summary>
        public virtual string Phone { get; set; }

        /// <summary>
        /// 邮件
        /// </summary>
        public virtual string Email { get; set; }

        /// <summary>
        /// QQ messager
        /// </summary>
        public virtual string QQ { get; set; }

        /// <summary>
        /// 头像地址
        /// </summary>
        public virtual string Avatar { get; set; }

        /// <summary>
        /// 是否管理员
        /// </summary>
        public virtual bool IsAdmin { get; set; }

        /// <summary>
        /// 启用
        /// </summary>
        public virtual bool IsEnabled { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public virtual string Remark { get; set; }

        /// <summary>
        /// 创建人
        /// </summary>
        public virtual int createUser { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public virtual DateTime CreateTime { get; set; }

        /// <summary>
        /// 更新人
        /// </summary>
        public virtual int UpdateUser { get; set; }

        /// <summary>
        /// 更新时间
        /// </summary>
        public virtual DateTime UpdateTime { get; set; }
    }
}
