//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JobSearchingSystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Category
    {
        public Category()
        {
            this.ExpectedCategories = new HashSet<ExpectedCategory>();
            this.JobCategories = new HashSet<JobCategory>();
        }
    
        public int CategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual ICollection<ExpectedCategory> ExpectedCategories { get; set; }
        public virtual ICollection<JobCategory> JobCategories { get; set; }
    }
}