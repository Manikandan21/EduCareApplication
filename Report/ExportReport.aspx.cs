using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent.Report;
using EntityComponent.MasterData;
using EntityComponent.Report;
namespace EduCareApplication.Report
{
    public partial class ExportReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindColumnInfo();
        }
        public void BindColumnInfo()
        {
            try
            {
                ReportDA ObjReport = new ReportDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjReport.GetStuRegColumnInfo();
                CheckBoxBind.DataSource = lstCommonEntity;
                CheckBoxBind.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        private string GetCheckBoxListSelections()
        {
            return string.Join(", ", CheckBoxBind.Items.Cast<ListItem>().Where(li => li.Selected).Select(x => x.Text).ToArray());
            //if you want values instead of text then return string.Join(", ", cblCourses.Items.Cast<ListItem>().Where(li => li.Selected).Select(x => x.Value).ToArray());
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                ReportEntity Report = new ReportEntity();
                Report.Std = Convert.ToInt32(hdnCourse.Value) > 0 ? hdnCourse.Value : null;
                Report.Section = Convert.ToInt32(hdnSection.Value) > 0 ? hdnSection.Value : null;
                Report.BloodGroup= ddlBloodgroup.Items[ddlBloodgroup.SelectedIndex].Text.Trim();
                Report.Gender= ddlGender.Items[ddlGender.SelectedIndex].Text.Trim();
                Report.EnrollmentDate = txtEnrollDate.Text.Trim();
                Report.DateBound =Convert.ToInt16(ddlBound.SelectedItem.Value.Trim());

                Report.ColumnList = chkSelectALL.Checked ? "ALL" : GetCheckBoxListSelections();
                Report.ColumnName= ddlOrder.Items[ddlOrder.SelectedIndex].Text.Trim();
                Report.Direction = ddlDirection.Items[ddlDirection.SelectedIndex].Text.Trim();



            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}