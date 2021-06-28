using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Attendance;
using EntityComponent.Attendance;
using Newtonsoft.Json;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Shuffle
    /// </summary>
    public class Shuffle : IHttpHandler, IReadOnlySessionState
    {
        string ResultString = string.Empty;
        StudentAttendanceDA ObjStudentAttendanceDA = null;
        string StudentIds = string.Empty;
        string Mode = string.Empty;
        string Currentcourse = string.Empty;
        string Currentsection = string.Empty;
        string Promotecourse = string.Empty;
        string Promotesection = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Currentcourse = Convert.ToString(context.Request.QueryString["CurrentCourse"]);
            Currentsection = Convert.ToString(context.Request.QueryString["CurrentSection"]);
            Promotecourse = Convert.ToString(context.Request.QueryString["PromoteCourse"]);
            Promotesection = Convert.ToString(context.Request.QueryString["PromoteSection"]);
            StudentIds = Convert.ToString(context.Request.QueryString["Ids"]);
            
            //if (Mode =="GETDATA")
            //{
                List<StudentAttendanceCourseEntity> lstStudentAttendanceCourseEntity = new List<StudentAttendanceCourseEntity>();
                ObjStudentAttendanceDA = new StudentAttendanceDA();
                lstStudentAttendanceCourseEntity = ObjStudentAttendanceDA.GetStudentDataByCourse(Mode, StudentIds, Currentcourse, Currentsection, Promotecourse, Promotesection);
                var Json = JsonConvert.SerializeObject(lstStudentAttendanceCourseEntity);
                ResultString = Json;
            //}
            //else if (Mode =="SUBMIT")
            //{

            //}

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