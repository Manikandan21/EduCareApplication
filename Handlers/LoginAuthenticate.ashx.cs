using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent;
using EntityComponent.AccessControl;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for LoginAuthenticate
    /// </summary>
    public class LoginAuthenticate : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        DataAccessComponent.AccessControl.AuthenticationDataAccess ObjAuthenticationDataAccess = new DataAccessComponent.AccessControl.AuthenticationDataAccess();
        bool status = false;
        string Message = string.Empty;
        int UserId = 0;
        int roleID = 0;
        string LoggedUserName = string.Empty;
        string LastLogin = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            string Mode = Convert.ToString(context.Request.QueryString["Mode"]);

            if (!string.IsNullOrEmpty(Mode))
             {
                string Username = Convert.ToString(context.Request.QueryString["Uid"]);
                string Password = Convert.ToString(context.Request.QueryString["Pwd"]);
                //string strNewPassword = System.Web.Security.Membership.GeneratePassword(10,0);
                ObjAuthenticationDataAccess.GetLoginAuthentication(Username, Password, Mode, out status, out Message, out UserId, out roleID,out LoggedUserName,out LastLogin);

                if (status == true)
                {
                        context.Session["UserId"] = Convert.ToString(UserId.ToString());
                        string LandingUrl = string.Empty;
                        string Rolename = string.Empty;
                        LandingPageEntity ObjLandingPageEntity = new LandingPageEntity();
                        ObjLandingPageEntity = ObjAuthenticationDataAccess.GetLandingPage(UserId, roleID, "GetLandingByRole");
                        Message = ObjLandingPageEntity.LandingUrl;
                        context.Session["UserName"] = Username;
                        context.Session["RoleName"] = Convert.ToString(ObjLandingPageEntity.RoleName);
                        context.Session["RoleId"] = Convert.ToString(ObjLandingPageEntity.RoleId);
                        context.Session["IsAdminRole"] = Convert.ToString(ObjLandingPageEntity.IsAdminRole);
                        context.Session["LastLogin"] = LastLogin;
                        context.Session["LoggedUserName"] = LoggedUserName  ;
                }
                else
                {
                    context.Session["UserId"] = string.Empty;
                }
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