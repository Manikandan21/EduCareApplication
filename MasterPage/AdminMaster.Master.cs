using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent;
using DataAccessComponent.AccessControl;
using EntityComponent.AccessControl;
using EntityComponent.MasterData;
using ExceptionComponent;
using DataAccessComponent.MasterData;
namespace ILogisticsApplication.MasterPage
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int _displayTimeInMiliSec = (Session.Timeout - 2) * 60000;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(),
                    "message",
                    "<script type=\"text/javascript\" language=\"javascript\">Timer('" + _displayTimeInMiliSec + "');</script>",
                    false);
            }
            form1.Action = Request.Url.PathAndQuery;
            if (Session["UserId"] != null)
            {
                MasterDA ObjMasterDA = new MasterDA();
                bool Status = false;
                if (Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["PageLevelAuth"]))
                {
                    Status = Request.Url.LocalPath == ScreenExcemption() ? true : ObjMasterDA.CheckUserAccessURL(Convert.ToInt32(Request.QueryString["MenuID"]), Convert.ToInt32(Session["RoleId"].ToString()), ".." + Request.Url.LocalPath);
                }
                else
                {
                    Status = true;
                }
                
                if (Status)
                {
                    ThumbinalImage.ImageUrl = "../Handlers/UserProfileImg.ashx?UserID=" + Session["UserId"].ToString();
                    string data = Session["UserId"].ToString();
                    Page.Title = Convert.ToString(Session["RoleName"]);
                }
                else {
                    Response.Redirect("../Error/404.aspx");
                }
                
               
            }
            else
            {
                string path = HttpContext.Current.Request.Url.PathAndQuery;
                path = HttpUtility.UrlEncode(path);
                Response.Redirect("../Login.aspx?RedirectUrl=" + path);
                //if (Convert.ToBoolean(Session["IsAdminRole"]))
                //{
                //    Response.Redirect("../Login/AdminLogin.aspx?RedirectUrl=" + path);
                //}
                //else {
                //    Response.Redirect("../users/Login.aspx?RedirectUrl=" + path);
                //}
                
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
                ChangeMenuItems();
                Response.Redirect(ObjLandingPageEntity.LandingUrl, false);

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "btnSwitchRole_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }
        private void ChangeMenuItems()
        {
            List<MenuListDetails> lstMenuListDetails = new List<MenuListDetails>();
            MasterDataAccessComponent ObjMasterDataAccessComponent = new MasterDataAccessComponent();
            
                lstMenuListDetails = ObjMasterDataAccessComponent.GetMenuList("getmenu", 0, Convert.ToInt32(Session["RoleId"].ToString())).ToList();
                lstMenuListDetails = GetTreeView(lstMenuListDetails, 0);
                Session["MenuDetails"] = lstMenuListDetails;
        }
        public List<MenuListDetails> GetTreeView(List<MenuListDetails> lstMenuListDetails, int parent)
        {
            List<MenuListDetails> lst = new List<MenuListDetails>();
            return lstMenuListDetails.Where(x => x.ParentMenu == parent).Select(x => new MenuListDetails
            {
                MenuId = x.MenuId,
                MenuName = x.MenuName,
                Url = x.Url,
                ClassName = x.ClassName,
                ListMenu = GetTreeView(lstMenuListDetails, x.MenuId)
            }).ToList();
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
            //AuthenticationDataAccess ObjAuthenticationDataAccess = new AuthenticationDataAccess();
            //ObjAuthenticationDataAccess.UpdateLogOut(UserName, RoleID, UserID);
            RemoveSessionFromAppObject();
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Redirect("../Login.aspx");
            //if (RoleID == 6 || RoleID == 7)
            //{
            //    Response.Redirect("../Users/Login.aspx");
            //}
            //else
            //{
            //    Response.Redirect("../Login/AdminLogin.aspx");
            //}
        }
        private void RemoveSessionFromAppObject()
        {
            string userLoggedIn = Session["UserName"] == null ? string.Empty : (string)Session["UserName"];
            if (userLoggedIn.Length > 0)
            {
                System.Collections.Generic.List<string> d = Application["UsersLoggedIn"]
                    as System.Collections.Generic.List<string>;
                if (d != null)
                {
                    lock (d)
                    {
                        d.Remove(userLoggedIn);
                    }
                }
            }
        }
        private string ScreenExcemption()
        {          
            return "/Error/404.aspx";
        }

    }
}