using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Attendance;
using EntityComponent.User;
using Newtonsoft.Json;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for UnlockUser
    /// </summary>
    public class UnlockUser : IHttpHandler
    {
        string ResultString = string.Empty;
        DataAccessComponent.AccessControl.AuthenticationDataAccess ObjAuthenticationDataAccess = new DataAccessComponent.AccessControl.AuthenticationDataAccess();
        public void ProcessRequest(HttpContext context)
        {
            string strUserName  = Convert.ToString(context.Request.QueryString["UserName"]);
            string strMode = Convert.ToString(context.Request.QueryString["Mode"]); 
            string strUserType = Convert.ToString(context.Request.QueryString["UserType"]);
            string strUnlockUsers = Convert.ToString(context.Request.QueryString["UnlockUsers"]); 
            List<UnlockUserEntity> lstUsers = ObjAuthenticationDataAccess.GetSetLockedUnLockeduser(strMode,strUserName, strUserType , strUnlockUsers);
            var Json = JsonConvert.SerializeObject(lstUsers);
            ResultString = Json;
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