using DataAccessComponent.Attendance;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for UserAttendance
    /// </summary>
    public class UserAttendance : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        string Mode = string.Empty;
        long StudentId = 0;
        int MonthID = 0;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            StudentId = Convert.ToInt64(context.Session["UserId"].ToString());
            MonthID = Convert.ToInt32(context.Request.QueryString["MonthID"]);
            StudentAttendanceDA ObjStudentAttendanceDA = new StudentAttendanceDA();
            DataTable dt = new DataTable();
            if (Mode == "GetData")
            {

                dt = ObjStudentAttendanceDA.GetStudentAttendanceViewByUser(StudentId, "GetData", MonthID);
                if (dt.Rows.Count > 0)
                {
                    var Json = JsonConvert.SerializeObject(dt);
                    ResultString = Json;
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