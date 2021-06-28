using DataAccessComponent.AccessControl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for SessionExtend
    /// </summary>
    public class SessionExtend : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            if (Mode == "Extend")
            {
                context.Session.Timeout = 20;
            }
            else if (Mode == "Logout")
            {
                int RoleID = Convert.ToInt32(Convert.ToString(context.Session["RoleId"]));
                int UserID = Convert.ToInt32(Convert.ToString(context.Session["UserId"].ToString()));
                string UserName = Convert.ToString(context.Session["UserName"].ToString());              
                HttpContext.Current.Session.Clear();
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                string userLoggedIn = UserName == null ? string.Empty : UserName;
                if (userLoggedIn.Length > 0)
                {
                    System.Collections.Generic.List<string> d = context.Application["UsersLoggedIn"]
                        as System.Collections.Generic.List<string>;
                    if (d != null)
                    {
                        lock (d)
                        {
                            d.Remove(userLoggedIn);
                        }
                    }
                }
                //AuthenticationDataAccess ObjAuthenticationDataAccess = new AuthenticationDataAccess();
                //ObjAuthenticationDataAccess.UpdateLogOut(UserName, RoleID, UserID);
            }
            context.Response.Write(true);
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