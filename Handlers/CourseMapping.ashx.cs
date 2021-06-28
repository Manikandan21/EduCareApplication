using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for CourseMapping
    /// </summary>
    public class CourseMapping : IHttpHandler, IReadOnlySessionState
    {
        string Mode = string.Empty;
        string Course = string.Empty;
        string Section = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;
        string Message = string.Empty;
        bool status = false;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Course = Convert.ToString(context.Request.QueryString["Course"]);
            Section = Convert.ToString(context.Request.QueryString["Section"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);
            CourseSubjectMappingDA ObjCourseSubjectMappingDA=null;
            if (Mode == "GetByCourseSubject")
            {
                List<CourceMappingEntity> lstCourceSubjectEntity = new List<CourceMappingEntity>(); 
                ObjCourseSubjectMappingDA=new CourseSubjectMappingDA();
                lstCourceSubjectEntity=ObjCourseSubjectMappingDA.GetCourseSubjectMapping(Mode, Course, Section);
                var Json = JsonConvert.SerializeObject(lstCourceSubjectEntity);
                ResultString = Json;
            }
            else if (Mode == "ExceptCourseSubject")
            {
                List<CourceMappingEntity> lstCourceSubjectEntity = new List<CourceMappingEntity>();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                lstCourceSubjectEntity = ObjCourseSubjectMappingDA.GetCourseSubjectMapping(Mode, Course, Section);
                var Json = JsonConvert.SerializeObject(lstCourceSubjectEntity);
                ResultString = Json;
            }
            else if (Mode == "AddNewSubject")
            {
                CourceMappingEntity ObjCourceSubjectEntity = new CourceMappingEntity();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                ObjCourceSubjectEntity.Course = Course;
                ObjCourceSubjectEntity.Section = Section;
                ObjCourceSubjectEntity.Subject =Convert.ToString(Id);
                ObjCourceSubjectEntity.CreatedBy = Convert.ToInt32(context.Session["UserId"].ToString());
                ObjCourseSubjectMappingDA.SetCourseSubjectMapping(ObjCourceSubjectEntity, "AddNew", out Message, out status);
                if (status == true)
                {
                    if (Message == "Success")
                    {
                        ResultString = Message;
                    }
                }
                else
                {
                    ResultString = "Error";
                }
            }
            else if (Mode == "DeleteSubject")
            {
                CourceMappingEntity ObjCourceSubjectEntity = new CourceMappingEntity();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                ObjCourceSubjectEntity.Course = Course;
                ObjCourceSubjectEntity.Section = Section;
                ObjCourceSubjectEntity.Subject = Convert.ToString(Id);
                ObjCourceSubjectEntity.CreatedBy = Convert.ToInt32(context.Session["UserId"].ToString());
                ObjCourseSubjectMappingDA.SetCourseSubjectMapping(ObjCourceSubjectEntity, "Delete", out Message, out status);
                if (status == true)
                {
                    if (Message == "Success")
                    {
                        ResultString = Message;
                    }
                }
                else
                {
                    ResultString = "Error";
                }
            }

            else if (Mode == "GetByCourseExam")
            {
                List<CourseExamEntity> lstCourseExamEntity = new List<CourseExamEntity>();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                lstCourseExamEntity = ObjCourseSubjectMappingDA.GetCourseExamMapping(Mode, Course, Section);
                var Json = JsonConvert.SerializeObject(lstCourseExamEntity);
                ResultString = Json;
            }
            else if (Mode == "ExceptCourseExam")
            {
                List<CourseExamEntity> lstCourseExamEntity = new List<CourseExamEntity>();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                lstCourseExamEntity = ObjCourseSubjectMappingDA.GetCourseExamMapping(Mode, Course, Section);
                var Json = JsonConvert.SerializeObject(lstCourseExamEntity);
                ResultString = Json;
            }
            else if (Mode == "AddNewExam")
            {
                CourseExamEntity ObjCourseExamEntity = new CourseExamEntity();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                ObjCourseExamEntity.Course = Course;
                ObjCourseExamEntity.Section = Section;
                ObjCourseExamEntity.Exam = Convert.ToString(Id);
                ObjCourseExamEntity.CreatedBy = Convert.ToInt32(context.Session["UserId"].ToString());
                ObjCourseSubjectMappingDA.SetCourseExamMapping(ObjCourseExamEntity, "AddNew", out Message, out status);
                if (status == true)
                {
                    if (Message == "Success")
                    {
                        ResultString = Message;
                    }
                }
                else
                {
                    ResultString = "Error";
                }
            }
            else if (Mode == "DeleteExam")
            {
                CourseExamEntity ObjCourseExamEntity = new CourseExamEntity();
                ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();
                ObjCourseExamEntity.Course = Course;
                ObjCourseExamEntity.Section = Section;
                ObjCourseExamEntity.Exam = Convert.ToString(Id);
                ObjCourseExamEntity.CreatedBy = Convert.ToInt32(context.Session["UserId"].ToString());
                ObjCourseSubjectMappingDA.SetCourseExamMapping(ObjCourseExamEntity, "Delete", out Message, out status);
                if (status == true)
                {
                    if (Message == "Success")
                    {
                        ResultString = Message;
                    }
                }
                else
                {
                    ResultString = "Error";
                }
            }
            context.Response.Write(ResultString);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}