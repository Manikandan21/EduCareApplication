using DataAccessComponent;
using DataAccessComponent.Attendance;
using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Configuration
{
    public partial class AssignTeacher : System.Web.UI.Page
    {
        string Message = string.Empty;
        bool Status = false;
        string DisplayMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCourse();
                BindUserList();
                BindAssignedDetails("GetData", 0);
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
        }

        public void BindUserList()
        {
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            lstCommonEntity = ObjCommonDA.BindDropdownList("UserList", null, 0);
            ddlClassTeacher.DataSource = lstCommonEntity;
            ddlClassTeacher.DataTextField = "Name";
            ddlClassTeacher.DataValueField = "Id";
            ddlClassTeacher.DataBind();
            ddlClassTeacher.Items.Insert(0, new ListItem("--Select User--", "0"));
        }


        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Course = ddlCourse.SelectedItem.Text.Trim();
                if (Course != "0")
                {
                    if (hdnId.Value == "")
                    {
                        BindSection(Course);
                    }

                }               

            }
            catch (Exception)
            {
                throw;
            }
        }

      
        protected void btnAssignTeacher_Click(object sender, EventArgs e)
        {
            string Std=ddlCourse.SelectedItem.Text.Trim();
            string Section = hdnSection.Value.ToString();
            int UserId=Convert.ToInt32(ddlClassTeacher.SelectedItem.Value);
            int Id = 0;
            if (hdnId.Value != "")
            {
                Id = Convert.ToInt32(hdnId.Value) ;
            }
            SaveClassTeacher(Std, Section, UserId, Id);
        }
        public void SaveClassTeacher(string std,string Section,int UserId,int Id)
        {
            AssignClassTeacherEntity ObjAssignClassTeacherEntity = new AssignClassTeacherEntity();
            if (Id == 0)
            {
                ObjAssignClassTeacherEntity.Mode = "Insert";
            }
            else
            {
                ObjAssignClassTeacherEntity.Mode = hdnMode.Value;
                ObjAssignClassTeacherEntity.Id = Id;
            }
            ObjAssignClassTeacherEntity.Std = std;
            ObjAssignClassTeacherEntity.Section = Section;
            ObjAssignClassTeacherEntity.UserId = UserId;
            ObjAssignClassTeacherEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
            try
            {
                AssignTeacherDA ObjAssignTeacherDA = new AssignTeacherDA();
                ObjAssignTeacherDA.SetAssignTeacher(ObjAssignClassTeacherEntity, out Message, out Status);
                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        if (ObjAssignClassTeacherEntity.Mode == "Insert")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Class teacher assigned successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else if (ObjAssignClassTeacherEntity.Mode == "Update")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Class teacher updated successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Class teacher assignment deleted successfully", 1);
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
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Already assigned for selected course", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Class teacher is not assigned successfully. Please contact Administrator", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveClassTeacher", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2);
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
            }
        }

        public void BindAssignedDetails(string Mode,int Id)
        {
            List<AssignClassTeacherEntity> lstAssignClassTeacherEntity = new List<AssignClassTeacherEntity>();
            AssignTeacherDA ObjAssignTeacherDA = new AssignTeacherDA();
            lstAssignClassTeacherEntity = ObjAssignTeacherDA.GetAssignTeacher(Mode, Id);

            grdList.DataSource = lstAssignClassTeacherEntity;
            grdList.DataBind();
            
        }

        public void ClearAll()
        {
            ddlCourse.ClearSelection();
            ddlSection.Items.Clear();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
            hdnId.Value = "";
            hdnSection.Value = "";
            BindUserList();
            BindAssignedDetails("GetData", 0);
        }

       
        protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSection.SelectedValue != "0")
            {
                hdnSection.Value = ddlSection.SelectedItem.Text.Trim();
            }
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            int Id=0;
            if (hdnId.Value != "")
            {
               Id = Convert.ToInt32(hdnId.Value);
            }
            SaveClassTeacher(null, null, 0, Id);
        }

        protected void grdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdList.PageIndex = e.NewPageIndex;
            BindAssignedDetails("GetData", 0);
        }

       
    }
}