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
    
    public partial class Staff
    {
        public Staff()
        {
            this.PurchaseJobPackages = new HashSet<PurchaseJobPackage>();
        }
    
        public string StaffID { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual ICollection<PurchaseJobPackage> PurchaseJobPackages { get; set; }
    }
}