﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using JobSearchingSystem.Models;
using JobSearchingSystem.DAL;
using PagedList;
using PagedList.Mvc;

namespace JobSearchingSystem.Controllers
{
    [MessageFilter]
    public class JobController : Controller
    {
        //
        // GET: /Job/
        private JobUnitOfWork jobUnitOfWork = new JobUnitOfWork();
        private HomeUnitOfWork homeUnitOfWork = new HomeUnitOfWork();

        //Displayed list of job created by recruiter
        [Authorize(Roles = "Recruiter")]
        public ActionResult OwnList()
        {
            ViewBag.jobpackagemessage = TempData["jobpackagemessage"];

            string recruiterID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id; 
            return View(this.jobUnitOfWork.GetJobByRecruiterID(recruiterID));
        }

        //Displayed list of job created by recruiter but role is staff
        [Authorize(Roles = "Staff")]
        public ActionResult JobList()
        {
            ViewBag.jobpackagemessage = TempData["jobpackagemessage"];

            return View(this.jobUnitOfWork.GetJob());
        }

        [Authorize(Roles = "Jobseeker")]
        public ActionResult AppliedJobList()
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                AppliedJobViewModel model = new AppliedJobViewModel();
                model.AppliedJobList = jobUnitOfWork.getAppliedJobList(userID);
                return View(model);
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("model");
            }

        }

        [Authorize(Roles = "Jobseeker")]
        [HttpPost]
        public ActionResult DeleteAppliedRequest(int jobId, string jobseekerId)
        {
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                int deleteResult = jobUnitOfWork.DeleteAppliedRequest(jobId, jobseekerId);
            TempData["successmessage"] = "Xóa đơn thành công.";
            return RedirectToAction("AppliedJobList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("AppliedJobList");
            }
        }

        [Authorize(Roles = "Recruiter")]
        public ActionResult Create()
        {
            UnitOfWork unitOfWork = new UnitOfWork();
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            { 
                JobCreateModel jobCreateModel = new JobCreateModel();
                string UserID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;


                if (jobUnitOfWork.CompanyInfoRepository.GetByID(UserID) == null)
                {
                    TempData["warningmessage"] = "Xin hãy cập nhật thông tin công ty trước khi đăng tuyển!";
                    return RedirectToAction("Update", "CompanyInfo");
                }

                if (!jobUnitOfWork.CheckIfCanPostJob(UserID))
                {
                    TempData["jobpackagemessage"] = "Bạn cần mua gói công việc!";
                    return RedirectToAction("OwnList");
                }

                jobCreateModel.JobLevelList = jobUnitOfWork.JobLevelRepository.Get(filter: d => d.IsDeleted == false).OrderByDescending(s => s.LevelNum);
                jobCreateModel.SchoolLevelList = jobUnitOfWork.SchoolLevelRepository.Get(filter: d => d.IsDeleted == false).OrderByDescending(s => s.LevelNum);
                jobCreateModel.CityList = jobUnitOfWork.CityRepository.Get(filter: city => city.IsDeleted == false).OrderBy(s => s.Name);
                jobCreateModel.CategoryList = jobUnitOfWork.CategoryRepository.Get(category => category.IsDeleted == false).OrderBy(s => s.Name);
                jobCreateModel.SkillList = jobUnitOfWork.SkillRepository.Get(skill => skill.IsDeleted == false);
                jobCreateModel.JobInfo.RecruiterID = UserID;

                jobCreateModel.JobPackageItemSelectItemList = (from p in jobUnitOfWork.PurchaseJobPackageRepository.Get()
                                                               join j in jobUnitOfWork.JobPackageRepository.Get() on p.JobPackageID equals j.JobPackageID
                                                               where p.RecruiterID == UserID && p.IsApproved == true && p.IsDeleted == false
                                                                   && j.IsDeleted == false
                                                               select new JobPackageSelectItem()
                                                               {
                                                                   JobPackageName = j.Name,
                                                                   RemainJobNumber = j.JobNumber - (from jo in jobUnitOfWork.JobRepository.Get()
                                                                                                    where jo.PurchaseJobPackageId == p.PurchaseJobPackageID
                                                                                                    select jo).Count()
                                                               })
                                                               .GroupBy(s => s.JobPackageName)
                                                               .Select(s => new JobPackageSelectItem { JobPackageName = s.Key, RemainJobNumber = s.Sum(g => g.RemainJobNumber) })
                                                               .Where(s => s.RemainJobNumber > 0)
                                                               .AsEnumerable();


                return View(jobCreateModel);
            
            
            }
            else
            { TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("OwnList");
            }



        }

        [Authorize(Roles = "Recruiter")]
        [HttpPost]
        public ActionResult Create(JobCreateModel model, string JobPackageName, string skill1, string skill2, string skill3)
        {
            string UserID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;

            if (jobUnitOfWork.CreateJob(model, JobPackageName, skill1, skill2, skill3, UserID))
            {
                TempData["successmessage"] = "Tạo đăng tuyển thành công.";
            }
            else
            {
                TempData["errormessage"] = "Tạo đăng tuyển thất bại!";
            }

            return RedirectToAction("OwnList");
        }

        [Authorize(Roles = "Recruiter")]
        public ActionResult Update(int? id)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                JJobUpdateViewModel model = new JJobUpdateViewModel();
            string recruiterID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;

            int jobid = id.GetValueOrDefault();
            if (jobid == 0)
            {
                TempData["warningmessage"] = "Lỗi dữ liệu!";
                return RedirectToAction("Index", "Home");
            }
            else if (jobUnitOfWork.JobRepository.GetByID(jobid) == null)
            {
                TempData["warningmessage"] = "Không tìm thấy thông tin công việc!";
                return RedirectToAction("Index", "Home");
            }
            else if (jobUnitOfWork.JobRepository.GetByID(jobid).RecruiterID != recruiterID)
            {
                TempData["warningmessage"] = "Bạn không có quyền sửa thông tin công việc này!";
                return RedirectToAction("Index", "Home");
            }
            else 
            {
                model.job = jobUnitOfWork.JobRepository.GetByID(jobid);
                model.cityIdList = jobUnitOfWork.JobCityRepository.Get(s => s.JobID == jobid && s.IsDeleted == false).Select(s => s.CityID).AsEnumerable();
                model.categoryIdList = jobUnitOfWork.JobCategoryRepository.Get(s => s.JobID == jobid && s.IsDeleted == false).Select(s => s.CategoryID).AsEnumerable();
                IEnumerable<int> skillIdList = jobUnitOfWork.JobSkillRepository.Get(s => s.JobID == jobid && s.IsDeleted == false).Select(s => s.Skill_ID).AsEnumerable();
                model.skillTagList = new List<string>();
                foreach (int skillId in skillIdList)
                {
                    model.skillTagList.Add(jobUnitOfWork.SkillRepository.GetByID(skillId).SkillTag);
                }
                model.jobpackagename = jobUnitOfWork.JobPackageRepository.GetByID(jobUnitOfWork.PurchaseJobPackageRepository.GetByID(model.job.PurchaseJobPackageId).JobPackageID).Name;

                model.JobLevelList = jobUnitOfWork.JobLevelRepository.Get(filter: d => d.IsDeleted == false).OrderByDescending(s => s.LevelNum);
                model.SchoolLevelList = jobUnitOfWork.SchoolLevelRepository.Get(filter: d => d.IsDeleted == false).OrderByDescending(s => s.LevelNum);
                model.CityList = jobUnitOfWork.CityRepository.Get(filter: city => city.IsDeleted == false).OrderBy(s => s.Name);
                model.CategoryList = jobUnitOfWork.CategoryRepository.Get(category => category.IsDeleted == false).OrderBy(s => s.Name);
                model.SkillList = jobUnitOfWork.SkillRepository.Get(skill => skill.IsDeleted == false);


            }

            return View(model);
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("OwnList");
            }
        }

        [Authorize(Roles = "Recruiter")]
        [HttpPost]
        public ActionResult Update([Bind(Include = "JobID, RecruiterID, JobTitle, MinSalary, MaxSalary, JobDescription, JobRequirement, JobLevel_ID, MinSchoolLevel_ID")] Job job,
                                int[] citiesidlist, int[] categoriesidlist, string skill1, string skill2, string skill3)
        {
            string recruiterID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;

            if (jobUnitOfWork.UpdateJob(job, citiesidlist, categoriesidlist, skill1, skill2, skill3, recruiterID))
            {
                TempData["successmessage"] = "Cập nhật đăng tuyển thành công.";
            }
            else
            {
                TempData["errormessage"] = "Cập nhật đăng tuyển thất bại!";
            }

            return RedirectToAction("OwnList");
        }

        [AllowAnonymous]
        public ActionResult Find(JFindViewModel model)
        {

            model.jobCities = homeUnitOfWork.getAllCities();
            model.jobCategories = homeUnitOfWork.getAllCategories();
            model.schoolLevelList = homeUnitOfWork.getAllSchoolLevel();
            model.purchaseAdvertiseTypeA = homeUnitOfWork.getPurchaseAdvertise("A");
            String searchString = model.searchString;
            if (model.searchJobCities == null && model.searchjobCategories == null)
            {
                model.searchJobCities = TempData["searchJobCities"] as IEnumerable<int>;
                model.searchjobCategories = TempData["searchJobCategories"] as IEnumerable<int>;
            }

            model.jJobItem = jobUnitOfWork.FindJob(model.searchString, model.minSalary, model.schoolLevel, model.searchJobCities, model.searchjobCategories);
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult Detail(int? jobID)
        {

                int jobID2 = jobID.GetValueOrDefault();
            if (jobID2 == 0)
            {
                TempData["errormessage"] = "Dữ liệu không hợp lệ!";
                return RedirectToAction("Index", "Home");
            }
            else if (!jobUnitOfWork.IsJobExist(jobID2))
            {
                TempData["errormessage"] = "Không tìm thấy công việc!";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                JJobDetailViewModel jJobDetailViewModel = new JJobDetailViewModel();
                jJobDetailViewModel.Job = jobUnitOfWork.GetJobDetail(jobID2);
                jJobDetailViewModel.jobList = jobUnitOfWork.GetRevelantJobs(jobID2);
                if (!String.IsNullOrEmpty(User.Identity.Name))
                {
                    jJobDetailViewModel.isLogined = true;
                    string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
                    IEnumerable<Profile> profileList = jobUnitOfWork.getJobSeekerProfile(userID);

                    jJobDetailViewModel.jobSeeker = jobUnitOfWork.JobseekerRepository.Get(s => s.JobseekerID == userID).FirstOrDefault();
                    jJobDetailViewModel.profileList = profileList;

                    jJobDetailViewModel.isApplied = jobUnitOfWork.CheckIsApplied(userID, jobID2);

                }
                else
                {
                    jJobDetailViewModel.isLogined = false;
                }

                return View(jJobDetailViewModel);
            }
            
        }

        //Display a hidden job
        [Authorize(Roles = "Recruiter")]
        [HttpPost]
        public ActionResult Display(int jobID)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                if (jobUnitOfWork.Display(jobID))
                {
                    TempData["successmessage"] = "Hiển thị công việc thành công.";
                }
                else
                {
                    TempData["errormessage"] = "Hiển thị công việc thất bại!";
                }

                return RedirectToAction("OwnList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("OwnList");
            }
        }
        //Display a hidden job
        [Authorize(Roles = "Staff")]
        [HttpPost]
        public ActionResult DisplayByAd(int jobID)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                if (jobUnitOfWork.Display(jobID))
                {
                    TempData["successmessage"] = "Hiển thị công việc thành công.";
                }
                else
                {
                    TempData["errormessage"] = "Hiển thị công việc thất bại!";
                }

                return RedirectToAction("JobList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("JobList");
            }
        }
        [Authorize(Roles = "Jobseeker")]
        public ActionResult AppliedJob(JJobDetailViewModel model)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                string id = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool IsApplied = jobUnitOfWork.ApplyJob(model.jobID, model.profileID, id);

            if (IsApplied)
            {
                TempData["successmessage"] = "Gửi đơn thành công.";
            }
            else
            {
                TempData["errormessage"] = "Gửi đơn thất bại!";
            }

            return RedirectToAction("AppliedJobList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("AppliedJobList");
            }
        }




        //Hide a displayed job
        [Authorize(Roles = "Recruiter")]
        [HttpPost]
        public ActionResult Hide(int jobID)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                if (jobUnitOfWork.Hide(jobID))
            {
                TempData["successmessage"] = "Ẩn công việc thành công.";
            }
            else
            {
                TempData["errormessage"] = "Ẩn công việc thất bại!";
            }

            return RedirectToAction("OwnList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("OwnList");
            }
        }
        //Hide a displayed job by Staff
        [Authorize(Roles = "Staff")]
        [HttpPost]
        public ActionResult HideByAd(int jobID)
        {
            string userID = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().Id;
            bool state = jobUnitOfWork.AspNetUserRepository.Get(s => s.UserName == User.Identity.Name).FirstOrDefault().IsActive;
            if (state == true)
            {
                if (jobUnitOfWork.Hide(jobID))
                {
                    TempData["successmessage"] = "Ẩn công việc thành công.";
                }
                else
                {
                    TempData["errormessage"] = "Ẩn công việc thất bại!";
                }

                return RedirectToAction("JobList");
            }
            else
            {
                TempData["errormessage"] = "Tài khoản của bạn chưa được kích hoạt!";
                return RedirectToAction("JobList");
            }
        }

        [Authorize(Roles = "Recruiter")]
        public ActionResult SearchJobseekerMatching(string [] percentMatching, string jobID ){
            List<string> percentMatchingList = new List<string>();

            if (!String.IsNullOrEmpty(jobID) && percentMatching != null && percentMatching.Length > 0)
            {
                percentMatchingList = percentMatching.ToList();
            }
            else if (TempData["percentMatching"] != null)
            {
                percentMatchingList = TempData["percentMatching"].ToString().Split(',').ToList();
            }
            else
            {
                return RedirectToAction("OwnList");
            }

            JobseekerList jobseekerList = new JobseekerList();
            
            jobseekerList.jobseekerList = jobUnitOfWork.SearchJobseekerMatching(percentMatchingList, Int32.Parse(jobID));

            ViewBag.jobid = jobID;

            jobseekerList.percentMatching = percentMatchingList.ElementAt(0);
            for (int i = 1; i < percentMatchingList.Count(); i++)
            {
                jobseekerList.percentMatching += "," + percentMatchingList.ElementAt(i);
            }

            return View(jobseekerList);
        }

        public JsonResult AutoCompleteSkill(string skill)
        {

            var result = jobUnitOfWork.AutoCompleteSkill(skill);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [AllowAnonymous]
        public ActionResult JobsOfRecruiter(string recruiterID)
        {
            if (String.IsNullOrEmpty(recruiterID))
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                JJobsOfRecruiter model = new JJobsOfRecruiter();
                model.jobsOfRecruiter = jobUnitOfWork.JobsOfRecruiter(recruiterID);
                model.recruiter = jobUnitOfWork.GetRecuiterInfo(recruiterID);
                return View(model);
            }
        }

        [HttpPost]
        public ActionResult SendMessage(string receiverUserId, string messageContent, int jobID, string subject, string percentMatching)
        {
            ApplicantUnitOfWork applicantUnitOfWork = new ApplicantUnitOfWork();
            MessageController messageController = new MessageController();

            if (String.IsNullOrEmpty(receiverUserId) || String.IsNullOrEmpty(messageContent))
            {
                TempData["errormessage"] = "Dữ liệu không hợp lệ!";
                return RedirectToAction("List", new { id = jobID });
            }

            AspNetUser user = applicantUnitOfWork.AspNetUserRepository.GetByID(receiverUserId);
            if (user == null)
            {
                TempData["errormessage"] = "Không tìm thấy thông tin tài khoản!";
                return RedirectToAction("List", new { id = jobID });
            }
            //ThienNN
            string messageForMail = "Chào bạn,<br><br>Bạn vừa nhận được tin nhắn từ nhà tuyển dụng vui lòng đăng nhập vào hệ thống chúng tôi bằng link sau để kiểm tra hộp tin nhắn <br /> http://localhost:64977/Message/List <br><br>Best Regards,<br>JSS";

            if (String.IsNullOrEmpty(subject))
            {
                applicantUnitOfWork.SendEmail(user.UserName, "Thông báo tin nhắn mới", messageForMail);
                messageController.SendMessageInterview(User.Identity.Name, user.UserName, messageContent);
                TempData["successmessage"] = "Tin nhắn của bạn đã được gửi đi.";
            }
            else
            {
                applicantUnitOfWork.SendEmail(user.UserName, subject, messageContent);
                TempData["successmessage"] = "Mail đã được gửi đi.";
            }

            TempData["percentMatching"] = percentMatching;
            return RedirectToAction("SearchJobseekerMatching", new { jobID = jobID });
        }
    }
}
