using DataAccessComponent;
using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Configuration
{
    public partial class CourseExamMapping : System.Web.UI.Page
    {
        bool status = false;
        string Message = string.Empty;
        string DisplayMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCourse();
                pnlAction.Visible = false;
                divSection.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
                divExam.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
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
            }


        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Save();
        }
        public void Save()
        {
            try
            {
                CourseExamEntity ObjCourseExamEntity = new CourseExamEntity();
                CourseSubjectMappingDA ObjCourseSubjectMappingDA = new CourseSubjectMappingDA();

                ObjCourseExamEntity.Course = ddlCourse.SelectedItem.Text.Trim();
                for (int i = 0; i < chkSection.Items.Count; i++)
                {
                    if (chkSection.Items[i].Selected)
                    {
                        if (string.IsNullOrEmpty(ObjCourseExamEntity.Section))
                        {
                            ObjCourseExamEntity.Section = chkSection.Items[i].Text;
                        }
                        else
                        {
                            ObjCourseExamEntity.Section += "," + chkSection.Items[i].Text;
                        }
                    }
                }
                for (int i = 0; i < chkExam.Items.Count; i++)
                {
                    if (chkExam.Items[i].Selected)
                    {
                        if (string.IsNullOrEmpty(ObjCourseExamEntity.Exam))
                        {
                            ObjCourseExamEntity.Exam = chkExam.Items[i].Value;
                        }
                        else
                        {
                            ObjCourseExamEntity.Exam += "," + chkExam.Items[i].Value;
                        }
                    }
                }
                ObjCourseExamEntity.Exam = ObjCourseExamEntity.Exam + ",";
                ObjCourseExamEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                ObjCourseSubjectMappingDA.SetCourseExamMapping(ObjCourseExamEntity, "BulkInsert", out Message, out status);
                if (status == true)
                {
                    if (Message.Contains("Success"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Course and Exam saved successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearData();
                }
                else
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Course and Exam not saved successfully", 2);
                    this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                }

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "CourseExamMapping_Save_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error occurred. Please contact system Administrator", 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            }
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            ClearData();
        }
        public void ClearData()
        {
            BindCourse();
            pnlAction.Visible = false;
            divSection.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
            divExam.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Course = ddlCourse.SelectedItem.Text.Trim();
                if (ddlCourse.SelectedItem.Value != "0")
                {
                    BindSection(Course);
                    BindExam();
                    divSection.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "block";
                    divExam.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "block";
                    pnlAction.Visible = true;
                }
                else
                {
                    divSection.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
                    divExam.Attributes.CssStyle[HtmlTextWriterStyle.Display] = "none";
                    pnlAction.Visible = false;
                }

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "ddlCourse_SelectedIndexChanged", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }

        }
        public void BindSection(string Course)
        {
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            lstCommonEntity = ObjCommonDA.BindDropdownList("GetSection", Course, 0);
            chkSection.DataSource = lstCommonEntity;
            chkSection.DataTextField = "Name";
            chkSection.DataValueField = "Id";
            chkSection.DataBind();

        }
        public void BindExam()
        {
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            lstCommonEntity = ObjCommonDA.BindDropdownList("GetExam", "", 0);
            chkExam.DataSource = lstCommonEntity;
            chkExam.DataTextField = "Name";
            chkExam.DataValueField = "Id";
            chkExam.DataBind();

        }

    }
}