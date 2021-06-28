using DataAccessComponent;
using EntityComponent.MasterData;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for ApplicationConfig
    /// </summary>
    public class ApplicationConfig : IHttpHandler
    {
        string Mode = string.Empty;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            if (Mode == "AcademicYr")
            {
                lstCommonEntity = ObjCommonDA.GetCommonConfig(Mode);
                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "IsMessageApproval")
            {
                lstCommonEntity = ObjCommonDA.GetCommonConfig(Mode);
                var Json = JsonConvert.SerializeObject(lstCommonEntity);
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