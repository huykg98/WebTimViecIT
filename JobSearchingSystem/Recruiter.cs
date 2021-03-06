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
    
    public partial class Recruiter
    {
        public Recruiter()
        {
            this.Jobs = new HashSet<Job>();
            this.PurchaseAdvertises = new HashSet<PurchaseAdvertise>();
            this.PurchaseJobPackages = new HashSet<PurchaseJobPackage>();
            this.ViewProfiles = new HashSet<ViewProfile>();
        }
    
        public string RecruiterID { get; set; }
        public string Email { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual CompanyInfo CompanyInfo { get; set; }
        public virtual ICollection<Job> Jobs { get; set; }
        public virtual ICollection<PurchaseAdvertise> PurchaseAdvertises { get; set; }
        public virtual ICollection<PurchaseJobPackage> PurchaseJobPackages { get; set; }
        public virtual ICollection<ViewProfile> ViewProfiles { get; set; }
    }
}
