using DataAccessComponent.Attendance;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Users
{
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //  CalendarView.ShowNextPrevMonth = false;
        }

       
        //protected void CalendarView_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    try
        //    {
        //        int Month = Convert.ToInt32(ddlMonth.SelectedItem.Value.ToString());
        //        StudentAttendanceDA ObjStudentAttendanceDA = new StudentAttendanceDA();
        //        DataTable dt = new DataTable();
        //        dt = ObjStudentAttendanceDA.GetStudentAttendanceViewByUser(Convert.ToInt32(Session["UserId"].ToString()), "GetData", Month);
        //        if (dt.Rows.Count > 0)
        //        {
        //            string eventType = string.Empty;
        //            DataTable DtRows = GenerateRows(dt);
        //            DateTime eventDate;
        //            string EventType = string.Empty;
        //            string yr;
        //            int NoOfDays = System.DateTime.DaysInMonth(Convert.ToInt32(GetCurrentYear()), Month);
        //            if (DtRows.Rows.Count > 0)
        //            {
        //                for (int i = 0; i < NoOfDays; i++)
        //                {
        //                    int startDate = i + 1;
        //                    string start = startDate.ToString();

        //                    string month = Month.ToString();
        //                    int currentyear = Convert.ToInt32(System.DateTime.Now.Year);
        //                    yr = Convert.ToString(GetCurrentYear());
        //                    Thread.CurrentThread.CurrentCulture = new CultureInfo("en-GB");
        //                    string date = start + "/" + month + "/" + yr;
        //                    eventDate = DateTime.Parse(date);
        //                    EventType = DtRows.Rows[i][0].ToString();
        //                    if (e.Day.Date == eventDate)
        //                    {
        //                        if (EventType == "1")
        //                        {
        //                            //e.Cell.BackColor = System.Drawing.Color.Green;
        //                            e.Cell.CssClass = "PresentView";

        //                        }
        //                        else if (EventType == "2")
        //                        {
        //                            //  e.Cell.BackColor = System.Drawing.Color.Red;
        //                            e.Cell.CssClass = "AbsentView";
        //                        }
        //                        else if (EventType == "3")
        //                        {
        //                            //e.Cell.BackColor = System.Drawing.Color.Blue;
        //                            e.Cell.CssClass = "WeekEndView";
        //                        }
        //                        else if (EventType == "4")
        //                        {
        //                            //    e.Cell.BackColor = System.Drawing.Color.Yellow;
        //                            e.Cell.CssClass = "HolidayView";
        //                        }
        //                        else if (eventType == "")
        //                        {
        //                            e.Cell.CssClass = "UnmarkedView";
        //                        }
        //                        else
        //                        {
        //                            e.Cell.CssClass = "UnmarkedView";
        //                        }
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}
        //private DataTable GenerateRows(DataTable InputTable)
        //{
        //    DataTable Output = new DataTable();
        //    Output.Columns.Add(InputTable.Columns[0].ColumnName.ToString());
        //    foreach (DataRow row in InputTable.Rows)
        //    {
        //        string NewColumnName = row[0].ToString();
        //        Output.Columns.Add(NewColumnName);
        //    }
        //    for (int rcount = 0; rcount < InputTable.Columns.Count; rcount++)
        //    {
        //        DataRow newRow = Output.NewRow();
        //        newRow[1] = InputTable.Columns[rcount].ColumnName.ToString();
        //        for (int cCount = 0; cCount < InputTable.Rows.Count; cCount++)
        //        {
        //            string Colvalue = InputTable.Rows[cCount][rcount].ToString();
        //            newRow[cCount] = Colvalue;
        //        }
        //        Output.Rows.Add(newRow);
        //    }
        //    return Output;
        //}
     
        //private void BindCalendar()
        //{
        //    try
        //    {
        //        int month = Convert.ToInt32(ddlMonth.SelectedItem.Value.ToString());
        //        if (!string.IsNullOrEmpty(hdnAcademicYr.Value))
        //        {
        //            string AcademicYr = hdnAcademicYr.Value.ToString();
        //            string[] years = AcademicYr.Split('-');

        //            if ((month == 6) || (month == 7) || (month == 8) || (month == 9) || (month == 10) || (month == 11) || (month == 12))
        //            {
        //                int StartYear = GetStartEndYear(1);
        //                CalendarView.VisibleDate = new DateTime(StartYear, month, 1);
        //            }
        //            else if ((month == 1) || (month == 2) || (month == 3) || (month == 4))
        //            {
        //                int EndYear = GetStartEndYear(1);
        //                CalendarView.VisibleDate = new DateTime(EndYear, month, 1);
        //            }
        //        }
            
        //    }
        //    catch (Exception Ex)
        //    {
                
        //        throw;
        //    }
            
        //}

        //private int GetStartEndYear(int type)
        //{
        //    string AcademicYr = hdnAcademicYr.Value.ToString();
        //    string[] years = AcademicYr.Split('-');
        //    int returnYear = 0;
        //    if (type == 1)
        //    {
        //        returnYear = Convert.ToInt32(years[0].ToString());
        //    }
        //    else
        //    {
        //        returnYear = Convert.ToInt32(years[2].ToString());
        //    }
        //    return returnYear;
        //}
        //private int GetCurrentYear()
        //{
        //    string AcademicYr = hdnAcademicYr.Value.ToString();
        //    string[] years = AcademicYr.Split('-');
        //    int month = Convert.ToInt32(ddlMonth.SelectedItem.Value.ToString());
        //    int currentYr = 0;
        //    if ((month == 6) || (month == 7) || (month == 8) || (month == 9) || (month == 10) || (month == 11) || (month == 12))
        //    {
        //        currentYr = GetStartEndYear(1);
        //    }
        //    else if ((month == 1) || (month == 2) || (month == 3) || (month == 4))
        //    {
        //        currentYr = GetStartEndYear(2);
        //    }
        //    return currentYr;
        //}
    }
}