using DataAccessComponent;
using DataAccessComponent.Academic;
using EntityComponent.MasterData;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Users
{
    public partial class ExamSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData("GetExam");
            }
        }
        private void BindData(string Mode)
        {
            try
            {
                long StudentID = Convert.ToInt64(Convert.ToString(Session["UserId"]));
                if (Mode == "GetExam")
                {
                    List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                    CommonDA ObjCommonDA = new CommonDA();
                    lstCommonEntity = ObjCommonDA.GetAcademicInfoForDDLUsers(StudentID, Mode);
                    ddlExam.DataSource = lstCommonEntity;
                    ddlExam.DataTextField = "Name";
                    ddlExam.DataValueField = "Id";
                    ddlExam.DataBind();
                    ddlExam.Items.Insert(0, new ListItem("--Select Exam--", "0"));
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindData", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
        protected void btnGet_Click(object sender, EventArgs e)
        {
            try
            {
                long StudentID = Convert.ToInt64(Convert.ToString(Session["UserId"]));
                int ExamID = Convert.ToInt32(ddlExam.SelectedItem.Value.ToString());

                List<EntityComponent.Academic.ExamEntity> lstExamEntity = new List<EntityComponent.Academic.ExamEntity>();
                ExamScheduleDA ObjExamScheduleDA = new ExamScheduleDA();
                lstExamEntity = ObjExamScheduleDA.GetExamScheduleByUser(ExamID, StudentID);
                grdExamSchedule.DataSource = lstExamEntity;
                grdExamSchedule.DataBind();
                pnlExamSchedule.Visible = true;
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "btnGet_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
    }
}