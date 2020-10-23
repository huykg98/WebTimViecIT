-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'Administrator'
CREATE TABLE [dbo].[Administrator] (
    [AdministratorID] nvarchar(128)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Advertise'
CREATE TABLE [dbo].[Advertise] (
    [AdvertiseID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(200)  NOT NULL,
    [Position] nvarchar(50)  NOT NULL,
    [Cost] decimal(19,4)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'AppliedJob'
CREATE TABLE [dbo].[AppliedJob] (
    [JobseekerID] nvarchar(128)  NOT NULL,
    [JobID] int  NOT NULL,
    [ProfileID] int  NOT NULL,
    [ApplyDate] datetime  NOT NULL,
    [MatchingPercent] int  NOT NULL,
    [Status] int  NOT NULL,
    [AcceptDate] datetime  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL,
    [User_Id] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [UserId] nvarchar(128)  NOT NULL,
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [UserName] nvarchar(max)  NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [Discriminator] nvarchar(128)  NOT NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Benefit'
CREATE TABLE [dbo].[Benefit] (
    [BenefitID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(100)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Category'
CREATE TABLE [dbo].[Category] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(100)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'City'
CREATE TABLE [dbo].[City] (
    [CityID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'CompanyInfo'
CREATE TABLE [dbo].[CompanyInfo] (
    [RecruiterID] nvarchar(128)  NOT NULL,
    [LogoURL] nvarchar(150)  NULL,
    [Company] nvarchar(100)  NOT NULL,
    [Address] nvarchar(100)  NULL,
    [District] nvarchar(30)  NULL,
    [PhoneNumber] nvarchar(20)  NULL,
    [Description] nvarchar(max)  NULL,
    [IsVisible] bit  NOT NULL
);
GO

-- Creating table 'CompanyInfoCity'
CREATE TABLE [dbo].[CompanyInfoCity] (
    [RecuiterID] nvarchar(128)  NOT NULL,
    [CityID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Contact'
CREATE TABLE [dbo].[Contact] (
    [UserID] nvarchar(128)  NOT NULL,
    [FullName] nvarchar(150)  NOT NULL,
    [Gender] bit  NOT NULL,
    [MaritalStatus] bit  NOT NULL,
    [Nationality] bit  NOT NULL,
    [Address] nvarchar(150)  NULL,
    [DateofBirth] datetime  NOT NULL,
    [PhoneNumber] nvarchar(20)  NOT NULL,
    [AvatarUrl] nvarchar(250)  NULL,
    [CityID] int  NOT NULL,
    [District] nvarchar(20)  NULL,
    [IsVisible] bit  NOT NULL
);
GO

-- Creating table 'DesiredBenefit'
CREATE TABLE [dbo].[DesiredBenefit] (
    [BenefitID] int  NOT NULL,
    [JobseekerID] nvarchar(128)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'EducationHistory'
CREATE TABLE [dbo].[EducationHistory] (
    [EducationHistoryID] int IDENTITY(1,1) NOT NULL,
    [Subject] nvarchar(50)  NOT NULL,
    [School] nvarchar(50)  NOT NULL,
    [SchoolLevel_ID] int  NOT NULL,
    [Achievement] nvarchar(max)  NULL,
    [ProfileID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'EmploymentHistory'
CREATE TABLE [dbo].[EmploymentHistory] (
    [EmploymentHistoryID] int IDENTITY(1,1) NOT NULL,
    [Position] nvarchar(50)  NOT NULL,
    [Company] nvarchar(50)  NOT NULL,
    [WorkingTime] int  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [ProfileID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'ExpectedCategory'
CREATE TABLE [dbo].[ExpectedCategory] (
    [ProfileID] int  NOT NULL,
    [CategoryID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'ExpectedCity'
CREATE TABLE [dbo].[ExpectedCity] (
    [ProfileID] int  NOT NULL,
    [CityID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Job'
CREATE TABLE [dbo].[Job] (
    [JobID] int IDENTITY(1,1) NOT NULL,
    [RecruiterID] nvarchar(128)  NOT NULL,
    [JobTitle] nvarchar(50)  NOT NULL,
    [MinSalary] decimal(19,4)  NULL,
    [MaxSalary] decimal(19,4)  NULL,
    [JobDescription] nvarchar(max)  NOT NULL,
    [JobRequirement] nvarchar(max)  NULL,
    [JobLevel_ID] int  NOT NULL,
    [MinSchoolLevel_ID] int  NOT NULL,
    [JobView] bigint  NOT NULL,
    [StartedDate] datetime  NULL,
    [EndedDate] datetime  NULL,
    [PurchaseJobPackageId] int  NULL,
    [IsPublic] bit  NOT NULL
);
GO

-- Creating table 'JobBenefit'
CREATE TABLE [dbo].[JobBenefit] (
    [BenefitID] int  NOT NULL,
    [JobID] int  NOT NULL,
    [Description] nvarchar(100)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobCategory'
CREATE TABLE [dbo].[JobCategory] (
    [CategoryID] int  NOT NULL,
    [JobID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobCity'
CREATE TABLE [dbo].[JobCity] (
    [JobID] int  NOT NULL,
    [CityID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobLanguage'
CREATE TABLE [dbo].[JobLanguage] (
    [LanguageID] int  NOT NULL,
    [JobID] int  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [MinLevel_ID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobLevel'
CREATE TABLE [dbo].[JobLevel] (
    [JobLevel_ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [LevelNum] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobPackage'
CREATE TABLE [dbo].[JobPackage] (
    [JobPackageID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [JobNumber] int  NOT NULL,
    [PostDuration] int  NOT NULL,
    [IsHighlight] bit  NOT NULL,
    [IsCategoryPriority] bit  NOT NULL,
    [IsHomepagePosting] bit  NOT NULL,
    [ViewMultiNumber] int  NULL,
    [MoreDescription] nvarchar(50)  NOT NULL,
    [Cost] decimal(19,4)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Jobseeker'
CREATE TABLE [dbo].[Jobseeker] (
    [JobseekerID] nvarchar(128)  NOT NULL,
    [FullName] nvarchar(150)  NULL,
    [Email] nvarchar(150)  NOT NULL,
    [PhoneNumber] nvarchar(20)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'JobSkill'
CREATE TABLE [dbo].[JobSkill] (
    [Skill_ID] int  NOT NULL,
    [JobID] int  NOT NULL,
    [Description] nvarchar(100)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Language'
CREATE TABLE [dbo].[Language] (
    [LanguageID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Level'
CREATE TABLE [dbo].[Level] (
    [Level_ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [LevelNum] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Manager'
CREATE TABLE [dbo].[Manager] (
    [ManagerID] nvarchar(128)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Message'
CREATE TABLE [dbo].[Message] (
    [MessageID] int IDENTITY(1,1) NOT NULL,
    [SenderID] nvarchar(128)  NOT NULL,
    [Message_content] nvarchar(max)  NOT NULL,
    [SendTime] datetime  NOT NULL,
    [IsDeletedBySender] bit  NOT NULL,
    [IsCanceled] bit  NOT NULL
);
GO

-- Creating table 'MessageReceiver'
CREATE TABLE [dbo].[MessageReceiver] (
    [MessageID] int  NOT NULL,
    [ReceiverID] nvarchar(128)  NOT NULL,
    [ReadTime] datetime  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'OwnSkill'
CREATE TABLE [dbo].[OwnSkill] (
    [Skill_ID] int  NOT NULL,
    [JobseekerID] nvarchar(128)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Profile'
CREATE TABLE [dbo].[Profile] (
    [ProfileID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [YearOfExperience] int  NOT NULL,
    [HighestSchoolLevel_ID] int  NOT NULL,
    [LanguageID] int  NULL,
    [Level_ID] int  NULL,
    [MostRecentCompany] nvarchar(50)  NULL,
    [MostRecentPosition] nvarchar(50)  NULL,
    [CurrentJobLevel_ID] int  NULL,
    [ExpectedPosition] nvarchar(50)  NOT NULL,
    [ExpectedJobLevel_ID] int  NOT NULL,
    [ExpectedSalary] decimal(19,4)  NOT NULL,
    [CreatedTime] datetime  NOT NULL,
    [UpdatedTime] datetime  NOT NULL,
    [Objectives] nvarchar(max)  NOT NULL,
    [PercentStatus] int  NOT NULL,
    [JobseekerID] nvarchar(128)  NOT NULL,
    [IsActive] bit  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'PurchaseAdvertise'
CREATE TABLE [dbo].[PurchaseAdvertise] (
    [PurchaseAdsID] int IDENTITY(1,1) NOT NULL,
    [AdvertiseID] int  NOT NULL,
    [RecuiterID] nvarchar(128)  NOT NULL,
    [LogoUrl] nvarchar(200)  NOT NULL,
    [LinkUrl] nvarchar(200)  NOT NULL,
    [PurchasedDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [IsVisible] bit  NOT NULL,
    [IsApproved] bit  NULL,
    [ManagerID] nvarchar(128)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'PurchaseJobPackage'
CREATE TABLE [dbo].[PurchaseJobPackage] (
    [PurchaseJobPackageID] int IDENTITY(1,1) NOT NULL,
    [RecruiterID] nvarchar(128)  NOT NULL,
    [JobPackageID] int  NOT NULL,
    [PurchasedDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [IsApproved] bit  NULL,
    [StaffID] nvarchar(128)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Recruiter'
CREATE TABLE [dbo].[Recruiter] (
    [RecruiterID] nvarchar(128)  NOT NULL,
    [Email] nvarchar(150)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'ReferencePerson'
CREATE TABLE [dbo].[ReferencePerson] (
    [ReferencePersonID] int IDENTITY(1,1) NOT NULL,
    [ReferencePersonName] nvarchar(50)  NOT NULL,
    [ReferencePersonPosition] nvarchar(50)  NOT NULL,
    [ReferencePersonCompany] nvarchar(50)  NOT NULL,
    [EmailAddress] nvarchar(100)  NOT NULL,
    [ReferencePersonPhoneNumber] nvarchar(20)  NULL,
    [ProfileID] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Report'
CREATE TABLE [dbo].[Report] (
    [ReportID] int IDENTITY(1,1) NOT NULL,
    [Report_content] nvarchar(max)  NOT NULL,
    [ReferenceLink] nvarchar(200)  NULL,
    [CreatedDate] datetime  NOT NULL,
    [SenderID] nvarchar(128)  NOT NULL,
    [IsSolved] bit  NOT NULL,
    [SolvedUserID] nvarchar(128)  NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'SchoolLevel'
CREATE TABLE [dbo].[SchoolLevel] (
    [SchoolLevel_ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [LevelNum] int  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Skill'
CREATE TABLE [dbo].[Skill] (
    [Skill_ID] int IDENTITY(1,1) NOT NULL,
    [SkillTag] nvarchar(50)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO

-- Creating table 'Staff'
CREATE TABLE [dbo].[Staff] (
    [StaffID] nvarchar(128)  NOT NULL,
    [IsDeleted] bit  NOT NULL
);
GO


GO

-- Creating table 'ViewProfile'
CREATE TABLE [dbo].[ViewProfile] (
    [RecruiterID] nvarchar(128)  NOT NULL,
    [ProfileID] int  NOT NULL,
    [ViewedDate] datetime  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [RoleId] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [AdministratorID] in table 'Administrator'
ALTER TABLE [dbo].[Administrator]
ADD CONSTRAINT [PK_Administrator]
    PRIMARY KEY CLUSTERED ([AdministratorID] ASC);
GO

-- Creating primary key on [AdvertiseID] in table 'Advertise'
ALTER TABLE [dbo].[Advertise]
ADD CONSTRAINT [PK_Advertise]
    PRIMARY KEY CLUSTERED ([AdvertiseID] ASC);
GO

-- Creating primary key on [JobseekerID], [JobID] in table 'AppliedJob'
ALTER TABLE [dbo].[AppliedJob]
ADD CONSTRAINT [PK_AppliedJob]
    PRIMARY KEY CLUSTERED ([JobseekerID], [JobID] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId], [LoginProvider], [ProviderKey] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([UserId], [LoginProvider], [ProviderKey] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BenefitID] in table 'Benefit'
ALTER TABLE [dbo].[Benefit]
ADD CONSTRAINT [PK_Benefit]
    PRIMARY KEY CLUSTERED ([BenefitID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'Category'
ALTER TABLE [dbo].[Category]
ADD CONSTRAINT [PK_Category]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [CityID] in table 'City'
ALTER TABLE [dbo].[City]
ADD CONSTRAINT [PK_City]
    PRIMARY KEY CLUSTERED ([CityID] ASC);
GO

-- Creating primary key on [RecruiterID] in table 'CompanyInfo'
ALTER TABLE [dbo].[CompanyInfo]
ADD CONSTRAINT [PK_CompanyInfo]
    PRIMARY KEY CLUSTERED ([RecruiterID] ASC);
GO

-- Creating primary key on [RecuiterID], [CityID] in table 'CompanyInfoCity'
ALTER TABLE [dbo].[CompanyInfoCity]
ADD CONSTRAINT [PK_CompanyInfoCity]
    PRIMARY KEY CLUSTERED ([RecuiterID], [CityID] ASC);
GO

-- Creating primary key on [UserID] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [PK_Contact]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [BenefitID], [JobseekerID] in table 'DesiredBenefit'
ALTER TABLE [dbo].[DesiredBenefit]
ADD CONSTRAINT [PK_DesiredBenefit]
    PRIMARY KEY CLUSTERED ([BenefitID], [JobseekerID] ASC);
GO

-- Creating primary key on [EducationHistoryID] in table 'EducationHistory'
ALTER TABLE [dbo].[EducationHistory]
ADD CONSTRAINT [PK_EducationHistory]
    PRIMARY KEY CLUSTERED ([EducationHistoryID] ASC);
GO

-- Creating primary key on [EmploymentHistoryID] in table 'EmploymentHistory'
ALTER TABLE [dbo].[EmploymentHistory]
ADD CONSTRAINT [PK_EmploymentHistory]
    PRIMARY KEY CLUSTERED ([EmploymentHistoryID] ASC);
GO

-- Creating primary key on [ProfileID], [CategoryID] in table 'ExpectedCategory'
ALTER TABLE [dbo].[ExpectedCategory]
ADD CONSTRAINT [PK_ExpectedCategory]
    PRIMARY KEY CLUSTERED ([ProfileID], [CategoryID] ASC);
GO

-- Creating primary key on [ProfileID], [CityID] in table 'ExpectedCity'
ALTER TABLE [dbo].[ExpectedCity]
ADD CONSTRAINT [PK_ExpectedCity]
    PRIMARY KEY CLUSTERED ([ProfileID], [CityID] ASC);
GO

-- Creating primary key on [JobID] in table 'Job'
ALTER TABLE [dbo].[Job]
ADD CONSTRAINT [PK_Job]
    PRIMARY KEY CLUSTERED ([JobID] ASC);
GO

-- Creating primary key on [BenefitID], [JobID] in table 'JobBenefit'
ALTER TABLE [dbo].[JobBenefit]
ADD CONSTRAINT [PK_JobBenefit]
    PRIMARY KEY CLUSTERED ([BenefitID], [JobID] ASC);
GO

-- Creating primary key on [CategoryID], [JobID] in table 'JobCategory'
ALTER TABLE [dbo].[JobCategory]
ADD CONSTRAINT [PK_JobCategory]
    PRIMARY KEY CLUSTERED ([CategoryID], [JobID] ASC);
GO

-- Creating primary key on [JobID], [CityID] in table 'JobCity'
ALTER TABLE [dbo].[JobCity]
ADD CONSTRAINT [PK_JobCity]
    PRIMARY KEY CLUSTERED ([JobID], [CityID] ASC);
GO

-- Creating primary key on [LanguageID], [JobID] in table 'JobLanguage'
ALTER TABLE [dbo].[JobLanguage]
ADD CONSTRAINT [PK_JobLanguage]
    PRIMARY KEY CLUSTERED ([LanguageID], [JobID] ASC);
GO

-- Creating primary key on [JobLevel_ID] in table 'JobLevel'
ALTER TABLE [dbo].[JobLevel]
ADD CONSTRAINT [PK_JobLevel]
    PRIMARY KEY CLUSTERED ([JobLevel_ID] ASC);
GO

-- Creating primary key on [JobPackageID] in table 'JobPackage'
ALTER TABLE [dbo].[JobPackage]
ADD CONSTRAINT [PK_JobPackage]
    PRIMARY KEY CLUSTERED ([JobPackageID] ASC);
GO

-- Creating primary key on [JobseekerID] in table 'Jobseeker'
ALTER TABLE [dbo].[Jobseeker]
ADD CONSTRAINT [PK_Jobseeker]
    PRIMARY KEY CLUSTERED ([JobseekerID] ASC);
GO

-- Creating primary key on [Skill_ID], [JobID] in table 'JobSkill'
ALTER TABLE [dbo].[JobSkill]
ADD CONSTRAINT [PK_JobSkill]
    PRIMARY KEY CLUSTERED ([Skill_ID], [JobID] ASC);
GO

-- Creating primary key on [LanguageID] in table 'Language'
ALTER TABLE [dbo].[Language]
ADD CONSTRAINT [PK_Language]
    PRIMARY KEY CLUSTERED ([LanguageID] ASC);
GO

-- Creating primary key on [Level_ID] in table 'Level'
ALTER TABLE [dbo].[Level]
ADD CONSTRAINT [PK_Level]
    PRIMARY KEY CLUSTERED ([Level_ID] ASC);
GO

-- Creating primary key on [ManagerID] in table 'Manager'
ALTER TABLE [dbo].[Manager]
ADD CONSTRAINT [PK_Manager]
    PRIMARY KEY CLUSTERED ([ManagerID] ASC);
GO

-- Creating primary key on [MessageID] in table 'Message'
ALTER TABLE [dbo].[Message]
ADD CONSTRAINT [PK_Message]
    PRIMARY KEY CLUSTERED ([MessageID] ASC);
GO

-- Creating primary key on [MessageID], [ReceiverID] in table 'MessageReceiver'
ALTER TABLE [dbo].[MessageReceiver]
ADD CONSTRAINT [PK_MessageReceiver]
    PRIMARY KEY CLUSTERED ([MessageID], [ReceiverID] ASC);
GO

-- Creating primary key on [Skill_ID], [JobseekerID] in table 'OwnSkill'
ALTER TABLE [dbo].[OwnSkill]
ADD CONSTRAINT [PK_OwnSkill]
    PRIMARY KEY CLUSTERED ([Skill_ID], [JobseekerID] ASC);
GO

-- Creating primary key on [ProfileID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [PK_Profile]
    PRIMARY KEY CLUSTERED ([ProfileID] ASC);
GO

-- Creating primary key on [PurchaseAdsID] in table 'PurchaseAdvertise'
ALTER TABLE [dbo].[PurchaseAdvertise]
ADD CONSTRAINT [PK_PurchaseAdvertise]
    PRIMARY KEY CLUSTERED ([PurchaseAdsID] ASC);
GO

-- Creating primary key on [PurchaseJobPackageID] in table 'PurchaseJobPackage'
ALTER TABLE [dbo].[PurchaseJobPackage]
ADD CONSTRAINT [PK_PurchaseJobPackage]
    PRIMARY KEY CLUSTERED ([PurchaseJobPackageID] ASC);
GO

-- Creating primary key on [RecruiterID] in table 'Recruiter'
ALTER TABLE [dbo].[Recruiter]
ADD CONSTRAINT [PK_Recruiter]
    PRIMARY KEY CLUSTERED ([RecruiterID] ASC);
GO

-- Creating primary key on [ReferencePersonID] in table 'ReferencePerson'
ALTER TABLE [dbo].[ReferencePerson]
ADD CONSTRAINT [PK_ReferencePerson]
    PRIMARY KEY CLUSTERED ([ReferencePersonID] ASC);
GO

-- Creating primary key on [ReportID] in table 'Report'
ALTER TABLE [dbo].[Report]
ADD CONSTRAINT [PK_Report]
    PRIMARY KEY CLUSTERED ([ReportID] ASC);
GO

-- Creating primary key on [SchoolLevel_ID] in table 'SchoolLevel'
ALTER TABLE [dbo].[SchoolLevel]
ADD CONSTRAINT [PK_SchoolLevel]
    PRIMARY KEY CLUSTERED ([SchoolLevel_ID] ASC);
GO

-- Creating primary key on [Skill_ID] in table 'Skill'
ALTER TABLE [dbo].[Skill]
ADD CONSTRAINT [PK_Skill]
    PRIMARY KEY CLUSTERED ([Skill_ID] ASC);
GO

-- Creating primary key on [StaffID] in table 'Staff'
ALTER TABLE [dbo].[Staff]
ADD CONSTRAINT [PK_Staff]
    PRIMARY KEY CLUSTERED ([StaffID] ASC);
GO


-- Creating primary key on [RecruiterID], [ProfileID] in table 'ViewProfile'
ALTER TABLE [dbo].[ViewProfile]
ADD CONSTRAINT [PK_ViewProfile]
    PRIMARY KEY CLUSTERED ([RecruiterID], [ProfileID] ASC);
GO

-- Creating primary key on [RoleId], [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([RoleId], [UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AdministratorID] in table 'Administrator'
ALTER TABLE [dbo].[Administrator]
ADD CONSTRAINT [FK_Administrator_AspNetUsers]
    FOREIGN KEY ([AdministratorID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AdvertiseID] in table 'PurchaseAdvertise'
ALTER TABLE [dbo].[PurchaseAdvertise]
ADD CONSTRAINT [FK_PurchaseAdvertise_Advertise]
    FOREIGN KEY ([AdvertiseID])
    REFERENCES [dbo].[Advertise]
        ([AdvertiseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseAdvertise_Advertise'
CREATE INDEX [IX_FK_PurchaseAdvertise_Advertise]
ON [dbo].[PurchaseAdvertise]
    ([AdvertiseID]);
GO

-- Creating foreign key on [JobID] in table 'AppliedJob'
ALTER TABLE [dbo].[AppliedJob]
ADD CONSTRAINT [FK_AppliedJob_Job]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AppliedJob_Job'
CREATE INDEX [IX_FK_AppliedJob_Job]
ON [dbo].[AppliedJob]
    ([JobID]);
GO

-- Creating foreign key on [JobseekerID] in table 'AppliedJob'
ALTER TABLE [dbo].[AppliedJob]
ADD CONSTRAINT [FK_AppliedJob_Jobseeker]
    FOREIGN KEY ([JobseekerID])
    REFERENCES [dbo].[Jobseeker]
        ([JobseekerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProfileID] in table 'AppliedJob'
ALTER TABLE [dbo].[AppliedJob]
ADD CONSTRAINT [FK_AppliedJob_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AppliedJob_Profile'
CREATE INDEX [IX_FK_AppliedJob_Profile]
ON [dbo].[AppliedJob]
    ([ProfileID]);
GO

-- Creating foreign key on [User_Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_User_Id]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_User_Id'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_User_Id]
ON [dbo].[AspNetUserClaims]
    ([User_Id]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserID] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [FK_Contact_AspNetUsers]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [JobseekerID] in table 'Jobseeker'
ALTER TABLE [dbo].[Jobseeker]
ADD CONSTRAINT [FK_Jobseeker_AspNetUsers]
    FOREIGN KEY ([JobseekerID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ManagerID] in table 'Manager'
ALTER TABLE [dbo].[Manager]
ADD CONSTRAINT [FK_Manager_AspNetUsers]
    FOREIGN KEY ([ManagerID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SenderID] in table 'Message'
ALTER TABLE [dbo].[Message]
ADD CONSTRAINT [FK_Message_AspNetUsers]
    FOREIGN KEY ([SenderID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Message_AspNetUsers'
CREATE INDEX [IX_FK_Message_AspNetUsers]
ON [dbo].[Message]
    ([SenderID]);
GO

-- Creating foreign key on [ReceiverID] in table 'MessageReceiver'
ALTER TABLE [dbo].[MessageReceiver]
ADD CONSTRAINT [FK_MessageReceiver_AspNetUsers]
    FOREIGN KEY ([ReceiverID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MessageReceiver_AspNetUsers'
CREATE INDEX [IX_FK_MessageReceiver_AspNetUsers]
ON [dbo].[MessageReceiver]
    ([ReceiverID]);
GO

-- Creating foreign key on [RecruiterID] in table 'Recruiter'
ALTER TABLE [dbo].[Recruiter]
ADD CONSTRAINT [FK_Recruiter_AspNetUsers]
    FOREIGN KEY ([RecruiterID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SenderID] in table 'Report'
ALTER TABLE [dbo].[Report]
ADD CONSTRAINT [FK_Report_AspNetUsers]
    FOREIGN KEY ([SenderID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_AspNetUsers'
CREATE INDEX [IX_FK_Report_AspNetUsers]
ON [dbo].[Report]
    ([SenderID]);
GO

-- Creating foreign key on [SolvedUserID] in table 'Report'
ALTER TABLE [dbo].[Report]
ADD CONSTRAINT [FK_Report_AspNetUsers1]
    FOREIGN KEY ([SolvedUserID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Report_AspNetUsers1'
CREATE INDEX [IX_FK_Report_AspNetUsers1]
ON [dbo].[Report]
    ([SolvedUserID]);
GO

-- Creating foreign key on [StaffID] in table 'Staff'
ALTER TABLE [dbo].[Staff]
ADD CONSTRAINT [FK_Staff_AspNetUsers]
    FOREIGN KEY ([StaffID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO






-- Creating foreign key on [BenefitID] in table 'DesiredBenefit'
ALTER TABLE [dbo].[DesiredBenefit]
ADD CONSTRAINT [FK_DesiredBenefit_Benefit]
    FOREIGN KEY ([BenefitID])
    REFERENCES [dbo].[Benefit]
        ([BenefitID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BenefitID] in table 'JobBenefit'
ALTER TABLE [dbo].[JobBenefit]
ADD CONSTRAINT [FK_JobBenefit_Benefit]
    FOREIGN KEY ([BenefitID])
    REFERENCES [dbo].[Benefit]
        ([BenefitID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CategoryID] in table 'ExpectedCategory'
ALTER TABLE [dbo].[ExpectedCategory]
ADD CONSTRAINT [FK_ExpectedCategory_Category]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Category]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExpectedCategory_Category'
CREATE INDEX [IX_FK_ExpectedCategory_Category]
ON [dbo].[ExpectedCategory]
    ([CategoryID]);
GO

-- Creating foreign key on [CategoryID] in table 'JobCategory'
ALTER TABLE [dbo].[JobCategory]
ADD CONSTRAINT [FK_JobCategory_Category]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Category]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CityID] in table 'CompanyInfoCity'
ALTER TABLE [dbo].[CompanyInfoCity]
ADD CONSTRAINT [FK_CompanyInfoCity_City]
    FOREIGN KEY ([CityID])
    REFERENCES [dbo].[City]
        ([CityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CompanyInfoCity_City'
CREATE INDEX [IX_FK_CompanyInfoCity_City]
ON [dbo].[CompanyInfoCity]
    ([CityID]);
GO

-- Creating foreign key on [CityID] in table 'Contact'
ALTER TABLE [dbo].[Contact]
ADD CONSTRAINT [FK_Contact_City]
    FOREIGN KEY ([CityID])
    REFERENCES [dbo].[City]
        ([CityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Contact_City'
CREATE INDEX [IX_FK_Contact_City]
ON [dbo].[Contact]
    ([CityID]);
GO

-- Creating foreign key on [CityID] in table 'ExpectedCity'
ALTER TABLE [dbo].[ExpectedCity]
ADD CONSTRAINT [FK_ExpectedCity_City]
    FOREIGN KEY ([CityID])
    REFERENCES [dbo].[City]
        ([CityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ExpectedCity_City'
CREATE INDEX [IX_FK_ExpectedCity_City]
ON [dbo].[ExpectedCity]
    ([CityID]);
GO

-- Creating foreign key on [CityID] in table 'JobCity'
ALTER TABLE [dbo].[JobCity]
ADD CONSTRAINT [FK_JobCity_City]
    FOREIGN KEY ([CityID])
    REFERENCES [dbo].[City]
        ([CityID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobCity_City'
CREATE INDEX [IX_FK_JobCity_City]
ON [dbo].[JobCity]
    ([CityID]);
GO

-- Creating foreign key on [RecruiterID] in table 'CompanyInfo'
ALTER TABLE [dbo].[CompanyInfo]
ADD CONSTRAINT [FK_CompanyInfo_Recruiter]
    FOREIGN KEY ([RecruiterID])
    REFERENCES [dbo].[Recruiter]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RecuiterID] in table 'CompanyInfoCity'
ALTER TABLE [dbo].[CompanyInfoCity]
ADD CONSTRAINT [FK_CompanyInfoCity_CompanyInfo]
    FOREIGN KEY ([RecuiterID])
    REFERENCES [dbo].[CompanyInfo]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [JobseekerID] in table 'DesiredBenefit'
ALTER TABLE [dbo].[DesiredBenefit]
ADD CONSTRAINT [FK_DesiredBenefit_Jobseeker]
    FOREIGN KEY ([JobseekerID])
    REFERENCES [dbo].[Jobseeker]
        ([JobseekerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DesiredBenefit_Jobseeker'
CREATE INDEX [IX_FK_DesiredBenefit_Jobseeker]
ON [dbo].[DesiredBenefit]
    ([JobseekerID]);
GO

-- Creating foreign key on [ProfileID] in table 'EducationHistory'
ALTER TABLE [dbo].[EducationHistory]
ADD CONSTRAINT [FK_EducationHistory_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EducationHistory_Profile'
CREATE INDEX [IX_FK_EducationHistory_Profile]
ON [dbo].[EducationHistory]
    ([ProfileID]);
GO

-- Creating foreign key on [SchoolLevel_ID] in table 'EducationHistory'
ALTER TABLE [dbo].[EducationHistory]
ADD CONSTRAINT [FK_EducationHistory_SchoolLevel]
    FOREIGN KEY ([SchoolLevel_ID])
    REFERENCES [dbo].[SchoolLevel]
        ([SchoolLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EducationHistory_SchoolLevel'
CREATE INDEX [IX_FK_EducationHistory_SchoolLevel]
ON [dbo].[EducationHistory]
    ([SchoolLevel_ID]);
GO

-- Creating foreign key on [ProfileID] in table 'EmploymentHistory'
ALTER TABLE [dbo].[EmploymentHistory]
ADD CONSTRAINT [FK_EmploymentHistory_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmploymentHistory_Profile'
CREATE INDEX [IX_FK_EmploymentHistory_Profile]
ON [dbo].[EmploymentHistory]
    ([ProfileID]);
GO

-- Creating foreign key on [ProfileID] in table 'ExpectedCategory'
ALTER TABLE [dbo].[ExpectedCategory]
ADD CONSTRAINT [FK_ExpectedCategory_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ProfileID] in table 'ExpectedCity'
ALTER TABLE [dbo].[ExpectedCity]
ADD CONSTRAINT [FK_ExpectedCity_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [JobLevel_ID] in table 'Job'
ALTER TABLE [dbo].[Job]
ADD CONSTRAINT [FK_Job_JobLevel]
    FOREIGN KEY ([JobLevel_ID])
    REFERENCES [dbo].[JobLevel]
        ([JobLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Job_JobLevel'
CREATE INDEX [IX_FK_Job_JobLevel]
ON [dbo].[Job]
    ([JobLevel_ID]);
GO

-- Creating foreign key on [PurchaseJobPackageId] in table 'Job'
ALTER TABLE [dbo].[Job]
ADD CONSTRAINT [FK_Job_PurchaseJobPackage]
    FOREIGN KEY ([PurchaseJobPackageId])
    REFERENCES [dbo].[PurchaseJobPackage]
        ([PurchaseJobPackageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Job_PurchaseJobPackage'
CREATE INDEX [IX_FK_Job_PurchaseJobPackage]
ON [dbo].[Job]
    ([PurchaseJobPackageId]);
GO

-- Creating foreign key on [RecruiterID] in table 'Job'
ALTER TABLE [dbo].[Job]
ADD CONSTRAINT [FK_Job_Recruiter]
    FOREIGN KEY ([RecruiterID])
    REFERENCES [dbo].[Recruiter]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Job_Recruiter'
CREATE INDEX [IX_FK_Job_Recruiter]
ON [dbo].[Job]
    ([RecruiterID]);
GO

-- Creating foreign key on [MinSchoolLevel_ID] in table 'Job'
ALTER TABLE [dbo].[Job]
ADD CONSTRAINT [FK_Job_SchoolLevel]
    FOREIGN KEY ([MinSchoolLevel_ID])
    REFERENCES [dbo].[SchoolLevel]
        ([SchoolLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Job_SchoolLevel'
CREATE INDEX [IX_FK_Job_SchoolLevel]
ON [dbo].[Job]
    ([MinSchoolLevel_ID]);
GO

-- Creating foreign key on [JobID] in table 'JobBenefit'
ALTER TABLE [dbo].[JobBenefit]
ADD CONSTRAINT [FK_JobBenefit_Job]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobBenefit_Job'
CREATE INDEX [IX_FK_JobBenefit_Job]
ON [dbo].[JobBenefit]
    ([JobID]);
GO

-- Creating foreign key on [JobID] in table 'JobCategory'
ALTER TABLE [dbo].[JobCategory]
ADD CONSTRAINT [FK_JobCategory_Job]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobCategory_Job'
CREATE INDEX [IX_FK_JobCategory_Job]
ON [dbo].[JobCategory]
    ([JobID]);
GO

-- Creating foreign key on [JobID] in table 'JobCity'
ALTER TABLE [dbo].[JobCity]
ADD CONSTRAINT [FK_JobCity_Job]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [JobID] in table 'JobLanguage'
ALTER TABLE [dbo].[JobLanguage]
ADD CONSTRAINT [FK_JobLanguage_Job1]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobLanguage_Job1'
CREATE INDEX [IX_FK_JobLanguage_Job1]
ON [dbo].[JobLanguage]
    ([JobID]);
GO

-- Creating foreign key on [JobID] in table 'JobSkill'
ALTER TABLE [dbo].[JobSkill]
ADD CONSTRAINT [FK_Jobkill_Job1]
    FOREIGN KEY ([JobID])
    REFERENCES [dbo].[Job]
        ([JobID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Jobkill_Job1'
CREATE INDEX [IX_FK_Jobkill_Job1]
ON [dbo].[JobSkill]
    ([JobID]);
GO

-- Creating foreign key on [LanguageID] in table 'JobLanguage'
ALTER TABLE [dbo].[JobLanguage]
ADD CONSTRAINT [FK_JobLanguage_Language]
    FOREIGN KEY ([LanguageID])
    REFERENCES [dbo].[Language]
        ([LanguageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MinLevel_ID] in table 'JobLanguage'
ALTER TABLE [dbo].[JobLanguage]
ADD CONSTRAINT [FK_JobLanguage_Level]
    FOREIGN KEY ([MinLevel_ID])
    REFERENCES [dbo].[Level]
        ([Level_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_JobLanguage_Level'
CREATE INDEX [IX_FK_JobLanguage_Level]
ON [dbo].[JobLanguage]
    ([MinLevel_ID]);
GO

-- Creating foreign key on [CurrentJobLevel_ID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_JobLevel]
    FOREIGN KEY ([CurrentJobLevel_ID])
    REFERENCES [dbo].[JobLevel]
        ([JobLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_JobLevel'
CREATE INDEX [IX_FK_Profile_JobLevel]
ON [dbo].[Profile]
    ([CurrentJobLevel_ID]);
GO

-- Creating foreign key on [ExpectedJobLevel_ID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_JobLevel1]
    FOREIGN KEY ([ExpectedJobLevel_ID])
    REFERENCES [dbo].[JobLevel]
        ([JobLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_JobLevel1'
CREATE INDEX [IX_FK_Profile_JobLevel1]
ON [dbo].[Profile]
    ([ExpectedJobLevel_ID]);
GO

-- Creating foreign key on [JobPackageID] in table 'PurchaseJobPackage'
ALTER TABLE [dbo].[PurchaseJobPackage]
ADD CONSTRAINT [FK_PurchaseJobPackage_JobPackage]
    FOREIGN KEY ([JobPackageID])
    REFERENCES [dbo].[JobPackage]
        ([JobPackageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseJobPackage_JobPackage'
CREATE INDEX [IX_FK_PurchaseJobPackage_JobPackage]
ON [dbo].[PurchaseJobPackage]
    ([JobPackageID]);
GO

-- Creating foreign key on [JobseekerID] in table 'OwnSkill'
ALTER TABLE [dbo].[OwnSkill]
ADD CONSTRAINT [FK_OwnSkill_Jobseeker]
    FOREIGN KEY ([JobseekerID])
    REFERENCES [dbo].[Jobseeker]
        ([JobseekerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OwnSkill_Jobseeker'
CREATE INDEX [IX_FK_OwnSkill_Jobseeker]
ON [dbo].[OwnSkill]
    ([JobseekerID]);
GO

-- Creating foreign key on [JobseekerID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_Jobseeker]
    FOREIGN KEY ([JobseekerID])
    REFERENCES [dbo].[Jobseeker]
        ([JobseekerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_Jobseeker'
CREATE INDEX [IX_FK_Profile_Jobseeker]
ON [dbo].[Profile]
    ([JobseekerID]);
GO

-- Creating foreign key on [Skill_ID] in table 'JobSkill'
ALTER TABLE [dbo].[JobSkill]
ADD CONSTRAINT [FK_Jobkill_Skill]
    FOREIGN KEY ([Skill_ID])
    REFERENCES [dbo].[Skill]
        ([Skill_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [LanguageID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_Language]
    FOREIGN KEY ([LanguageID])
    REFERENCES [dbo].[Language]
        ([LanguageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_Language'
CREATE INDEX [IX_FK_Profile_Language]
ON [dbo].[Profile]
    ([LanguageID]);
GO

-- Creating foreign key on [Level_ID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_Level]
    FOREIGN KEY ([Level_ID])
    REFERENCES [dbo].[Level]
        ([Level_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_Level'
CREATE INDEX [IX_FK_Profile_Level]
ON [dbo].[Profile]
    ([Level_ID]);
GO

-- Creating foreign key on [ManagerID] in table 'PurchaseAdvertise'
ALTER TABLE [dbo].[PurchaseAdvertise]
ADD CONSTRAINT [FK_PurchaseAdvertise_Manager]
    FOREIGN KEY ([ManagerID])
    REFERENCES [dbo].[Manager]
        ([ManagerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseAdvertise_Manager'
CREATE INDEX [IX_FK_PurchaseAdvertise_Manager]
ON [dbo].[PurchaseAdvertise]
    ([ManagerID]);
GO

-- Creating foreign key on [MessageID] in table 'MessageReceiver'
ALTER TABLE [dbo].[MessageReceiver]
ADD CONSTRAINT [FK_MessageReceiver_Message]
    FOREIGN KEY ([MessageID])
    REFERENCES [dbo].[Message]
        ([MessageID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Skill_ID] in table 'OwnSkill'
ALTER TABLE [dbo].[OwnSkill]
ADD CONSTRAINT [FK_OwnSkill_Skill]
    FOREIGN KEY ([Skill_ID])
    REFERENCES [dbo].[Skill]
        ([Skill_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [HighestSchoolLevel_ID] in table 'Profile'
ALTER TABLE [dbo].[Profile]
ADD CONSTRAINT [FK_Profile_SchoolLevel]
    FOREIGN KEY ([HighestSchoolLevel_ID])
    REFERENCES [dbo].[SchoolLevel]
        ([SchoolLevel_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Profile_SchoolLevel'
CREATE INDEX [IX_FK_Profile_SchoolLevel]
ON [dbo].[Profile]
    ([HighestSchoolLevel_ID]);
GO

-- Creating foreign key on [ProfileID] in table 'ReferencePerson'
ALTER TABLE [dbo].[ReferencePerson]
ADD CONSTRAINT [FK_ReferencePerson_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReferencePerson_Profile'
CREATE INDEX [IX_FK_ReferencePerson_Profile]
ON [dbo].[ReferencePerson]
    ([ProfileID]);
GO

-- Creating foreign key on [ProfileID] in table 'ViewProfile'
ALTER TABLE [dbo].[ViewProfile]
ADD CONSTRAINT [FK_ViewProfile_Profile]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[Profile]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ViewProfile_Profile'
CREATE INDEX [IX_FK_ViewProfile_Profile]
ON [dbo].[ViewProfile]
    ([ProfileID]);
GO

-- Creating foreign key on [RecuiterID] in table 'PurchaseAdvertise'
ALTER TABLE [dbo].[PurchaseAdvertise]
ADD CONSTRAINT [FK_PurchaseAdvertise_Recruiter]
    FOREIGN KEY ([RecuiterID])
    REFERENCES [dbo].[Recruiter]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseAdvertise_Recruiter'
CREATE INDEX [IX_FK_PurchaseAdvertise_Recruiter]
ON [dbo].[PurchaseAdvertise]
    ([RecuiterID]);
GO

-- Creating foreign key on [RecruiterID] in table 'PurchaseJobPackage'
ALTER TABLE [dbo].[PurchaseJobPackage]
ADD CONSTRAINT [FK_PurchaseJobPackage_Recruiter]
    FOREIGN KEY ([RecruiterID])
    REFERENCES [dbo].[Recruiter]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseJobPackage_Recruiter'
CREATE INDEX [IX_FK_PurchaseJobPackage_Recruiter]
ON [dbo].[PurchaseJobPackage]
    ([RecruiterID]);
GO

-- Creating foreign key on [StaffID] in table 'PurchaseJobPackage'
ALTER TABLE [dbo].[PurchaseJobPackage]
ADD CONSTRAINT [FK_PurchaseJobPackage_Staff]
    FOREIGN KEY ([StaffID])
    REFERENCES [dbo].[Staff]
        ([StaffID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PurchaseJobPackage_Staff'
CREATE INDEX [IX_FK_PurchaseJobPackage_Staff]
ON [dbo].[PurchaseJobPackage]
    ([StaffID]);
GO

-- Creating foreign key on [RecruiterID] in table 'ViewProfile'
ALTER TABLE [dbo].[ViewProfile]
ADD CONSTRAINT [FK_ViewProfile_Recruiter]
    FOREIGN KEY ([RecruiterID])
    REFERENCES [dbo].[Recruiter]
        ([RecruiterID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RoleId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [UserId] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([UserId]);
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsActive]  DEFAULT ((1)) FOR [IsActive]

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------




-- --------------------------------------------------
-- Data
-- --------------------------------------------------
SET IDENTITY_INSERT [dbo].[Advertise] ON 

INSERT [dbo].[Advertise] ([AdvertiseID], [Name], [Description], [Position], [Cost], [IsDeleted]) VALUES (1, N'Silver', N'Logo được đặt dưới danh sách các công việc', N'C', 500000.0000, 0)
INSERT [dbo].[Advertise] ([AdvertiseID], [Name], [Description], [Position], [Cost], [IsDeleted]) VALUES (2, N'Gold', N'Logo được đặt bên phải dưới danh sách các việc', N'B', 1000000.0000, 0)
INSERT [dbo].[Advertise] ([AdvertiseID], [Name], [Description], [Position], [Cost], [IsDeleted]) VALUES (3, N'Diamond', N'Logo được đặt trên danh sách các công việc', N'A', 2000000.0000, 0)
SET IDENTITY_INSERT [dbo].[Advertise] OFF

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'acf645c0-8e7e-40b0-b5c3-35928c992290', N'admin', N'AGn4HpgXOxmDuXTVst4e/tv2k9N5niyvQZtLIS9XErs/nGNl5L1L++rfqXYpDwQ8XQ==', N'0d8cbae0-eb1b-40df-88d7-4761dc8b1907', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', N'viettel', N'ANDTCM+6Kxv8bRUPQJVsAlU9nrrIg+M/l8expnpXwihERtQVTqexX+kimf+NSOD7tA==', N'82233eed-59ff-48fe-babc-ec9d9a71799d', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'2c6c4ab1-feb7-49fc-a84e-7fbf9736e7fc', N'manager', N'APUZvbR7ZzDh84Qm+1gkpT7HnP+GY8amApLsOf0LP2UDVtuz/AqmgVg+AEI9rR3e9Q==', N'67a8b31a-bfbc-4c2e-9664-23f2c421a34f', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'huyenntm', N'APU+uu7Ca0fWU9576qzq74R5lYoykvuUsWDH8ExxlRQ6G4KX2NVNAqTekMDmE4D1Yw==', N'c8a78fab-1d6f-4014-9c6f-41a543c4f52a', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'37d45b06-05ae-4052-814c-b08f880d817b', N'Hakun2', N'AA/U6ivl0qALHV1VueWMI+uaqaCiL+LZcYUyR5BvBgxUMkYbv3i1Pr+LgdgzM/3ZCA==', N'346d912e-74b6-4f58-a8c7-05842f2581b0', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'65a04840-cb58-49c5-9d6d-f27f4cf9b312', N'taihd', N'AJRvF4XzWHeEQ8d7gjeVRAwpW9C4yrgbZCzszewvJbfl9Gzus3kdBqJL8QzULem8Ug==', N'ad467ccf-4ffe-4932-a96b-d95de93b411f', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', N'sonnt', N'AI28qCRl8QfTuYm6SxUEbisBGdlmFs+pOatydU1I7wWcptkcQYcaDKeqGMUPYQDcmQ==', N'5caf2581-383b-42a7-b997-15e2602edb06', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'81191c51-a897-424a-a0c5-6ccaece30c01', N'recruiter', N'ANTppt7ndKVys+7T3yikVFNyllixa3pt2JiQy6CrlGsbgaIxRurtdlMmdrUQ0rPmZw==', N'907c76b3-b471-4b7d-87cc-257cad9fcbce', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', N'Jobseeker', N'AKPoie3N9TCXvvkdWHkEOYXpi6fOKSL5b4fQDnt5Q4/6GRM0Lia30SC0JYczuZ4sHA==', N'5d52ee85-0581-4134-8a01-ce7841ca741b', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'a65e0cb1-6d3a-4b14-81b1-91c049695a11', N'staff', N'AJxcyh/FnWDoCR8CAjxrtuFYJtnH2Gnr3FncQtMv5yaeVTZ3C5DTAnxKuyTCxZD62A==', N'8bc21103-7f49-445a-9bf0-ab922d20a5a8', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', N'taihd2', N'AJrNO7W0EUE+kDdENehPVC/0Tp99Gx3sdyvM9Is1qRPyfxuv/jm1erRFDA/1XNa4Kw==', N'286e4cbb-b95b-475c-978d-563ac53330bb', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'dd2c5dd0-fd5b-4cbb-856b-ae1d6efc9e66', N'hhhhhhhh', N'AFkfA2l8MLgS8f7YivOGXPE5GByH5g0t73b0ZEgyupR/LQxfAt/g+5FTp2RcC1MKoA==', N'9daadb92-a630-456f-bc2c-3df50f026a60', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'eca39106-581b-4a2e-966b-0195805c1b59', N'fptsoftware', N'AGBP0QJ9CR942tTNlIoJGtDfgyvPUUQLHcDL/RAIMS9SAMvvbKTtfM9O6t3oS8W+VQ==', N'6ec5976b-1cdd-4b46-99e2-d6e628d80724', N'ApplicationUser', 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator], [IsActive]) VALUES (N'fea1e564-eb37-45b3-8550-355ae00d10ac', N'trhtrh', N'AKYdYPMKr82+XFNM4w4s/UctX7yiaVK7nDsvdRP1P6RF18S2vqQSufkbjPiq3FXq5A==', N'ac893cac-da73-46fe-8b30-7686b4c2dc9a', N'ApplicationUser', 1)


INSERT [dbo].[Manager] ([ManagerID], [IsDeleted]) VALUES (N'2c6c4ab1-feb7-49fc-a84e-7fbf9736e7fc', 0)


INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', N'viettel@gmail.com', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'37d45b06-05ae-4052-814c-b08f880d817b', N'thiennnse90129@fpt.edu.vn', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', N'sonnt@gmail.com', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'81191c51-a897-424a-a0c5-6ccaece30c01', N'taihdse60630@fpt.edu.vn', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'dd2c5dd0-fd5b-4cbb-856b-ae1d6efc9e66', N'abc@gmail.com', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'eca39106-581b-4a2e-966b-0195805c1b59', N'fptsoftware@fsoft.com.vn', 0)
INSERT [dbo].[Recruiter] ([RecruiterID], [Email], [IsDeleted]) VALUES (N'fea1e564-eb37-45b3-8550-355ae00d10ac', N'abc@gmail.com', 0)



SET IDENTITY_INSERT [dbo].[PurchaseAdvertise] ON 

INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1001, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/Content/img/logofsoft.png', N'/Job/Detail/?jobID=6', CAST(0x0000A4E50008CB70 AS DateTime), CAST(0x0000A5030008CB70 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1002, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/Content/img/logofsoft.png', N'/Job/Detail/?jobID=6', CAST(0x0000A4E201089F07 AS DateTime), CAST(0x0000A50001089F07 AS DateTime), 0, 0, NULL, 1)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1003, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/Content/img/logofsoft.png', N'/Job/Detail/?jobID=6', CAST(0x0000A4E201089F0E AS DateTime), CAST(0x0000A50001089F0E AS DateTime), 0, 0, NULL, 1)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1004, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/Content/img/logofsoft.png', N'/Job/Detail/?jobID=6', CAST(0x0000A4E50008CB79 AS DateTime), CAST(0x0000A5030008CB79 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1005, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'http://www.london-luton.co.uk/uploads/gfx/146.gif', N'/Job/Detail/?jobID=6', CAST(0x0000A4E50008CB7E AS DateTime), CAST(0x0000A5030008CB7E AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1006, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'http://vnpay.vn/Uploads/images/Logo/Logo%20ngan%20hang/Logo%20tpbank.jpg', N'/Job/Detail/?jobID=6', CAST(0x0000A4E50008CB82 AS DateTime), CAST(0x0000A5030008CB82 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1007, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'http://core0.staticworld.net/images/article/2013/03/microsoft_logo-100029828-gallery.jpg', N'/Job/Detail/?jobID=6', CAST(0x0000A4E50008CB93 AS DateTime), CAST(0x0000A5030008CB93 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1008, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/canon_fe_88x43_3.png', N'', CAST(0x0000A4E50008CB97 AS DateTime), CAST(0x0000A5030008CB97 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1009, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/honda-fe-88x43.gif', N'', CAST(0x0000A4E50008CB9D AS DateTime), CAST(0x0000A5030008CB9D AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1010, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/logo_unilever_88x43.gif', N'', CAST(0x0000A4E50008CBA1 AS DateTime), CAST(0x0000A5030008CBA1 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1011, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/microsoft.jpg', N'', CAST(0x0000A4E50008CBAF AS DateTime), CAST(0x0000A5030008CBAF AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1012, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/tma-fe-88x43.jpg', N'', CAST(0x0000A4E50008CBB3 AS DateTime), CAST(0x0000A5030008CBB3 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1013, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/6044737.gif', N'', CAST(0x0000A4E50008CBBE AS DateTime), CAST(0x0000A5030008CBBE AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1014, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/6044737.gif', N'', CAST(0x0000A4E50008CBC5 AS DateTime), CAST(0x0000A5030008CBC5 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1015, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/10205688.jpg', N'', CAST(0x0000A4E50008CBD6 AS DateTime), CAST(0x0000A5030008CBD6 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1016, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/10216105.jpg', N'', CAST(0x0000A4E50008CBE5 AS DateTime), CAST(0x0000A5030008CBE5 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1017, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/cih_hong_lam.png', N'', CAST(0x0000A4E50008CBEA AS DateTime), CAST(0x0000A5030008CBEA AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1018, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/haengsung-fe-88x43.jpg', N'', CAST(0x0000A4E50008CBF4 AS DateTime), CAST(0x0000A5030008CBF4 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1019, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/handong-fe-88x43.jpg', N'', CAST(0x0000A4E50008CC0F AS DateTime), CAST(0x0000A5030008CC0F AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1020, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/kw-fe-88x43 (1).png', N'', CAST(0x0000A4E50008CC21 AS DateTime), CAST(0x0000A5030008CC21 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1021, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/propolife-fe-88x43.jpg', N'', CAST(0x0000A4E50008CC27 AS DateTime), CAST(0x0000A5030008CC27 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1022, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/1.jpg', N'', CAST(0x0000A4E50008CC62 AS DateTime), CAST(0x0000A5030008CC62 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1023, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/1_45.png', N'', CAST(0x0000A4E50008CC68 AS DateTime), CAST(0x0000A5030008CC68 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1024, 3, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/arquitecto_sanchez.jpg', N'', CAST(0x0000A4E50008CC71 AS DateTime), CAST(0x0000A5030008CC71 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1025, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/ctec-logo-larry-wayne-tax-service.png', N'', CAST(0x0000A4E50008CC84 AS DateTime), CAST(0x0000A5030008CC84 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1026, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/decortiles2014_logo.png', N'', CAST(0x0000A4E50008CC99 AS DateTime), CAST(0x0000A5030008CC99 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1027, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/disma_logo_0.png', N'', CAST(0x0000A4E50008CCA9 AS DateTime), CAST(0x0000A5030008CCA9 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1028, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/gth-metropolpolis.png', N'', CAST(0x0000A4E50008CCCE AS DateTime), CAST(0x0000A5030008CCCE AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1029, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/hartwall_arena.png', N'', CAST(0x0000A4E50008CCEB AS DateTime), CAST(0x0000A5030008CCEB AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1030, 2, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/jacuzzi_new.png', N'', CAST(0x0000A4E50008CD03 AS DateTime), CAST(0x0000A5030008CD03 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1031, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/1_85.png', N'', CAST(0x0000A4E50008CD16 AS DateTime), CAST(0x0000A5030008CD16 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1032, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/advance.jpg', N'', CAST(0x0000A4E50008CD1E AS DateTime), CAST(0x0000A5030008CD1E AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1033, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/asurion_logo_0.png', N'', CAST(0x0000A4E50008CD27 AS DateTime), CAST(0x0000A5030008CD27 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1034, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/cloudm_logo.png', N'', CAST(0x0000A4E50008CD2E AS DateTime), CAST(0x0000A5030008CD2E AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1035, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/datavision_0.png', N'', CAST(0x0000A4E50008CD3C AS DateTime), CAST(0x0000A5030008CD3C AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1036, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/docomo_pacific.png', N'', CAST(0x0000A4E50008CD48 AS DateTime), CAST(0x0000A5030008CD48 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1037, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/epay_logo_final_color-glossy_v.png', N'', CAST(0x0000A4E50008CD52 AS DateTime), CAST(0x0000A5030008CD52 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1038, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/logomarca_-_colorida.png', N'', CAST(0x0000A4E50008CD5B AS DateTime), CAST(0x0000A5030008CD5B AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1039, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/oferto_logo.png', N'', CAST(0x0000A4E50008CD62 AS DateTime), CAST(0x0000A5030008CD62 AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1040, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/siscomp.jpg', N'', CAST(0x0000A4E50008CD6A AS DateTime), CAST(0x0000A5030008CD6A AS DateTime), 1, 1, NULL, 0)
INSERT [dbo].[PurchaseAdvertise] ([PurchaseAdsID], [AdvertiseID], [RecuiterID], [LogoUrl], [LinkUrl], [PurchasedDate], [EndDate], [IsVisible], [IsApproved], [ManagerID], [IsDeleted]) VALUES (1041, 1, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/img/ImgUpload/sony.png', N'', CAST(0x0000A4E50008CD74 AS DateTime), CAST(0x0000A5030008CD74 AS DateTime), 1, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[PurchaseAdvertise] OFF



INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'09c04dfc-2b05-4982-92f8-725945c108a0', N'Staff')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1fc378cd-f31c-453b-b38a-348bd7814c9a', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'34f5e889-4ddc-4621-a181-2d2533351c27', N'Jobseeker')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3a4e9a77-c48c-4331-be5b-f3d6de616582', N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a42f0ede-757c-45e2-9441-e6d4d375e16b', N'Recruiter')



INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'acf645c0-8e7e-40b0-b5c3-35928c992290', N'1fc378cd-f31c-453b-b38a-348bd7814c9a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2c6c4ab1-feb7-49fc-a84e-7fbf9736e7fc', N'3a4e9a77-c48c-4331-be5b-f3d6de616582')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'34f5e889-4ddc-4621-a181-2d2533351c27')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'37d45b06-05ae-4052-814c-b08f880d817b', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'81191c51-a897-424a-a0c5-6ccaece30c01', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', N'34f5e889-4ddc-4621-a181-2d2533351c27')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a65e0cb1-6d3a-4b14-81b1-91c049695a11', N'09c04dfc-2b05-4982-92f8-725945c108a0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', N'34f5e889-4ddc-4621-a181-2d2533351c27')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dd2c5dd0-fd5b-4cbb-856b-ae1d6efc9e66', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eca39106-581b-4a2e-966b-0195805c1b59', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fea1e564-eb37-45b3-8550-355ae00d10ac', N'a42f0ede-757c-45e2-9441-e6d4d375e16b')



SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([MessageID], [SenderID], [Message_content], [SendTime], [IsDeletedBySender], [IsCanceled]) VALUES (2008, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'%3Ch1%3E%3Cb%3ENgay%20mai%20la%20pre%20release%3C/b%3E%3C/h1%3E', CAST(0x0000A4DE00116036 AS DateTime), 0, 0)
INSERT [dbo].[Message] ([MessageID], [SenderID], [Message_content], [SendTime], [IsDeletedBySender], [IsCanceled]) VALUES (2009, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'Hello%20me', CAST(0x0000A4DE00118ACF AS DateTime), 0, 0)
INSERT [dbo].[Message] ([MessageID], [SenderID], [Message_content], [SendTime], [IsDeletedBySender], [IsCanceled]) VALUES (3003, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'dsadsdsadsadsadsads', CAST(0x0000A4E2009BF257 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Message] OFF


INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (2008, N'acf645c0-8e7e-40b0-b5c3-35928c992290', NULL, 0)
INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (2008, N'37d45b06-05ae-4052-814c-b08f880d817b', NULL, 0)
INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (2008, N'65a04840-cb58-49c5-9d6d-f27f4cf9b312', NULL, 0)
INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (2008, N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', NULL, 0)
INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (2009, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', NULL, 1)
INSERT [dbo].[MessageReceiver] ([MessageID], [ReceiverID], [ReadTime], [IsDeleted]) VALUES (3003, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', NULL, 0)


SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (21, N'Bai post nay noi dung khogn dung thuc te', N'/Job/Detail/?jobID = 6', CAST(0x0000A4DE0010220A AS DateTime), N'37d45b06-05ae-4052-814c-b08f880d817b', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1001, N'da co lay link reference', N'/Job/Detail/?jobID = 6', CAST(0x0000A4E4000283F9 AS DateTime), N'acf645c0-8e7e-40b0-b5c3-35928c992290', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1002, N'cxcxzczc', N'Job/Detail/?jobID=6', CAST(0x0000A4E4000FA32D AS DateTime), N'acf645c0-8e7e-40b0-b5c3-35928c992290', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1003, N'vcvbv', N'Job/Detail/?jobID=6', CAST(0x0000A4E40010E829 AS DateTime), N'acf645c0-8e7e-40b0-b5c3-35928c992290', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1004, N'fdsfdf', N'Job/Detail/?jobID=6', CAST(0x0000A4E40011168C AS DateTime), N'acf645c0-8e7e-40b0-b5c3-35928c992290', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1005, N'', N'Job/Detail/?jobID=6', CAST(0x0000A4E40017E933 AS DateTime), N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 0, NULL, 0)
INSERT [dbo].[Report] ([ReportID], [Report_content], [ReferenceLink], [CreatedDate], [SenderID], [IsSolved], [SolvedUserID], [IsDeleted]) VALUES (1006, N'', N'Job/Detail/?jobID=6', CAST(0x0000A4E40017EB1B AS DateTime), N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Report] OFF


INSERT [dbo].[Staff] ([StaffID], [IsDeleted]) VALUES (N'a65e0cb1-6d3a-4b14-81b1-91c049695a11', 0)



SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (2, N'Hồ Chí Minh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (3, N'Đà Nẵng ', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (4, N'Hà Nội', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (6, N'ĐBSCL', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (8, N'An Giang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (9, N'Bà Rịa - Vũng Tàu', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (10, N'Bắc cạn', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (11, N'Bắc Giang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (12, N'Bạc Liêu', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (13, N'Bắc Ninh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (14, N'Bến Tre', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (15, N'Biên Hòa', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (16, N'Bình Định', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (17, N'Bình Dương', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (19, N'Bình Phước', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (21, N'Bình Thuận', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (22, N'Cà Mau', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (23, N'Cần Thơ', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (24, N'Cao Bằng', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (26, N'Đắc Lắc', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (27, N'Điện Biên', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (28, N'Đồng Nai', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (29, N'Đồng Tháp', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (30, N'Gia Lai', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (31, N'Hà Giang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (32, N'Hà Nam', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (33, N'Hà Tây', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (34, N'Hà Tĩnh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (35, N'Hải Dương', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (36, N'Hải Phòng', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (37, N'Hòa Bình', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (38, N'Huế', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (39, N'Hưng Yên', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (40, N'Khánh Hòa', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (41, N'Kon Tum', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (43, N'Lai Châu', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (44, N'Lâm Đồng', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (45, N'Lạng Sơn', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (46, N'Lào Cai', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (47, N'Long An', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (48, N'Nam Định', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (49, N'Nghệ An', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (50, N'Ninh Bình', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (51, N'Ninh Thuận', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (52, N'Phú Thọ', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (53, N'Phú Yên', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (54, N'Quảng Bình', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (55, N'Quảng Nam', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (56, N'Quảng Ngãi', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (57, N'Quảng Ninh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (58, N'Quảng Trị', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (59, N'Sóc Trăng', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (60, N'Sơn La', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (61, N'Tây Ninh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (62, N'Thái Bình', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (63, N'Thái Nguyên', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (64, N'Thanh Hóa', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (65, N'Thừa Thiên-Huế', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (66, N'Tiền Giang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (67, N'Trà Vinh', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (68, N'Tuyên Quang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (69, N'Kiên Giang', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (70, N'Vĩnh Long', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (71, N'Vĩnh Phúc', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (72, N'Yên Bái', 0)
INSERT [dbo].[City] ([CityID], [Name], [IsDeleted]) VALUES (73, N'Hậu Giang', 0)
SET IDENTITY_INSERT [dbo].[City] OFF


INSERT [dbo].[Contact] ([UserID], [FullName], [Gender], [MaritalStatus], [Nationality], [Address], [DateofBirth], [PhoneNumber], [AvatarUrl], [CityID], [District], [IsVisible]) VALUES (N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'Nguyễn Thị Minh Huyền', 0, 0, 1, NULL, CAST(0x403A0B00 AS Date), N'091412312584', NULL, 22, NULL, 1)
INSERT [dbo].[Contact] ([UserID], [FullName], [Gender], [MaritalStatus], [Nationality], [Address], [DateofBirth], [PhoneNumber], [AvatarUrl], [CityID], [District], [IsVisible]) VALUES (N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', N'Huỳnh Đức Tài', 1, 0, 1, NULL, CAST(0x3A190B00 AS Date), N'0919045146', NULL, 17, NULL, 1)
INSERT [dbo].[Contact] ([UserID], [FullName], [Gender], [MaritalStatus], [Nationality], [Address], [DateofBirth], [PhoneNumber], [AvatarUrl], [CityID], [District], [IsVisible]) VALUES (N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', N'dsadasdsdasd', 0, 0, 0, NULL, CAST(0x403A0B00 AS Date), N'025656', NULL, 23, NULL, 1)


INSERT [dbo].[Jobseeker] ([JobseekerID], [FullName], [Email], [PhoneNumber], [IsDeleted]) VALUES (N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', N'Nguyen Thi Minh Huyen', N'huyenntm@gmail.com', NULL, 0)
INSERT [dbo].[Jobseeker] ([JobseekerID], [FullName], [Email], [PhoneNumber], [IsDeleted]) VALUES (N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', N'Huynh Duc Tai', N'taihdse60630@fpt.edu.vn', N'091251554', 0)
INSERT [dbo].[Jobseeker] ([JobseekerID], [FullName], [Email], [PhoneNumber], [IsDeleted]) VALUES (N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', N'tai nnđ', N'taidh@gmail.com', N'0325', 0)


INSERT [dbo].[Administrator] ([AdministratorID], [IsDeleted]) VALUES (N'acf645c0-8e7e-40b0-b5c3-35928c992290', 0)


SET IDENTITY_INSERT [dbo].[JobLevel] ON 

INSERT [dbo].[JobLevel] ([JobLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (1, N'Staff', 1, 0)
INSERT [dbo].[JobLevel] ([JobLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (2, N'Experienced (Non-Manager)', 2, 0)
INSERT [dbo].[JobLevel] ([JobLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (5, N'Manager', 3, 0)
SET IDENTITY_INSERT [dbo].[JobLevel] OFF


SET IDENTITY_INSERT [dbo].[SchoolLevel] ON 

INSERT [dbo].[SchoolLevel] ([SchoolLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (1, N'Đại học', 1, 0)
INSERT [dbo].[SchoolLevel] ([SchoolLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (2, N'Thạc sĩ', 2, 0)
INSERT [dbo].[SchoolLevel] ([SchoolLevel_ID], [Name], [LevelNum], [IsDeleted]) VALUES (3, N'Tiến sĩ', 3, 0)
SET IDENTITY_INSERT [dbo].[SchoolLevel] OFF


SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([JobID], [RecruiterID], [JobTitle], [MinSalary], [MaxSalary], [JobDescription], [JobRequirement], [JobLevel_ID], [MinSchoolLevel_ID], [JobView], [StartedDate], [EndedDate], [IsPublic]) VALUES (23, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'Khong ten', 100.0000, 200.0000, N'khong', N'khong', 1, 1, 0, CAST(0x403A0B00 AS Date), CAST(0x5E3A0B00 AS Date), 0)
INSERT [dbo].[Job] ([JobID], [RecruiterID], [JobTitle], [MinSalary], [MaxSalary], [JobDescription], [JobRequirement], [JobLevel_ID], [MinSchoolLevel_ID], [JobView], [StartedDate], [EndedDate], [IsPublic]) VALUES (24, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'KHOONG', 100.0000, 200.0000, N'HONOGNIOSNFASDF', N'ASDFC ASF', 1, 1, 0, CAST(0x403A0B00 AS Date), CAST(0x5E3A0B00 AS Date), 0)
INSERT [dbo].[Job] ([JobID], [RecruiterID], [JobTitle], [MinSalary], [MaxSalary], [JobDescription], [JobRequirement], [JobLevel_ID], [MinSchoolLevel_ID], [JobView], [StartedDate], [EndedDate], [IsPublic]) VALUES (25, N'81191c51-a897-424a-a0c5-6ccaece30c01', N'AHISDHFIOHASDIOF',  NULL, NULL, N'ASDCASDC', N'ASCDASD', 1, 1, 0, CAST(0x403A0B00 AS Date), CAST(0x5E3A0B00 AS Date), 0)
INSERT [dbo].[Job] ([JobID], [RecruiterID], [JobTitle], [MinSalary], [MaxSalary], [JobDescription], [JobRequirement], [JobLevel_ID], [MinSchoolLevel_ID], [JobView], [StartedDate], [EndedDate], [IsPublic]) VALUES (26, N'eca39106-581b-4a2e-966b-0195805c1b59', N'100 Brse', NULL, NULL, N'fdfsd', N'fsdfsdfs', 1, 1, 0, CAST(0x0A3A0B00 AS Date), CAST(0x5E3A0B00 AS Date), 1)
INSERT [dbo].[Job] ([JobID], [RecruiterID], [JobTitle], [MinSalary], [MaxSalary], [JobDescription], [JobRequirement], [JobLevel_ID], [MinSchoolLevel_ID], [JobView], [StartedDate], [EndedDate], [IsPublic]) VALUES (27, N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', N'Bán thẻ Viettel', 1000.0000, 1500.0000, N'Bán thẻ ', N'Biết tiếng Nhật', 1, 1, 0, CAST(0x403A0B00 AS Date), CAST(0x5E3A0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Job] OFF


SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (1, N'Nhân viên phân tích dữ liệu', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (2, N'Quản trị hệ thống', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (3, N'Lập trình viên', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (4, N'Kỹ sư phần mềm', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (5, N'Nhân viên phân tích hệ thống', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (6, N'Chuyên viên hỗ trợ kỹ thuật/ người sử dụng cuối cùng', NULL, 0)
INSERT [dbo].[Category] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (7, N'Thiết kế web/ dịch vụ Internet', NULL, 0)

SET IDENTITY_INSERT [dbo].[Category] OFF


SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (1, N'Japanese', 0)
INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (2, N'Chinese', 0)
INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (3, N'English', 0)
INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (4, N'Indian ', 0)
INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (5, N'Russian ', 0)
INSERT [dbo].[Language] ([LanguageID], [Name], [IsDeleted]) VALUES (6, N'Khmer ', 0)

SET IDENTITY_INSERT [dbo].[Language] OFF


SET IDENTITY_INSERT [dbo].[Level] ON 
INSERT [dbo].[Level] ([Level_ID], [Name], [LevelNum], [IsDeleted]) VALUES (1, N'Master', 4, 0)
INSERT [dbo].[Level] ([Level_ID], [Name], [LevelNum], [IsDeleted]) VALUES (2, N'Cao cấp', 3, 0)
INSERT [dbo].[Level] ([Level_ID], [Name], [LevelNum], [IsDeleted]) VALUES (3, N'Trung cấp', 2, 0)
INSERT [dbo].[Level] ([Level_ID], [Name], [LevelNum], [IsDeleted]) VALUES (4, N'Sơ cấp ', 1, 0)
SET IDENTITY_INSERT [dbo].[Level] OFF



SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([ProfileID], [Name], [YearOfExperience], [HighestSchoolLevel_ID], [LanguageID], [Level_ID], [MostRecentCompany], [MostRecentPosition], [CurrentJobLevel_ID], [ExpectedPosition], [ExpectedJobLevel_ID], [ExpectedSalary], [CreatedTime], [UpdatedTime], [Objectives], [PercentStatus], [JobseekerID], [IsActive], [IsDeleted]) VALUES (10, N'Nguyen Thi Minh Huyen', 4, 1, NULL, NULL, N'FPT Software', N'Dev', 5, N'BuLead', 5, 2000.0000, CAST(0x0000A4CE00000000 AS DateTime), CAST(0x0000A4CE00000000 AS DateTime), N'sdads', 100, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 1, 0)
INSERT [dbo].[Profile] ([ProfileID], [Name], [YearOfExperience], [HighestSchoolLevel_ID], [LanguageID], [Level_ID], [MostRecentCompany], [MostRecentPosition], [CurrentJobLevel_ID], [ExpectedPosition], [ExpectedJobLevel_ID], [ExpectedSalary], [CreatedTime], [UpdatedTime], [Objectives], [PercentStatus], [JobseekerID], [IsActive], [IsDeleted]) VALUES (14, N'Nguyen Thi Minh Huyen', 4, 1, NULL, NULL, N'FIS', N'PM', 5, N'Bulead', 5, 5000.0000, CAST(0x0000A67C00000000 AS DateTime), CAST(0x0000A50E00000000 AS DateTime), N'123', 100, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 1, 0)
INSERT [dbo].[Profile] ([ProfileID], [Name], [YearOfExperience], [HighestSchoolLevel_ID], [LanguageID], [Level_ID], [MostRecentCompany], [MostRecentPosition], [CurrentJobLevel_ID], [ExpectedPosition], [ExpectedJobLevel_ID], [ExpectedSalary], [CreatedTime], [UpdatedTime], [Objectives], [PercentStatus], [JobseekerID], [IsActive], [IsDeleted]) VALUES (15, N'BrSE6', 0, 3, 1, 2, NULL, NULL, NULL, N'BrSE', 5, 12000000.0000, CAST(0x0000A4E500BC7849 AS DateTime), CAST(0x0000A4E500BC7849 AS DateTime), N'abc', 25, N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', 0, 0)
INSERT [dbo].[Profile] ([ProfileID], [Name], [YearOfExperience], [HighestSchoolLevel_ID], [LanguageID], [Level_ID], [MostRecentCompany], [MostRecentPosition], [CurrentJobLevel_ID], [ExpectedPosition], [ExpectedJobLevel_ID], [ExpectedSalary], [CreatedTime], [UpdatedTime], [Objectives], [PercentStatus], [JobseekerID], [IsActive], [IsDeleted]) VALUES (16, N'huyenn', 0, 3, 3, 3, NULL, NULL, NULL, N'CFO', 2, 1000.0000, CAST(0x0000A4E500E863BF AS DateTime), CAST(0x0000A4E500E87DEC AS DateTime), N'toi la huyen', 25, N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 1, 0)
INSERT [dbo].[Profile] ([ProfileID], [Name], [YearOfExperience], [HighestSchoolLevel_ID], [LanguageID], [Level_ID], [MostRecentCompany], [MostRecentPosition], [CurrentJobLevel_ID], [ExpectedPosition], [ExpectedJobLevel_ID], [ExpectedSalary], [CreatedTime], [UpdatedTime], [Objectives], [PercentStatus], [JobseekerID], [IsActive], [IsDeleted]) VALUES (17, N'dsadas', 0, 3, 1, 3, NULL, NULL, NULL, N'sdasdas', 2, 0.0000, CAST(0x0000A4E500EC18A5 AS DateTime), CAST(0x0000A4E500EC18A5 AS DateTime), N'đâsdas', 25, N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', 1, 0)
SET IDENTITY_INSERT [dbo].[Profile] OFF



INSERT [dbo].[ExpectedCategory] ([ProfileID], [CategoryID], [IsDeleted]) VALUES (15, 1, 0)
INSERT [dbo].[ExpectedCategory] ([ProfileID], [CategoryID], [IsDeleted]) VALUES (16, 1, 0)
INSERT [dbo].[ExpectedCategory] ([ProfileID], [CategoryID], [IsDeleted]) VALUES (17, 2, 0)



INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (1, 24, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (1, 26, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (1, 27, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (2, 23, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (2, 25, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (2, 26, 0)
INSERT [dbo].[JobCategory] ([CategoryID], [JobID], [IsDeleted]) VALUES (2, 27, 0)



INSERT [dbo].[ExpectedCity] ([ProfileID], [CityID], [IsDeleted]) VALUES (15, 17, 0)
INSERT [dbo].[ExpectedCity] ([ProfileID], [CityID], [IsDeleted]) VALUES (16, 21, 0)
INSERT [dbo].[ExpectedCity] ([ProfileID], [CityID], [IsDeleted]) VALUES (17, 23, 0)



INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (23, 3, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (23, 4, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (24, 2, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (24, 3, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (25, 3, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (25, 6, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 2, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 3, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 4, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 6, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 8, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 9, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 10, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 11, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 12, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 13, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 14, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 15, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 16, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 17, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 19, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 21, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 22, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 23, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 24, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 26, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 27, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 28, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 29, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 30, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 31, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 32, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 33, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 34, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 35, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 36, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 37, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 38, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 39, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 40, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 41, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 43, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 44, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 45, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 46, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 47, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 48, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 49, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 50, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 51, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 52, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 53, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 54, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 55, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 56, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 57, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 58, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 59, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 60, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 61, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 62, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 63, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 64, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 65, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 66, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 67, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 68, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 69, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 70, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 71, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 72, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (26, 73, 0)
INSERT [dbo].[JobCity] ([JobID], [CityID], [IsDeleted]) VALUES (27, 2, 0)



INSERT [dbo].[CompanyInfo] ([RecruiterID], [LogoURL], [Company], [Address], [District], [PhoneNumber], [Description], [IsVisible]) VALUES (N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', N'/Content/img/logofsoft.png', N'Viettel', N'Hoa Lac, Thach That', N'!22', N'091838455656', N'Cong ty ban dien thoai', 1)
INSERT [dbo].[CompanyInfo] ([RecruiterID], [LogoURL], [Company], [Address], [District], [PhoneNumber], [Description], [IsVisible]) VALUES (N'81191c51-a897-424a-a0c5-6ccaece30c01', N'/Content/img/logofsoft.png', N'Fsoft', N'dsdsa', NULL, NULL, NULL, 1)
INSERT [dbo].[CompanyInfo] ([RecruiterID], [LogoURL], [Company], [Address], [District], [PhoneNumber], [Description], [IsVisible]) VALUES (N'fea1e564-eb37-45b3-8550-355ae00d10ac', N'/Content/img/logofsoft.png', N'ewhwehew', N'ewhew', N'ưehew', N'0915045164', N'ehnr', 0)


INSERT [dbo].[CompanyInfoCity] ([RecuiterID], [CityID], [IsDeleted]) VALUES (N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', 64, 0)
INSERT [dbo].[CompanyInfoCity] ([RecuiterID], [CityID], [IsDeleted]) VALUES (N'fea1e564-eb37-45b3-8550-355ae00d10ac', 11, 0)


INSERT [dbo].[AppliedJob] ([JobseekerID], [JobID], [ProfileID], [ApplyDate], [MatchingPercent], [Status], [IsDeleted]) VALUES (N'33a013bc-81e2-4f6e-a4bc-704f3d6450f9', 27, 14, CAST(0x403A0B00 AS Date), 0, 2, 1)
INSERT [dbo].[AppliedJob] ([JobseekerID], [JobID], [ProfileID], [ApplyDate], [MatchingPercent], [Status], [IsDeleted]) VALUES (N'8da8a33e-37f4-4a26-a03f-b38a2fdef0eb', 27, 15, CAST(0x403A0B00 AS Date), 0, 0, 0)
INSERT [dbo].[AppliedJob] ([JobseekerID], [JobID], [ProfileID], [ApplyDate], [MatchingPercent], [Status], [IsDeleted]) VALUES (N'db6b787a-16ad-481e-8e6b-0d8a0d0abf0f', 27, 17, CAST(0x403A0B00 AS Date), 0, 1, 0)

SET IDENTITY_INSERT [dbo].[Skill] ON 
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (1, N'Java', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (2, N'Tester', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (3, N'PHP', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (4, N'Android', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (5, N'.NET', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (6, N'IOS', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (7, N'Business Analyst', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (8, N'QA QC', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (9, N'C#', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (10, N'CSS', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (11, N'Angular', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (12, N'HTML', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (13, N'IT Support', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (14, N'JavaScript', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (15, N'SQL', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (16, N'Front End', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (17, N'Ruby', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (18, N'Python', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (19, N'Team Leader', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (20, N'ReactJS', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (21, N'Networking', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (22, N'Designer', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (23, N'Embedded', 0)
INSERT [dbo].[Skill] ([Skill_ID], [SkillTag], [IsDeleted]) VALUES (24, N'Swift', 0)


SET IDENTITY_INSERT [dbo].[Skill] OFF

SET IDENTITY_INSERT [dbo].[JobPackage] ON 
INSERT [dbo].[JobPackage] ([JobPackageID], [Name], [JobNumber], [PostDuration], [IsHighlight], [IsCategoryPriority], [IsHomepagePosting], [ViewMultiNumber], [MoreDescription], [Cost], [IsDeleted]) VALUES (2, N'Basic', 100, 30, 0, 0, 0, NULL, N'565132121', 500000.0000, 0)
INSERT [dbo].[JobPackage] ([JobPackageID], [Name], [JobNumber], [PostDuration], [IsHighlight], [IsCategoryPriority], [IsHomepagePosting], [ViewMultiNumber], [MoreDescription], [Cost], [IsDeleted]) VALUES (3, N'Professional', 100, 30, 1, 0, 0, NULL, N'212312123', 1000000.0000, 0)
INSERT [dbo].[JobPackage] ([JobPackageID], [Name], [JobNumber], [PostDuration], [IsHighlight], [IsCategoryPriority], [IsHomepagePosting], [ViewMultiNumber], [MoreDescription], [Cost], [IsDeleted]) VALUES (4, N'Business', 100, 30, 1, 1, 0, NULL, N'213221', 2000000.0000, 0)
INSERT [dbo].[JobPackage] ([JobPackageID], [Name], [JobNumber], [PostDuration], [IsHighlight], [IsCategoryPriority], [IsHomepagePosting], [ViewMultiNumber], [MoreDescription], [Cost], [IsDeleted]) VALUES (5, N'Unlimited', 100, 30, 1, 1, 1, NULL, N'2321231', 4000000.0000, 0)
SET IDENTITY_INSERT [dbo].[JobPackage] OFF


SET IDENTITY_INSERT [dbo].[PurchaseJobPackage] ON 

INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (59, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187005 AS DateTime), CAST(0x0000A4FC00187005 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (60, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018702D AS DateTime), CAST(0x0000A4FC0018702D AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (61, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187031 AS DateTime), CAST(0x0000A4FC00187031 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (62, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187035 AS DateTime), CAST(0x0000A4FC00187035 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (63, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018703B AS DateTime), CAST(0x0000A4FC0018703B AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (64, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187040 AS DateTime), CAST(0x0000A4FC00187040 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (65, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187044 AS DateTime), CAST(0x0000A4FC00187044 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (66, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187049 AS DateTime), CAST(0x0000A4FC00187049 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (67, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018704F AS DateTime), CAST(0x0000A4FC0018704F AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (68, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187058 AS DateTime), CAST(0x0000A4FC00187058 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (69, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018706D AS DateTime), CAST(0x0000A4FC0018706D AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (70, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187074 AS DateTime), CAST(0x0000A4FC00187074 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (71, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018707A AS DateTime), CAST(0x0000A4FC0018707A AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (72, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018708C AS DateTime), CAST(0x0000A4FC0018708C AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (73, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187093 AS DateTime), CAST(0x0000A4FC00187093 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (74, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE00187099 AS DateTime), CAST(0x0000A4FC00187099 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (75, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE0018709F AS DateTime), CAST(0x0000A4FC0018709F AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (76, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE001870B1 AS DateTime), CAST(0x0000A4FC001870B1 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (77, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE001870B8 AS DateTime), CAST(0x0000A4FC001870B8 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (78, N'73d71b5a-d432-4e4b-b3e9-544269e7fec5', 2, CAST(0x0000A4DE001870C0 AS DateTime), CAST(0x0000A4FC001870C0 AS DateTime), 1, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1009, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A185 AS DateTime), CAST(0x0000A5000155A185 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1010, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A260 AS DateTime), CAST(0x0000A5000155A260 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1011, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A26B AS DateTime), CAST(0x0000A5000155A26B AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1012, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A273 AS DateTime), CAST(0x0000A5000155A273 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1013, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A27B AS DateTime), CAST(0x0000A5000155A27B AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1014, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A27F AS DateTime), CAST(0x0000A5000155A27F AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1015, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A285 AS DateTime), CAST(0x0000A5000155A285 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1016, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A28B AS DateTime), CAST(0x0000A5000155A28B AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1017, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A290 AS DateTime), CAST(0x0000A5000155A290 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1018, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A297 AS DateTime), CAST(0x0000A5000155A297 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1019, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2A0 AS DateTime), CAST(0x0000A5000155A2A0 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1020, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2A6 AS DateTime), CAST(0x0000A5000155A2A6 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1021, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2AD AS DateTime), CAST(0x0000A5000155A2AD AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1022, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2B4 AS DateTime), CAST(0x0000A5000155A2B4 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1023, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2BD AS DateTime), CAST(0x0000A5000155A2BD AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1024, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2C4 AS DateTime), CAST(0x0000A5000155A2C4 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1025, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2CB AS DateTime), CAST(0x0000A5000155A2CB AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1026, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2D5 AS DateTime), CAST(0x0000A5000155A2D5 AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1027, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E20155A2DB AS DateTime), CAST(0x0000A5000155A2DB AS DateTime), 0, NULL, 1)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1028, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50010C6CE AS DateTime), CAST(0x0000A5030010C6CE AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1033, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500243290 AS DateTime), CAST(0x0000A50300243290 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1034, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5002453F8 AS DateTime), CAST(0x0000A503002453F8 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1035, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245400 AS DateTime), CAST(0x0000A50300245400 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1036, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50024540A AS DateTime), CAST(0x0000A5030024540A AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1037, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245413 AS DateTime), CAST(0x0000A50300245413 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1038, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50024541A AS DateTime), CAST(0x0000A5030024541A AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1039, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245422 AS DateTime), CAST(0x0000A50300245422 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1040, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50024542A AS DateTime), CAST(0x0000A5030024542A AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1041, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245431 AS DateTime), CAST(0x0000A50300245431 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1042, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245439 AS DateTime), CAST(0x0000A50300245439 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1043, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245440 AS DateTime), CAST(0x0000A50300245440 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1044, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500245448 AS DateTime), CAST(0x0000A50300245448 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1045, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50024F8EA AS DateTime), CAST(0x0000A5030024F8EA AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1046, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50025107D AS DateTime), CAST(0x0000A5030025107D AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1047, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500284626 AS DateTime), CAST(0x0000A50300284626 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1048, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E500284DCB AS DateTime), CAST(0x0000A50300284DCB AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1049, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50099D7DE AS DateTime), CAST(0x0000A5030099D7DE AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1050, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50099D7E9 AS DateTime), CAST(0x0000A5030099D7E9 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1051, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50099D7F8 AS DateTime), CAST(0x0000A5030099D7F8 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1052, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E50099D80B AS DateTime), CAST(0x0000A5030099D80B AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1053, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009A4750 AS DateTime), CAST(0x0000A503009A4750 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1054, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009A4778 AS DateTime), CAST(0x0000A503009A4778 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1055, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009A47A5 AS DateTime), CAST(0x0000A503009A47A5 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1056, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009A47B9 AS DateTime), CAST(0x0000A503009A47B9 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1057, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009B181C AS DateTime), CAST(0x0000A503009B181C AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1058, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009C20B2 AS DateTime), CAST(0x0000A503009C20B2 AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1059, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009C3D73 AS DateTime), CAST(0x0000A503009C3D73 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1060, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E82CC AS DateTime), CAST(0x0000A503009E82CC AS DateTime), NULL, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1061, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E82F9 AS DateTime), CAST(0x0000A503009E82F9 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1062, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E8357 AS DateTime), CAST(0x0000A503009E8357 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1063, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E8375 AS DateTime), CAST(0x0000A503009E8375 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1064, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E8396 AS DateTime), CAST(0x0000A503009E8396 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1065, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E83B3 AS DateTime), CAST(0x0000A503009E83B3 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1066, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E8403 AS DateTime), CAST(0x0000A503009E8403 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1067, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009E844F AS DateTime), CAST(0x0000A503009E844F AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1068, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009EBB2D AS DateTime), CAST(0x0000A503009EBB2D AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1069, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009EC3D5 AS DateTime), CAST(0x0000A503009EC3D5 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1070, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F3932 AS DateTime), CAST(0x0000A503009F3932 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1071, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F3948 AS DateTime), CAST(0x0000A503009F3948 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1072, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F3960 AS DateTime), CAST(0x0000A503009F3960 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1073, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F3974 AS DateTime), CAST(0x0000A503009F3974 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1074, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F3989 AS DateTime), CAST(0x0000A503009F3989 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1075, N'81191c51-a897-424a-a0c5-6ccaece30c01', 5, CAST(0x0000A4E5009F39A1 AS DateTime), CAST(0x0000A503009F39A1 AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1076, N'eca39106-581b-4a2e-966b-0195805c1b59', 5, CAST(0x0000A4E500CB222F AS DateTime), CAST(0x0000A50300CB222F AS DateTime), 1, NULL, 0)
INSERT [dbo].[PurchaseJobPackage] ([PurchaseJobPackageID], [RecruiterID], [JobPackageID], [PurchasedDate], [EndDate], [IsApproved], [StaffID], [IsDeleted]) VALUES (1077, N'24e6e209-38d3-4fde-807a-ff994fb4e8d0', 5, CAST(0x0000A4E500E41FF1 AS DateTime), CAST(0x0000A50300E41FF1 AS DateTime), 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[PurchaseJobPackage] OFF

