using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent;
using EntityComponent.AccessControl;


namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for ChangePassword
    /// </summary>
    public class ChangePassword : IHttpHandler
    {
        DataAccessComponent.AccessControl.AuthenticationDataAccess ObjAuthenticationDataAccess = new DataAccessComponent.AccessControl.AuthenticationDataAccess();
        public void ProcessRequest(HttpContext context)
        {
            string RoleId = Convert.ToString(context.Request.QueryString["RoleID"]);
            string strOldPassword = Convert.ToString(context.Request.QueryString["OldPassword"]);
            string strNewPassword = Convert.ToString(context.Request.QueryString["NewPassword"]);
            string strUserName = Convert.ToString(context.Request.QueryString["UserName"]);
            int RetValue; 
            if (!string.IsNullOrEmpty(RoleId))
            {
                RetValue = ObjAuthenticationDataAccess.ChangePassword(Convert.ToInt32(RoleId), strOldPassword, strNewPassword , strUserName);
            }
            else
            {
                RetValue = 0; // Return this value to indicate the role id is not coming from the request.
            }
           context.Response.Write(RetValue);
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