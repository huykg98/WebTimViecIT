﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class JSSContext : DbContext
    {
        public JSSContext()
            : base("name=JSSContext")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Administrator> Administrators { get; set; }
        public virtual DbSet<Advertise> Advertises { get; set; }
        public virtual DbSet<AppliedJob> AppliedJobs { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Benefit> Benefits { get; set; }
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<CompanyInfo> CompanyInfoes { get; set; }
        public virtual DbSet<CompanyInfoCity> CompanyInfoCities { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<DesiredBenefit> DesiredBenefits { get; set; }
        public virtual DbSet<EducationHistory> EducationHistories { get; set; }
        public virtual DbSet<EmploymentHistory> EmploymentHistories { get; set; }
        public virtual DbSet<ExpectedCategory> ExpectedCategories { get; set; }
        public virtual DbSet<ExpectedCity> ExpectedCities { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<JobBenefit> JobBenefits { get; set; }
        public virtual DbSet<JobCategory> JobCategories { get; set; }
        public virtual DbSet<JobCity> JobCities { get; set; }
        public virtual DbSet<JobLanguage> JobLanguages { get; set; }
        public virtual DbSet<JobLevel> JobLevels { get; set; }
        public virtual DbSet<JobPackage> JobPackages { get; set; }
        public virtual DbSet<Jobseeker> Jobseekers { get; set; }
        public virtual DbSet<JobSkill> JobSkills { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Level> Levels { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<Message> Messages { get; set; }
        public virtual DbSet<MessageReceiver> MessageReceivers { get; set; }
        public virtual DbSet<OwnSkill> OwnSkills { get; set; }
        public virtual DbSet<Profile> Profiles { get; set; }
        public virtual DbSet<PurchaseAdvertise> PurchaseAdvertises { get; set; }
        public virtual DbSet<PurchaseJobPackage> PurchaseJobPackages { get; set; }
        public virtual DbSet<Recruiter> Recruiters { get; set; }
        public virtual DbSet<ReferencePerson> ReferencePersons { get; set; }
        public virtual DbSet<Report> Reports { get; set; }
        public virtual DbSet<SchoolLevel> SchoolLevels { get; set; }
        public virtual DbSet<Skill> Skills { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<ViewProfile> ViewProfiles { get; set; }
    }
}
