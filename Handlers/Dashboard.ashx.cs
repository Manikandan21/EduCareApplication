using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Dashboard;
using System.Data;
using Newtonsoft.Json;
using System.Web.SessionState;
using DataAccessComponent;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Dashboard
    /// </summary>
    /// 
    public class Dashboard : IHttpHandler, IReadOnlySessionState
    {
        string Mode = string.Empty;
        int RoleID = 0;
        int UserID = 0;
        string ResultString = string.Empty;
        DashboardDA ObjDashboardDA = null;
        public Dashboard()
        {
            ObjDashboardDA = new DashboardDA();
        }
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            UserID= Convert.ToInt32(context.Session["UserId"].ToString());
            RoleID= Convert.ToInt32(context.Session["RoleId"].ToString());
            if (Mode == "GET")
            {
                DataSet ds = ObjDashboardDA.GetDashboardInfo(Mode, RoleID, UserID, null, null);
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        var Json = JsonConvert.SerializeObject(ds);
                        ResultString = Json;
                    }
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