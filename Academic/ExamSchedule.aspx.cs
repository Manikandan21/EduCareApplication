using DataAccessComponent;
using EntityComponent.MasterData;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent.Academic;
using ILogisticsApplication.MasterPage;
namespace ILogisticsApplication.Academic
{
    public partial class ExamSchedule : System.Web.UI.Page
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
                string course = ddlCourse.SelectedItem.Text.Trim();
                string section = ddlSection.SelectedItem.Text.Trim();
                BindData(course, section, "GetExam");
            }
        }
        private void BindData(string course, string section, string Mode)
        {
            try
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();
                lstCommonEntity = ObjCommonDA.GetAcademicInfoForDDL(course, section, Mode);
                if (Mode == "GetExam")
                {
                    ddlExam.DataSource = lstCommonEntity;
                    ddlExam.DataTextField = "Name";
                    ddlExam.DataValueField = "Id";
                    ddlExam.DataBind();
                    ddlExam.Items.Insert(0, new ListItem("--Select Exam--", "0"));
                }
                else
                {
                    grdExamSchedule.DataSource = lstCommonEntity;
                    grdExamSchedule.DataBind();
                    pnlExamSchedule.Visible = true;
                    string script = "<script language='javascript'>" + "setDatepicker()" + "</script>";
                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "setDatepicker", script, false);
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindData", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        private void BindExamSchedule(string course, string section, string Mode)
        {
            try
            {
                List<EntityComponent.Academic.ExamEntity> lstExamEntity = new List<EntityComponent.Academic.ExamEntity>();
                ExamScheduleDA ObjExamScheduleDA = new ExamScheduleDA();
                lstExamEntity = ObjExamScheduleDA.GetExamSchedule(course, section, Convert.ToInt32(ddlExam.SelectedItem.Value), Mode);
                grdExamSchedule.DataSource = lstExamEntity;
                grdExamSchedule.DataBind();
                pnlExamSchedule.Visible = true;
                divAction.Visible = true;
                if (lstExamEntity.Count == 0)
                {
                    divAction.Visible = false;
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindExamSchedule", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            string course = ddlCourse.SelectedItem.Text.Trim();
            string section = ddlSection.SelectedItem.Text.Trim();
            if (FormType == "1")
            {
                BindData(course, section, "GetSubject");
            }
            else if (FormType == "2")
            {
                BindExamSchedule(course, section, "GetExamData");
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
                List<EntityComponent.Academic.ExamEntity> lstExamSchedule = new List<EntityComponent.Academic.ExamEntity>();
                EntityComponent.Academic.ExamEntity ObjExamEntity = null;
                //foreach (GridViewRow Gr in grdExamSchedule.Rows)
                //{
                //    TextBox txt = (TextBox)(Gr.Cells[2].FindControl("txtDate"));
                //    txt.ReadOnly = false;
                //}
                foreach (GridViewRow gvr in grdExamSchedule.Rows)
                {
                   
                    ObjExamEntity = new EntityComponent.Academic.ExamEntity();
                    if (Mode == "Update")
                    {
                        ObjExamEntity.Id = Convert.ToInt64(((Label)gvr.Cells[1].FindControl("lblSubjectId")).Text);
                    }
                    ObjExamEntity.ExamId = Convert.ToInt32(ddlExam.SelectedItem.Value.Trim());
                    ObjExamEntity.Course = ddlCourse.SelectedItem.Text.Trim();
                    ObjExamEntity.Section = ddlSection.SelectedItem.Text.Trim();
                    ObjExamEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                    ObjExamEntity.SubjectId = Convert.ToInt32(((Label)gvr.Cells[1].FindControl("lblSubjectId")).Text);
                    ObjExamEntity.ExamDate = Convert.ToString(((TextBox)gvr.Cells[2].FindControl("txtDate")).Text.Trim());
                    ObjExamEntity.ExamSession = Convert.ToInt32(((DropDownList)gvr.Cells[3].FindControl("ddlSession")).SelectedItem.Value.Trim());
                    lstExamSchedule.Add(ObjExamEntity);
                }
                ExamScheduleDA ObjExamScheduleDA = new ExamScheduleDA();
                ObjExamScheduleDA.SetExamScheduleDetails(lstExamSchedule, Mode, out Message, out Status);
                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        if (Mode == "Insert")
                        {
                            Master.DisplayMessage("Exam schedule saved successfully", 1, updatePanel);
                        }
                        else if (Mode == "Update")
                        {
                            Master.DisplayMessage("Exam schedule updated successfully", 1, updatePanel);
                        }
                        else
                        {
                            string script = "<script language='javascript'>" + "HideModalBackdrop()" + "</script>";
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "HideModalBackdrop", script, false);
                            Master.DisplayMessage("Exam schedule deleted successfully", 1, updatePanel);
                        }
                        //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearAll();
                }
                else
                {
                    if (Message == "Exist")
                    {
                        Master.DisplayMessage("Exam schedule already exist", 4, updatePanel);
                    }
                    else
                    {
                        Master.DisplayMessage("Exam schedule is not saved successfully. Please try again later", 4, updatePanel);
                    }
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveExam", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                Master.DisplayMessage("Error Occurred. Please try again", 2, updatePanel);
            }
        }
        public void ClearAll()
        {
            ddlCourse.ClearSelection();
            ddlSection.Items.Clear();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
            ddlExam.Items.Clear();
            ddlExam.Items.Insert(0, new ListItem("--Select Exam--", "0"));
            pnlExamSchedule.Visible = false;
        }

        protected void grdExamSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (FormType == "2")
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList ddlSessionData = (e.Row.FindControl("ddlSession") as DropDownList);
                    string Session = (e.Row.FindControl("lblSession") as Label).Text;
                    ddlSessionData.Items.FindByValue(Session).Selected = true;
                }
            }
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