using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Logout
    /// </summary>
    public class Logout : IHttpHandler, IRequiresSessionState
    {
        string Message = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            string Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            if (Mode == "logout")
            {
                int RoleID = Convert.ToInt32(context.Session["RoleId"].ToString());
                context.Session.Clear();
                context.Session.Abandon();
                context.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                context.Session["IsLogout"]=true;
                Message = "../Login.aspx";
            }
            context.Response.Write(Message);
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