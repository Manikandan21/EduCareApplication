using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityComponent.MasterData;
using DataAccessComponent;
using Newtonsoft.Json;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for DropdownBind
    /// </summary>
    public class DropdownBind : IHttpHandler
    {
        string Mode = string.Empty;
        string Type = string.Empty;
        string Value = string.Empty;
        string ResultString = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Type= Convert.ToString(context.Request.QueryString["Type"]);
            Value=Convert.ToString(context.Request.QueryString["Value"]);

            CommonDA ObjCommonDA=new CommonDA();
            if (Mode == "GetCourse")
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

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