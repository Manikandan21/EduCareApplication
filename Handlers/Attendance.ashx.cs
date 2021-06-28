using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Attendance;
using EntityComponent.Attendance;
using Newtonsoft.Json;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Attendance
    /// </summary>
    public class Attendance : IHttpHandler
    {
        string Mode = string.Empty;
        string course = string.Empty;
        string section = string.Empty;
        string StudentIds = string.Empty;
        string DateToBeMarkedAbsent = string.Empty;
        int UserId = 0;
        string Message = "";
        bool Status = false;
        string ResultString = string.Empty;
        StudentAttendanceDA ObjStudentAttendanceDA = null;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            UserId = Convert.ToInt32(context.Request.QueryString["UserId"]);
            course = Convert.ToString(context.Request.QueryString["Course"]);
            section = Convert.ToString(context.Request.QueryString["Section"]);
            StudentIds = Convert.ToString(context.Request.QueryString["Ids"]);
            DateToBeMarkedAbsent = Convert.ToString(context.Request.QueryString["DateToBeMarkedAbsent"]);
            if (Mode == "SAdminMarkAbsent")
            {
                StudentAttendanceInputEntity ObjStudentAttendanceInputEntity = new StudentAttendanceInputEntity();
                ObjStudentAttendanceInputEntity.studentIds = StudentIds;
                ObjStudentAttendanceInputEntity.UserId = UserId;
                ObjStudentAttendanceInputEntity.Course = course;
                ObjStudentAttendanceInputEntity.Section = section;
                ObjStudentAttendanceInputEntity.Mode = Mode;

                ObjStudentAttendanceDA = new StudentAttendanceDA();
                ObjStudentAttendanceDA.SetStudentAttendance(ObjStudentAttendanceInputEntity,DateToBeMarkedAbsent, out Status, out Message);

                if (Status == true)
                {
                    ResultString = Message;
                }
                else
                {
                    ResultString = "Error";
                }
            }

            else if (Mode == "GetAttendance")
            {
                List<StudentAttendanceCourseEntity> lstStudentAttendanceCourseEntity = new List<StudentAttendanceCourseEntity>();
                StudentAttendanceInputEntity ObjStudentAttendanceInputEntity = new StudentAttendanceInputEntity();
                ObjStudentAttendanceInputEntity.studentIds = StudentIds;
                ObjStudentAttendanceInputEntity.UserId = UserId;
                ObjStudentAttendanceInputEntity.Course = course;
                ObjStudentAttendanceInputEntity.Section = section;
                ObjStudentAttendanceInputEntity.Mode = Mode;

                ObjStudentAttendanceDA = new StudentAttendanceDA();
                lstStudentAttendanceCourseEntity = ObjStudentAttendanceDA.GetStudentAttendanceByCourse(ObjStudentAttendanceInputEntity, DateToBeMarkedAbsent);

                var Json = JsonConvert.SerializeObject(lstStudentAttendanceCourseEntity);
                ResultString = Json;

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