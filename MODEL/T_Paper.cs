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
    
    public partial class T_Paper
    {
        public T_Paper()
        {
            this.T_AnswerSheet = new HashSet<T_AnswerSheet>();
            this.T_PaperQuestion = new HashSet<T_PaperQuestion>();
        }
    
        public int ID { get; set; }
        public string PaperName { get; set; }
        public System.DateTime AddDate { get; set; }
        public bool IsDel { get; set; }
        public bool IsPublished { get; set; }
        public int typeId { get; set; }
        public string PaperProducerID { get; set; }
    
        public virtual ICollection<T_AnswerSheet> T_AnswerSheet { get; set; }
        public virtual ICollection<T_PaperQuestion> T_PaperQuestion { get; set; }
    }
}