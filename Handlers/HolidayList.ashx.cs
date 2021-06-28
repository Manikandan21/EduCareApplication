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
    /// Summary description for HolidayList
    /// </summary>
    public class HolidayList : IHttpHandler
    {
        string strAcademicYr = string.Empty;
        StudentAttendanceDA ObjStudentAttendanceDA = null;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            strAcademicYr = Convert.ToString(context.Request.QueryString["AcademicYr"]);
            if (!string.IsNullOrEmpty(strAcademicYr))
            {
                ObjStudentAttendanceDA = new StudentAttendanceDA();
                List<HolidayListMasterEntity> lstHoliday = new List<HolidayListMasterEntity>();
                lstHoliday = ObjStudentAttendanceDA.GetHolidayList(strAcademicYr);
                var Json = JsonConvert.SerializeObject(lstHoliday);
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