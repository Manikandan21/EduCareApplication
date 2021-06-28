using DataAccessComponent;
using DataAccessComponent.Academic;
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

namespace ILogisticsApplication.Attendance
{
    public partial class InOutManagement : System.Web.UI.Page
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
                 ddlCourse.DataValueField = "Id";
                ddlCourse.DataBind();
                ddlCourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindCourse", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
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
                else
                {
                    ddlSection .Items.Clear();
                    ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
                    ddlStudent.Items.Clear();
                    ddlStudent.Items.Insert(0, new ListItem("--Select Student--", "0"));
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
                BindStudentData(course, section, "DdlStudent");
            }
            else
            {
                ddlStudent.Items.Clear();
                ddlStudent.Items.Insert(0, new ListItem("--Select Student--", "0"));
            }
        }
       
        private void BindStudentData(string course, string section, string Mode)
        {
            try
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();
                lstCommonEntity = ObjCommonDA.GetStudentForDDL(course, section, Mode);
                if (Mode == "DdlStudent")
                {
                    ddlStudent.DataSource = lstCommonEntity;
                    ddlStudent.DataTextField = "Name";
                    ddlStudent.DataValueField = "Id";
                    ddlStudent.DataBind();
                    ddlStudent.Items.Insert(0, new ListItem("--Select Student--", "0"));
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindData", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
   
        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
       
        }
        private void SaveAcademic(string Mode)
        {
            try
            {
                List<EntityComponent.Academic.MarkSet> lstMarkSet = new List<EntityComponent.Academic.MarkSet>();
                MarkSet ObjMarkSet = null;
                EntityComponent.Academic.AcademicDetailsEntity ObjAcademicDetailsEntity = new AcademicDetailsEntity(); ;

                ObjAcademicDetailsEntity.StudentId = Convert.ToInt64(ddlStudent.SelectedItem.Value);
                ObjAcademicDetailsEntity.Course = ddlCourse.SelectedItem.Text.ToString();
                ObjAcademicDetailsEntity.Section = ddlSection.SelectedItem.Text.ToString();
                ObjAcademicDetailsEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                ObjAcademicDetailsEntity.Mode = Mode;
               
                AcademicDA ObjAcademicDA = new AcademicDA();
                ObjAcademicDA.SetAcademicDetails(ObjAcademicDetailsEntity, out Message, out Status);
                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        if (Mode == "Insert")
                        {
                            Master.DisplayMessage("Academic details saved successfully", 1, updatePanel);
                        }
                        else if (Mode == "Update")
                        {
                            Master.DisplayMessage("Academic details updated successfully", 1, updatePanel);
                        }
                        else
                        {
                            string script = "<script language='javascript'>" + "HideModalBackdrop()" + "</script>";
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "HideModalBackdrop", script, false);
                            Master.DisplayMessage("Academic details deleted successfully", 1, updatePanel);
                        }
                        //this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    ClearAll();
                }
                else
                {
                    if (Message == "Exist")
                    {
                        Master.DisplayMessage("Academic details already exist", 4, updatePanel);
                    }
                    else
                    {
                        Master.DisplayMessage("Academic details is not saved successfully. Please try again later", 4, updatePanel);
                    }
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveAcademic", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                Master.DisplayMessage("Error Occurred. Please try again", 2, updatePanel);
            }
        }
        public void ClearAll()
        {
            ddlCourse.ClearSelection();
            ddlSection.Items.Clear();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
            ddlStudent.Items.Clear();
            ddlStudent.Items.Insert(0, new ListItem("--Select Student--", "0"));
         
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            string course = ddlCourse.SelectedItem.Text.Trim();
            string section = ddlSection.SelectedItem.Text.Trim();
            if (FormType == "1")
            {
                //BindData(course, section, "GetAcadmic");
            }
            else if (FormType == "2")
            {
               // BindAcademicDetails(course, section, Convert.ToInt32(ddlExam.SelectedItem.Value), Convert.ToInt64(ddlStudent.SelectedItem.Value), "GetData");
            }
        }
        private void BindAcademicDetails(string course, string section, int ExamID, long StudentID, string Mode)
        {
            try
            {
                AcademicDetailsEntity ObjAcademicDetailsEntity = new AcademicDetailsEntity();
                AcademicDA ObjAcademicDA = new AcademicDA();
                ObjAcademicDetailsEntity = ObjAcademicDA.GetAcademic(course, section, ExamID, StudentID, Mode);
                List<AcademicViewCommonEntity> lstAcademicViewCommonEntity = new List<AcademicViewCommonEntity>();
                if (ObjAcademicDetailsEntity != null)
                {                  
                    AcademicCommonDA ObjAcademicCommonDA = new AcademicCommonDA();
                    lstAcademicViewCommonEntity = ObjAcademicCommonDA.GetViewAcademicGrid(course, section, "GetAcadmic");
                    for (int i = 0; i < lstAcademicViewCommonEntity.Count; i++)
                    {
                        for (int j = 0; j < ObjAcademicDetailsEntity.MarkSet.Count; j++)
                        {
                            if (lstAcademicViewCommonEntity[i].Id == ObjAcademicDetailsEntity.MarkSet[j].SubjectId)
                            {
                                lstAcademicViewCommonEntity[i].Marks = ObjAcademicDetailsEntity.MarkSet[j].Marks;
                            }
                        }
                    }

                   
                }
                else
                {           
                  
                }                
                
               
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindAcademicDetails", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearGrid();
        }

        protected void ddlExam_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearGrid();
        }
        private void ClearGrid()
        {
        
        }
    }
}