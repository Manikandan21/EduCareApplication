using DataAccessComponent;
using DataAccessComponent.Academic;
using DataAccessComponent.MasterData;
using EntityComponent.Academic;
using EntityComponent.MasterData;
using ExceptionComponent;
using ILogisticsApplication.MasterPage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ILogisticsApplication.Academic
{
    public partial class Timetable : System.Web.UI.Page
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
            // txtDate.Text = string.Empty;
            try
            {
                string CourseId = ddlCourse.SelectedItem.Value.Trim();
                if (CourseId != "0")
                {
                    string Course = ddlCourse.SelectedItem.Text.Trim();
                    BindSection(Course);
                }
                pnlExamSchedule.Visible = false;
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "ddlCourse_SelectedIndexChanged", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }

        protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlExamSchedule.Visible = false;
            string sectionId = ddlSection.SelectedItem.Value.Trim();
            if (sectionId != "0")
            {
                //string course = ddlCourse.SelectedItem.Text.Trim();
                //string section = ddlSection.SelectedItem.Text.Trim();
                //BindData(course, section, "GetSubject");
                //txtDate.Text = string.Empty;
                //pnlExamSchedule.Visible = false;
            }
        }
        private void BindData(string course, string section, string Mode)
        {
            try
            {
                grdHomework.DataSource = null;
                int TotalHours = Convert.ToInt32(hdnHours.Value);
                List<AcademicCommonEntity> lstAcademicCommonEntity = new List<AcademicCommonEntity>();
                AcademicCommonDA ObjAcademicCommonDA = new AcademicCommonDA();
                List<HoursPerSubject> lstHoursPerSubject = new List<HoursPerSubject>();
                lstAcademicCommonEntity = ObjAcademicCommonDA.GetAcademicGrid(course, section, Mode);

                string[,] ddlDay = { { "1", "Monday" }, { "2", "Tuesday" }, { "3", "Wednesday" }, { "4", "Thursday" }, { "5", "Friday" } };
                DataTable dt = new DataTable();
                dt.Columns.Add("Day", Type.GetType("System.String"));
                dt.Columns.Add("DayByName", Type.GetType("System.String"));
                for (int i = 0; i < 5; i++)
                {
                    dt.Rows.Add();
                    dt.Rows[dt.Rows.Count - 1]["Day"] = ddlDay[i, 0];
                    dt.Rows[dt.Rows.Count - 1]["DayByName"] = ddlDay[i, 1];
                }
                if (lstAcademicCommonEntity.Count == 0)
                {
                    dt = null;
                }
                grdHomework.DataSource = dt;
                grdHomework.DataBind();

                foreach (GridViewRow row in grdHomework.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        string[] ddlColumn = new string[] { "ddlI", "ddlII", "ddlIII", "ddlIV", "ddlV", "ddlVI", "ddlVII", "ddlVIII", "ddlIX", "ddlX" };
                        int length = 0;
                        if (FormType == "1")
                        {
                            length = ddlColumn.Length;
                        }
                        else
                        {
                            length = TotalHours;
                        }
                        for (int i = 0; i < ddlColumn.Length; i++)
                        {
                            DropDownList ddlSubject = (DropDownList)row.FindControl(ddlColumn[i]);
                            ddlSubject.DataSource = lstAcademicCommonEntity;
                            ddlSubject.DataTextField = "Subject";
                            ddlSubject.DataValueField = "Id";
                            ddlSubject.DataBind();
                            ddlSubject.Items.Insert(0, new ListItem("--Subject--", "0"));


                            if (i + 1 > TotalHours)
                            {
                                grdHomework.Columns[i + 2].Visible = false;
                                //grdHomework.HeaderRow.Cells[i + 2].Visible = false;
                                //row.Cells[i].Visible = false;
                            }
                            else
                            {
                                grdHomework.Columns[i + 2].Visible = true;
                            }
                        }
                    }
                }

                if (lstAcademicCommonEntity.Count == 0)
                {
                    divAction.Visible = false;
                }
                pnlExamSchedule.Visible = true;
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindData", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        private void BindTimetableConfig(string course, string section, string Mode)
        {
            TimetableDA ObjTimetableDA = new TimetableDA();
            List<TimeTableConfigEntity> lstTimeTableConfigEntity = new List<TimeTableConfigEntity>();
            lstTimeTableConfigEntity = ObjTimetableDA.GetTimetableConfig(course, section, Mode, 0);
            if (lstTimeTableConfigEntity.Count > 0)
            {
                hdnHours.Value = lstTimeTableConfigEntity[0].TotalHours.ToString();
            }
            else
            {
                hdnHours.Value = "8";
            }
        }
        private void BindTimetable(string course, string section, string Mode)
        {
            try
            {
                BindTimetableConfig(course, section, "GetDataConfig");
                //BindData(course, section, "GetHomework");

                int TotalHours = Convert.ToInt32(hdnHours.Value);
                TimeTableEntity ObjTimeTableEntity = new TimeTableEntity();
                TimetableDA ObjTimetableDA = new TimetableDA();
                ObjTimeTableEntity = ObjTimetableDA.GetTimetable(ddlCourse.SelectedItem.Text.Trim(), ddlSection.SelectedItem.Text.Trim(), "GetData");

                List<HoursPerSubject> lstHoursPerSubject = new List<HoursPerSubject>();
                hdnID.Value = Convert.ToString(ObjTimeTableEntity.ID);
                lstHoursPerSubject = ObjTimeTableEntity.SubjectList;
                grdHomework.DataSource = lstHoursPerSubject;
                grdHomework.DataBind();
                if (ObjTimeTableEntity.SubjectList != null)
                {
                    List<AcademicCommonEntity> lstAcademicCommonEntity = new List<AcademicCommonEntity>();
                    AcademicCommonDA ObjAcademicCommonDA = new AcademicCommonDA();
                    lstAcademicCommonEntity = ObjAcademicCommonDA.GetAcademicGrid(course, section, "GetTimetable");
                    foreach (GridViewRow row in grdHomework.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            string[] ddlColumn = new string[] { "ddlI", "ddlII", "ddlIII", "ddlIV", "ddlV", "ddlVI", "ddlVII", "ddlVIII", "ddlIX", "ddlX" };
                            int length = 0;
                            if (FormType == "1")
                            {
                                length = ddlColumn.Length;
                            }
                            else
                            {
                                length = TotalHours;
                            }
                            for (int i = 0; i < ddlColumn.Length; i++)
                            {
                                DropDownList ddlSubject = (DropDownList)row.FindControl(ddlColumn[i]);
                                ddlSubject.DataSource = lstAcademicCommonEntity;
                                ddlSubject.DataTextField = "Subject";
                                ddlSubject.DataValueField = "Id";
                                ddlSubject.DataBind();
                                ddlSubject.Items.Insert(0, new ListItem("Subject", "0"));

                                var subject = ObjTimeTableEntity.SubjectList[row.RowIndex].GetType().GetProperty(ddlColumn[i].Remove(0, 3)).GetValue(ObjTimeTableEntity.SubjectList[row.RowIndex], null);
                                ddlSubject.SelectedValue = subject.ToString();

                                if (i + 1 > TotalHours)
                                {
                                    grdHomework.Columns[i + 2].Visible = false;
                                    //grdHomework.HeaderRow.Cells[i + 2].Visible = false;
                                    //row.Cells[i].Visible = false;
                                }
                                else
                                {
                                    grdHomework.Columns[i + 2].Visible = true;
                                }
                            }
                        }
                    }
                    divAction.Visible = true;
                }
                else
                {
                    divAction.Visible = false;
                }

                pnlExamSchedule.Visible = true;

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindTimetable", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            string course = ddlCourse.SelectedItem.Text.Trim();
            string section = ddlSection.SelectedItem.Text.Trim();
            if (FormType == "1")
            {
                BindTimetableConfig(course, section, "GetDataConfig");
                BindData(course, section, "GetTimetable");
            }
            else if (FormType == "2")
            {
                BindTimetable(course, section, "GetData");
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
            SaveTimetable(Mode);
        }
        private void SaveTimetable(string Mode)
        {
            try
            {
                int TotalHours = Convert.ToInt32(hdnHours.Value.Trim());
                EntityComponent.Academic.TimeTableEntity ObjTimeTableEntity = new TimeTableEntity();
                List<EntityComponent.Academic.HoursPerSubject> lstHoursPerSubject = new List<HoursPerSubject>();
                if (Mode == "Update")
                {
                    ObjTimeTableEntity.ID = Convert.ToInt32(hdnID.Value);
                }
                ObjTimeTableEntity.Course = ddlCourse.SelectedItem.Text.Trim();
                ObjTimeTableEntity.Section = ddlSection.SelectedItem.Text.Trim();
                ObjTimeTableEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                if (Mode != "Delete")
                {
                    foreach (GridViewRow gvr in grdHomework.Rows)
                    {
                        HoursPerSubject ObjHoursPerSubject = new EntityComponent.Academic.HoursPerSubject();

                        ObjHoursPerSubject.DayByName = Convert.ToString(((Label)gvr.Cells[0].FindControl("lblDayByName")).Text.Trim());
                        ObjHoursPerSubject.Day = Convert.ToInt32(((Label)gvr.Cells[1].FindControl("lblDay")).Text.Trim());
                        ObjHoursPerSubject.I = Convert.ToInt32(((DropDownList)gvr.Cells[2].FindControl("ddlI")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.II = Convert.ToInt32(((DropDownList)gvr.Cells[3].FindControl("ddlII")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.III = Convert.ToInt32(((DropDownList)gvr.Cells[4].FindControl("ddlIII")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.IV = Convert.ToInt32(((DropDownList)gvr.Cells[5].FindControl("ddlIV")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.V = Convert.ToInt32(((DropDownList)gvr.Cells[6].FindControl("ddlV")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.VI = Convert.ToInt32(((DropDownList)gvr.Cells[7].FindControl("ddlVI")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.VII = Convert.ToInt32(((DropDownList)gvr.Cells[8].FindControl("ddlVII")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.VIII = Convert.ToInt32(((DropDownList)gvr.Cells[9].FindControl("ddlVIII")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.IX = Convert.ToInt32(((DropDownList)gvr.Cells[10].FindControl("ddlIX")).SelectedItem.Value.Trim());
                        ObjHoursPerSubject.X = Convert.ToInt32(((DropDownList)gvr.Cells[11].FindControl("ddlX")).SelectedItem.Value.Trim());

                        lstHoursPerSubject.Add(ObjHoursPerSubject);
                    }
                    ObjTimeTableEntity.SubjectList = lstHoursPerSubject;
                }
                TimetableDA ObjTimetableDA = new TimetableDA();
                ObjTimetableDA.SetTimetableDetails(ObjTimeTableEntity, Mode, out Message, out Status);

                if (Status == true)
                {
                    if (Message == "Success")
                    {
                        if (Mode == "Insert")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Timetable saved successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                            ClearAll();
                        }
                        else if (Mode == "Update")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Timetable updated successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                            BindTimetable(ddlCourse.SelectedItem.Text.Trim(), ddlSection.SelectedItem.Text.Trim(), "GetData");
                        }
                        else
                        {
                            string script = "<script language='javascript'>" + "HideModalBackdrop()" + "</script>";
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "HideModalBackdrop", script, false);
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Timetable details deleted successfully", 1);
                            ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                            ClearAll();
                        }
                    }
                }
                else
                {
                    if (Message == "Exist")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Timetable already exist", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    if (Message == "NoRecord" && Mode == "Update")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Please check the selected data", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Timetable is not saved successfully. Please try again later", 4);
                        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveTimetable", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        public void ClearAll()
        {
            grdHomework.DataSource = null;
            grdHomework.DataBind();
            pnlExamSchedule.Visible = false;
            divAction.Visible = false;
            ddlCourse.ClearSelection();
            ddlSection.Items.Clear();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
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
                SaveTimetable(Mode);
            }

        }
    }
}