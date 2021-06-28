using DataAccessComponent.AccessControl;
using EntityComponent.AccessControl;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.MasterPage
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            form1.Action = Request.Url.PathAndQuery;
            if (Session["UserId"] != null)
            {
                string data = Session["UserId"].ToString();
                Page.Title = Convert.ToString(Session["RoleName"]);
            }
            else
            {
                Response.Redirect("../Users/login.aspx");
            }
        }

        protected void btnSwitchRole_Click(object sender, EventArgs e)
        {
            try
            {
                LandingPageEntity ObjLandingPageEntity = new LandingPageEntity();
                string LandingUrl = string.Empty;
                string RoleName = string.Empty;
                int RoleId = Convert.ToInt32(hdnMasterRole.Value);
                int userId = Convert.ToInt32(Session["UserId"]);
                AuthenticationDataAccess ObjAuthenticationDataAccess = new AuthenticationDataAccess();
                ObjLandingPageEntity = ObjAuthenticationDataAccess.GetLandingPage(userId, RoleId, "GetLandingSwitchRole");
                Session["RoleName"] = Convert.ToString(ObjLandingPageEntity.RoleName);
                Session["RoleId"] = Convert.ToString(ObjLandingPageEntity.RoleId);
                Session["IsAdminRole"] = Convert.ToString(ObjLandingPageEntity.IsAdminRole);
                Response.Redirect(ObjLandingPageEntity.LandingUrl, false);

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "btnSwitchRole_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }

        public void DisplayMessage(string Message, int type, Control controlID)
        {
            string DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, type);
            ScriptManager.RegisterStartupScript(controlID, typeof(Page), "popupScript", DisplayMsg, false);
        }
        public void DisplayMessage(string Message, int type)
        {
            string DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, type);
            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            //int status = 0;
            int RoleID = Convert.ToInt32(Session["RoleId"].ToString());
            int UserID = Convert.ToInt32(Session["UserId"].ToString());
            string UserName = Convert.ToString(Session["UserName"].ToString());
            AuthenticationDataAccess ObjAuthenticationDataAccess = new AuthenticationDataAccess();
            ObjAuthenticationDataAccess.UpdateLogOut(UserName, RoleID, UserID);
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            if (RoleID == 6 || RoleID == 7)
            {
                //Response.Redirect("../Users/Login.aspx?EndUser=1");
                Response.Redirect("../Users/Login.aspx");
            }
            else
            {
                Response.Redirect("../Login/AdminLogin.aspx");
            }
        }

    }
}