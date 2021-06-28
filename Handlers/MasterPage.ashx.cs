using DataAccessComponent;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for MasterPage
    /// </summary>
    public class MasterPage : IHttpHandler, IReadOnlySessionState
    {

        string Mode = string.Empty;
        int UserID = 0;
        string ResultString = string.Empty;
        MasterDataAccessComponent ObjuMasterDataAccessComponent = null;
        public MasterPage()
        {
            ObjuMasterDataAccessComponent = new MasterDataAccessComponent();
        }
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            UserID = Convert.ToInt32(context.Session["UserId"].ToString());
            if (Mode == "GetMasterPageInfo")
            {
                MasterDataAccessComponent ObjMasterDataAccessComponent = new MasterDataAccessComponent();
                DataSet ds = ObjMasterDataAccessComponent.GetMasterPageInfo(UserID, Convert.ToInt32(context.Session["RoleId"].ToString()));
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