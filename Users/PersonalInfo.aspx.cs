using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Users
{
    public partial class PersonalInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                hdnId.Value = Convert.ToString(Session["UserId"].ToString());
            }
            else
            {
                string path = HttpContext.Current.Request.Url.PathAndQuery;
                path = HttpUtility.UrlEncode(path);
                Response.Redirect("../Users/login.aspx");
            }
        }
    }
}