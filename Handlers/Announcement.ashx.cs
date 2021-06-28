using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityComponent.Communication;
using DataAccessComponent.Communication;
using Newtonsoft.Json;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Announcement
    /// </summary>
    public class Announcement : IHttpHandler
    {
        string Mode = string.Empty;
        string GetDataMode = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            GetDataMode = Convert.ToString(context.Request.QueryString["GetDataMode"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);

            if (Mode == "Noticeboard")
            {
                List<NoticeboardEntity> lstNoticeboardEntity = new List<NoticeboardEntity>();
                AnnouncementDA ObjAnnouncementDA = new AnnouncementDA();
                lstNoticeboardEntity = ObjAnnouncementDA.GetNoticeboardDetails(GetDataMode, Id);

                var Json = JsonConvert.SerializeObject(lstNoticeboardEntity);
                ResultString = Json;
            }
            else if (Mode == "Events")
            {
                List<EventsEntity> lstEventsEntity = new List<EventsEntity>();
                AnnouncementDA ObjAnnouncementDA = new AnnouncementDA();
                lstEventsEntity = ObjAnnouncementDA.GetEventDetails(GetDataMode, Id);

                var Json = JsonConvert.SerializeObject(lstEventsEntity);
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