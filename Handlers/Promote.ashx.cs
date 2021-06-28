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
    /// Summary description for Promote
    /// </summary>
    public class Promote : IHttpHandler, IReadOnlySessionState
    {
        string strMode = string.Empty;
        string strCurrentCourse = string.Empty;
        string strCurrentSection = string.Empty;
        string strPromoteCourse = string.Empty;
        string strPromoteSection = string.Empty;
        string strId = string.Empty;
        string strUserId = string.Empty;

        StudentAttendanceDA ObjStudentAttendanceDA = null;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strCurrentCourse = Convert.ToString(context.Request.QueryString["CurrentCourse"]);
            strCurrentSection = Convert.ToString(context.Request.QueryString["CurrentSection"]);
            strPromoteCourse = Convert.ToString(context.Request.QueryString["PromoteCourse"]);
            strPromoteSection = Convert.ToString(context.Request.QueryString["PromoteSection"]);
            strId = Convert.ToString(context.Request.QueryString["Id"]);
            strUserId = context.Session["UserId"].ToString();

            if (!string.IsNullOrEmpty(strMode))
            {
                ObjStudentAttendanceDA = new StudentAttendanceDA();
                List<PromoteMasteConfigEntity> lstPromotedata = new List<PromoteMasteConfigEntity>();
                lstPromotedata = ObjStudentAttendanceDA.GetAndSetPromoteConfig(strMode, strCurrentCourse, strCurrentSection, strPromoteCourse, strPromoteSection, strId, strUserId);
                var Json = JsonConvert.SerializeObject(lstPromotedata);
                ResultString = Json;
                context.Response.Write(ResultString);
            }
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