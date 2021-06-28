using DataAccessComponent;
using DataAccessComponent.Attendance;
using EntityComponent.MasterData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Attendance
{
    public partial class ViewAttendance : System.Web.UI.Page
    {
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



        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Course = ddlCourse.SelectedItem.Text.Trim();
                if (Course != "0")
                {
                    BindSection(Course);

                }
                pnlAttendance.Visible = false;

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
                if (Section != "0")
                {
                    divAction.Visible = true;
                }
                pnlAttendance.Visible = false;
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void btnGetAttendance_Click(object sender, EventArgs e)
        {           
                BindDetails(ddlCourse.SelectedItem.Text.Trim(), ddlSection.SelectedItem.Text.Trim());  
        }
        public void BindDetails(string Course, string Section)
        {
            int MonthId = Convert.ToInt32(ddlMonth.SelectedItem.Value);
            int userId = Convert.ToInt32(Session["UserId"].ToString());
            string IsAdmin = Convert.ToString(Session["RoleId"]);
            DataTable dt = new DataTable();
            StudentAttendanceDA ObjStudentAttendanceDA = new StudentAttendanceDA();
            dt = ObjStudentAttendanceDA.GetStudentAttendanceView(Course, Section, null, MonthId, userId);

            //if (dt.Rows.Count > 0)
            //{
            grdAttendance.DataSource = dt;
            grdAttendance.DataBind();
            //}
            pnlAttendance.Visible = true;
            ddlCourse.SelectedItem.Text = Course;
            ddlSection.SelectedItem.Text = Section;
        }

        protected void grdAttendance_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //int Month = Convert.ToInt32(ddlMonth.SelectedItem.Value);
            //int year = Convert.ToInt32(System.DateTime.Now.Year.ToString());
            //if (Month < 6)
            //{
            //    year = year + 1;
            //}

            int DaysInMonth = GetMonthInDays();
            int column = Convert.ToInt32(DaysInMonth);
            int Difference = e.Row.Cells.Count - column;

            if (e.Row.RowType == DataControlRowType.Header)
            {
                for (int i = 06; i < column + 6; i++)
                {
                    e.Row.Cells[i].Text = (i - 05).ToString("00");

                }
                if (e.Row.Cells.Count != column + 6)
                {
                    for (int x = column + 6; x < e.Row.Cells.Count; x++)
                    {
                        e.Row.Cells[x].Visible = false;
                        e.Row.Cells[x].Text = "";
                    }
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells.Count != column + 6)
                {
                    for (int x = column + 6; x < e.Row.Cells.Count; x++)
                    {
                        e.Row.Cells[x].Visible = false;
                        e.Row.Cells[x].Text = "";
                    }
                }
            }
        }

        protected void grdAttendance_DataBound(object sender, EventArgs e)
        {

            for (int i = 0; i < grdAttendance.Rows.Count; i++)
            {
                int k = 6;
                int column = GetMonthInDays();

                //   int column_width = Convert.ToInt32(grdDetails.Rows[0].Cells.Count.ToString());
                for (int j = 1; j <= column; j++)
                {
                    //grdDetails.Columns[j].HeaderText = "01";
                    if (grdAttendance.Rows[i].Cells[k].Text.Contains('1'))
                    {

                        grdAttendance.Rows[i].Cells[k].Text = " ";
                        //  grdDetails.Rows[i].Cells[k].BackColor = System.Drawing.Color.Green;
                        grdAttendance.Rows[i].Cells[k].CssClass = "PresentView";

                    }
                    else if (grdAttendance.Rows[i].Cells[k].Text.Contains('2'))
                    {

                        grdAttendance.Rows[i].Cells[k].Text = " ";
                        grdAttendance.Rows[i].Cells[k].CssClass = "AbsentView";
                    }
                    else if (grdAttendance.Rows[i].Cells[k].Text.Contains('3'))
                    {

                        grdAttendance.Rows[i].Cells[k].Text = " ";
                        grdAttendance.Rows[i].Cells[k].CssClass = "WeekEndView";
                    }
                    else if (grdAttendance.Rows[i].Cells[k].Text.Contains('4'))
                    {

                        grdAttendance.Rows[i].Cells[k].Text = " ";
                        grdAttendance.Rows[i].Cells[k].CssClass = "HolidayView";
                    }
                    else
                    {
                        grdAttendance.Rows[i].Cells[k].Text = " - ";
                        // grdDetails.Rows[i].Cells[k].CssClass = "Null";
                    }
                    //if (column_width>column)
                    //{
                    //    grdDetails.Rows[i].Cells[j].Visible = false;
                    //}
                    k = k + 1;

                }

            }
            //   int x = 4;
            //   int y = Convert.ToInt32(grdDetails.Rows[0].Cells.Count.ToString());

        }

        public int GetMonthInDays()
        {
            int Month = Convert.ToInt32(ddlMonth.SelectedItem.Value);
            int year = Convert.ToInt32(System.DateTime.Now.Year.ToString());
            if (Month < 6)
            {
                year = year + 1;
            }

            int DaysInMonth = System.DateTime.DaysInMonth(year, Month);
            return DaysInMonth;
        }

        //protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlMonth.SelectedItem.Value !="0")
        //    {
        //        BindCourse();
        //    }
        //}
    }
}