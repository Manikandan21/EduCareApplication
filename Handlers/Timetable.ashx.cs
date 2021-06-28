using DataAccessComponent.Academic;
using EntityComponent.Academic;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Timetable
    /// </summary>
    public class Timetable : IHttpHandler
    {

        string Mode = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);

            if (Mode == "GetDataById")
            {
                TimetableDA ObjTimetableDA = new TimetableDA();
                List<TimeTableConfigEntity> lstTimeTableConfigEntity = new List<TimeTableConfigEntity>();
                lstTimeTableConfigEntity = ObjTimetableDA.GetTimetableConfig("","",Mode, Id);

                var Json = JsonConvert.SerializeObject(lstTimeTableConfigEntity);
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