using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent.Attendance;
using ExceptionComponent;
using EntityComponent.MasterData;
using DataAccessComponent;
namespace ILogisticsApplication.Attendance
{
    public partial class MarkHolidays : System.Web.UI.Page
    {
        string Message = string.Empty;
        bool Status = false;
        string DisplayMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            string Mode = Convert.ToString(Request.QueryString["Mode"]);
            if (Mode == "1")
            {
                pnlHolidays.Visible = true;
            }
            else if (Mode == "2")
            {
                pnlClearData.Visible = true;
                if (!Page.IsPostBack)
                {
                    BindCourse();
                }
            }
            else
            {

            }
        }

        protected void btnMarkHolidays_Click(object sender, EventArgs e)
        {
            try
            {
                string Mode = string.Empty;
                string strDescription = string.Empty;
                string Date = hdnDate.Value.Trim();
                strDescription = txtHolidayDescription.Text.TrimEnd(' ');
                Mode = ddlType.SelectedItem.Text.Trim();
                int userId = Convert.ToInt32(Session["UserId"].ToString());

                StudentAttendanceDA ObjStudentAttendanceDA = new StudentAttendanceDA();
                ObjStudentAttendanceDA.SetWeekEndandHoliday(Date, userId, Mode, strDescription, out Status, out Message);

                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Mode + " marked successfully", 1);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearAll();
                }
                else
                {
                    if (Message == "Exist")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Already attendance marked. Please check before proceed", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    UnClear();
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "btnMarkHolidays_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2);
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                UnClear();
            }
        }

        public void ClearAll()
        {
            txtDate.Text = string.Empty;
            ddlType.ClearSelection();
            txtHolidayDescription.Text = string.Empty;
        }
        public void UnClear()
        {
            txtDate.Text = hdnDate.Value.Trim();
        }


        public void BindCourse()
        {
            try
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();
                lstCommonEntity = ObjCommonDA.BindDropdownList("GetCourse", null, 0);
                ddlCourse.DataSource = lstCommonEntity;
                ddlCourse.DataTextField = "Name";
                // ddlCourse.DataValueField = "Id";
                ddlCourse.DataBind();
                ddlCourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                ddlCourse.Items.Insert(1, new ListItem("All", "1000"));
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void BindSection(string Course)
        {
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            lstCommonEntity = ObjCommonDA.BindDropdownList("GetSection", Course, 0);
            ddlSection.DataSource = lstCommonEntity;
            ddlSection.DataTextField = "Name";
            ddlSection.DataValueField = "Id";
            ddlSection.DataBind();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
            ddlSection.Items.Insert(1, new ListItem("All", "1000"));
        }



        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Course = ddlCourse.SelectedItem.Text.Trim();
                if (Course != "--Select Course--" && Course != "All")
                {
                    BindSection(Course);
                    divSection.Visible = true;
                    divClearAction.Visible = false;
                }
                else if (Course == "All")
                {
                    divClearAction.Visible = true;
                    divSection.Visible = false;
                }
                else
                {
                    ddlSection.Items.Clear();
                    ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
                    divClearAction.Visible = false;
                    divSection.Visible = false;
                }
                txtClearDate.Text = hdnDate.Value;
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Section = ddlSection.SelectedItem.Text.Trim();
                if (Section != "--Select Section--")
                {
                    divClearAction.Visible = true;
                }
                else
                {
                    divClearAction.Visible = false;
                }
                txtClearDate.Text = hdnDate.Value;
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnClearData_Click(object sender, EventArgs e)
        {
            string Mode = string.Empty;
            string Course = string.Empty;
            string Section = string.Empty;
            string Date = hdnDate.Value;
            int userId = Convert.ToInt32(Session["UserId"].ToString());
            Course = ddlCourse.SelectedItem.Text.Trim();
            Section = ddlSection.SelectedItem.Text.Trim();

            if (Course == "All")
            {
                Mode = "ClearAll";
            }
            else
            {
                if (Course != "All" && Section == "All")
                {
                    Mode = "ClearCourse";
                }
                else
                {
                    Mode = "ClearSection";
                }
            }
            try
            {
                StudentAttendanceDA ObjStudentAttendanceDA = new StudentAttendanceDA();
                ObjStudentAttendanceDA.SetClearAttendanceData(Date, Course, Section, userId, Mode, out Status, out Message);

                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data cleared successfully", 1);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearAll();
                }
                else
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data is not cleared successfully. Please contact Administrator", 4);
                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "btnClearData_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2);
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            }
        }
    }
}