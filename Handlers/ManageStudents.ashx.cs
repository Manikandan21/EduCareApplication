using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Student;
using EntityComponent.Student;
using Newtonsoft.Json;
using System.Web.SessionState;
using EntityComponent.MasterData;
using DataAccessComponent;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for ManageStudents
    /// </summary>
    public class ManageStudents : IHttpHandler, IReadOnlySessionState 
    {
        string Mode = string.Empty;
        string Course = string.Empty;
        string Section = string.Empty;
        string strReasonforDelete = string.Empty;
        long Id = 0;
        string ResultString = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Course = Convert.ToString(context.Request.QueryString["Course"]);
            Section = Convert.ToString(context.Request.QueryString["Section"]);
            Id = Convert.ToInt64(context.Request.QueryString["Id"]);


            if (Mode == "ForGrid")
            {
                List<StudentInformationGrid> lstStudentInformationGrid = new List<StudentInformationGrid>();
                StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();

                lstStudentInformationGrid = ObjStudentEnrollmentDA.GetStudentInformationForGrid(Course, Section, Id, Mode);

                var Json = JsonConvert.SerializeObject(lstStudentInformationGrid);
                ResultString = Json;
            }
            if (Mode == "ForSearch")
            {
                string Name = Convert.ToString(context.Request.QueryString["StudentName"]);
                List<StudentInformationGrid> lstStudentInformationGrid = new List<StudentInformationGrid>();
                StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();
                lstStudentInformationGrid = ObjStudentEnrollmentDA.GetStudentInformationForGridSearch(Name);
                var Json = JsonConvert.SerializeObject(lstStudentInformationGrid);
                ResultString = Json;
            }
            else if (Mode == "DeleteStuById")
            {
                string Message = string.Empty;
                bool Status = false;
                long ID = 0;
                strReasonforDelete = Convert.ToString(context.Request.QueryString["Reason"]);
                StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();
                StudentEnrollmentEntity ObjStudentEnrollmentEntity = new StudentEnrollmentEntity();
                ObjStudentEnrollmentEntity.Student_Id = Id;
                ObjStudentEnrollmentEntity.CreatedBy =Convert.ToInt32(context.Session["UserId"].ToString());
                ObjStudentEnrollmentEntity.Mode = "Delete";
                ObjStudentEnrollmentDA.SetStudentEnrollment(ObjStudentEnrollmentEntity, out Status, out Message, strReasonforDelete,out ID);

                ResultString = Message;
            }
            else if (Mode == "ByStudent")
            {
                List<StudentEnrollmentEntity> lstStudentEnrollmentEntity = new List<StudentEnrollmentEntity>();
                StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();

                lstStudentEnrollmentEntity = ObjStudentEnrollmentDA.GetStudentInformation(Course, Section, Id, Mode);

                var Json = JsonConvert.SerializeObject(lstStudentEnrollmentEntity);
                ResultString = Json;
            }
            else if (Mode == "DdlStudent")
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();

                lstCommonEntity = ObjCommonDA.GetStudentForDDL(Course, Section, Mode);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "ExamCheck")
            {
                CommonDA ObjCommonDA = new CommonDA();
                ResultString = ObjCommonDA.GetCheckAcademicData(Course, Section,Convert.ToInt32(Id), Mode,"");
            }
            else if (Mode == "AcademicCheck")
            {
                CommonDA ObjCommonDA = new CommonDA();
                ResultString = ObjCommonDA.GetCheckAcademicData(Course, Section, Convert.ToInt32(Id), Mode, Convert.ToString(context.Request.QueryString["Exam"]));
            }
            else if (Mode == "HomeworkCheck")
            {
                string Date = Convert.ToString(context.Request.QueryString["Date"]);
                CommonDA ObjCommonDA = new CommonDA();
                ResultString = ObjCommonDA.GetCheckAcademicData(Course, Section, Convert.ToInt32(Id), Mode,Date);
            }
            else if (Mode == "TimetableCheck")
            {               
                CommonDA ObjCommonDA = new CommonDA();
                ResultString = ObjCommonDA.GetCheckAcademicData(Course, Section, Convert.ToInt32(Id), Mode, "");
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