using DataAccessComponent.Academic;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Users
{
    public partial class Homework : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            BindHomework(Convert.ToInt64(Session["UserId"].ToString()), "GetData");
        }
        private void BindHomework(long StudentID, string Mode)
        {
            try
            {
                List<EntityComponent.Academic.returnHomework> lstreturnHomework = new List<EntityComponent.Academic.returnHomework>();
                HomeworkDA ObjHomeworkDA = new HomeworkDA();
                lstreturnHomework = ObjHomeworkDA.GetHomeworkByUser(StudentID, txtDate.Text.Trim(), Mode);
                grdHomework.DataSource = lstreturnHomework;
                grdHomework.DataBind();
                pnlExamSchedule.Visible = true;
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindHomework", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
    }
}