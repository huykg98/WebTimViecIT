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
    
    public partial class AppliedJob
    {
        public string JobseekerID { get; set; }
        public int JobID { get; set; }
        public int ProfileID { get; set; }
        public System.DateTime ApplyDate { get; set; }
        public int MatchingPercent { get; set; }
        public int Status { get; set; }
        public Nullable<System.DateTime> AcceptDate { get; set; }
        public bool IsDeleted { get; set; }
    
        public virtual Job Job { get; set; }
        public virtual Jobseeker Jobseeker { get; set; }
        public virtual Profile Profile { get; set; }
    }
}