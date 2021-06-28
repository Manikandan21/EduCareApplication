using DataAccessComponent.Academic;
using EntityComponent.Academic;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Users
{
    public partial class Timetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindTimetable();
            }
        }
        public void BindTimetable()
        {
            try
            {
                BindTimetableConfig(Convert.ToInt64(Session["UserId"].ToString()), "GetDataConfigByUser");
                //BindData(course, section, "GetHomework");

                int TotalHours = Convert.ToInt32(hdnHours.Value);
                TimeTableEntity ObjTimeTableEntity = new TimeTableEntity();
                TimetableDA ObjTimetableDA = new TimetableDA();
                ObjTimeTableEntity = ObjTimetableDA.GetTimetableByUser(Convert.ToInt64(Session["UserId"].ToString()), "GetData");

                List<HoursPerSubjectByUser> lstHoursPerSubject = new List<HoursPerSubjectByUser>();
                hdnID.Value = Convert.ToString(ObjTimeTableEntity.ID);
                lstHoursPerSubject = ObjTimeTableEntity.SubjectListByUser;
                grdHomework.DataSource = lstHoursPerSubject;
                grdHomework.DataBind();
                if (ObjTimeTableEntity.SubjectListByUser != null)
                {
                    foreach (GridViewRow row in grdHomework.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {

                            int length = 0;

                            length = TotalHours;
                            for (int i = 0; i < 10; i++)
                            {

                                if (i + 1 > TotalHours)
                                {
                                    grdHomework.Columns[i + 2].Visible = false;
                                }
                                else
                                {
                                    grdHomework.Columns[i + 2].Visible = true;
                                }
                            }
                        }
                    }
                }

                pnlExamSchedule.Visible = true;

            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindTimetable", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        private void BindTimetableConfig(long StudentID, string Mode)
        {
            TimetableDA ObjTimetableDA = new TimetableDA();
            List<TimeTableConfigEntity> lstTimeTableConfigEntity = new List<TimeTableConfigEntity>();
            lstTimeTableConfigEntity = ObjTimetableDA.GetTimetableConfig(null, null, Mode, StudentID);
            if (lstTimeTableConfigEntity.Count > 0)
            {
                hdnHours.Value = lstTimeTableConfigEntity[0].TotalHours.ToString();
            }
            else
            {
                hdnHours.Value = "8";
            }
        }
    }
}