//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MODEL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Message
    {
        public Tbl_Message()
        {
            this.Tbl_User_Message = new HashSet<Tbl_User_Message>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public System.DateTime SendTime { get; set; }
        public string Atachment { get; set; }
    
        public virtual ICollection<Tbl_User_Message> Tbl_User_Message { get; set; }
    }
}