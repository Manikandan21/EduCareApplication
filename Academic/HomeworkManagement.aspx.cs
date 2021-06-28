using DataAccessComponent;
using DataAccessComponent.Academic;
using DataAccessComponent.MasterData;
using EntityComponent.Academic;
using EntityComponent.MasterData;
using ExceptionComponent;
using ILogisticsApplication.MasterPage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Academic
{
    public partial class HomeworkManagement : System.Web.UI.Page
    {
        string Message = string.Empty;
        bool Status = false;
        string DisplayMsg = string.Empty;
        string FormType = "2";
        AdminMaster Master = new AdminMaster();   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCourse();
            }
            if (Request.QueryString.Count > 1)
            {
                FormType = Request.QueryString["Response"];
                if (FormType != "1" && FormType != "2")
                {
                    Response.Redirect("../Error/404.aspx", false);
                }
            }
            else
            {
                Response.Redirect("../Error/404.aspx", false);
            }
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
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindCourse", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
            pnlExamSchedule.Visible = false;
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
            pnlExamSchedule.Visible = false;
        }
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtDate.Text = string.Empty;
            try
            {
                string CourseId = ddlCourse.SelectedItem.Value.Trim();
                if (CourseId != "0")
                {
                    string Course = ddlCourse.SelectedItem.Text.Trim();
                    BindSection(Course);
                }

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "ddlCourse_SelectedIndexChanged", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }

        protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sectionId = ddlSection.SelectedItem.Value.Trim();
            if (sectionId != "0")
            {
                //string course = ddlCourse.SelectedItem.Text.Trim();
                //string section = ddlSection.SelectedItem.Text.Trim();
                //BindData(course, section, "GetSubject");
                txtDate.Text = string.Empty;
                pnlExamSchedule.Visible = false;
            }
        }
        private void BindData(string course, string section, string Mode)
        {
            try
            {
                List<AcademicCommonEntity> lstAcademicCommonEntity = new List<AcademicCommonEntity>();
                AcademicCommonDA ObjAcademicCommonDA = new AcademicCommonDA();
                lstAcademicCommonEntity = ObjAcademicCommonDA.GetAcademicGrid(course, section, Mode);
                if (lstAcademicCommonEntity != null)
                {
                    grdHomework.DataSource = lstAcademicCommonEntity;
                    grdHomework.DataBind();
                    pnlExamSchedule.Visible = true;
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindData", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        private void BindHomework(string course, string section, string Mode)
        {
            try
            {
                List<EntityComponent.Academic.returnHomework> lstreturnHomework = new List<EntityComponent.Academic.returnHomework>();
                HomeworkDA ObjHomeworkDA = new HomeworkDA();
                lstreturnHomework = ObjHomeworkDA.GetHomework(course, section, txtDate.Text.Trim(), Mode);
                grdHomework.DataSource = lstreturnHomework;
                grdHomework.DataBind();
                pnlExamSchedule.Visible = true;
                divAction.Visible = true;
                if (lstreturnHomework.Count == 0)
                {
                    divAction.Visible = false;
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindHomework", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            string course = ddlCourse.SelectedItem.Text.Trim();
            string section = ddlSection.SelectedItem.Text.Trim();
            if (FormType == "1")
            {
                BindData(course, section, "GetHomework");
            }
            else if (FormType == "2")
            {
                BindHomework(course, section, "GetData");
            }
        }

        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            string Mode = string.Empty;
            if (FormType == "1")
            {
                Mode = "Insert";
            }
            else
            {
                Mode = "Update";
            }
            SaveExam(Mode);
        }
        private void SaveExam(string Mode)
        {
            try
            {
                EntityComponent.Academic.HomeworkContent ObjHomeworkContent = null;
                List<EntityComponent.Academic.HomeworkContent> lstHomeworkContent = new List<HomeworkContent>();
                EntityComponent.Academic.HomeworkEntity ObjHomeworkEntity = new EntityComponent.Academic.HomeworkEntity();

                ObjHomeworkEntity.Course = ddlCourse.SelectedItem.Text.Trim();
                ObjHomeworkEntity.Section = ddlSection.SelectedItem.Text.Trim();
                ObjHomeworkEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                ObjHomeworkEntity.HomeworkDate = Convert.ToString(txtDate.Text.Trim());
                foreach (GridViewRow gvr in grdHomework.Rows)
                {
                    ObjHomeworkContent = new EntityComponent.Academic.HomeworkContent();
                    ObjHomeworkContent.SubjectCode = Convert.ToString(((Label)gvr.Cells[3].FindControl("lblSubjectCode")).Text.Trim());
                    ObjHomeworkContent.Content = Convert.ToString(((TextBox)gvr.Cells[4].FindControl("txtDescription")).Text.Trim());
                    lstHomeworkContent.Add(ObjHomeworkContent);
                }
                ObjHomeworkEntity.lstHomeworkContent = lstHomeworkContent;
                HomeworkDA ObjHomeworkDA = new HomeworkDA();
                ObjHomeworkDA.SetHomeworkDetails(ObjHomeworkEntity, Mode, out Message, out Status);
                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        if (Mode == "Insert")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Homework saved successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else if (Mode == "Update")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Homework updated successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else
                        {
                            string script = "<script language='javascript'>" + "HideModalBackdrop()" + "</script>";
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "HideModalBackdrop", script, false);
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Homework details deleted successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearAll();
                }
                else
                {
                    if (Message == "Exist")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Homework already exist", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    if (Message == "NoRecord" && Mode=="Update")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Please check the selected data", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Homework is not saved successfully. Please try again later", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveExam", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        public void ClearAll()
        {
            ddlCourse.ClearSelection();
            ddlSection.Items.Clear();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
            txtDate.Text = string.Empty;
            pnlExamSchedule.Visible = false;
        }

        protected void grdHomework_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            string Mode = string.Empty;
            if (FormType == "2")
            {
                Mode = "Delete";
                SaveExam(Mode);
            }

        }

    }
}