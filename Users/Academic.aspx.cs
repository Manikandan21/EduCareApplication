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

namespace ILogisticsApplication.User
{
    public partial class Academic : System.Web.UI.Page
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
            BindAcademicDetails("", "", Convert.ToInt32(ddlExam.SelectedItem.Value), Convert.ToInt64(Convert.ToString(Session["UserId"])), "GetDataForUser");
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
                    lstAcademicViewCommonEntity = ObjAcademicCommonDA.GetViewAcademicGridUser(StudentID, "GetAcadmic");
                    long OutOfMarks = 0;
                    for (int i = 0; i < lstAcademicViewCommonEntity.Count; i++)
                    {
                        for (int j = 0; j < ObjAcademicDetailsEntity.MarkSet.Count; j++)
                        {
                            if (lstAcademicViewCommonEntity[i].Id == ObjAcademicDetailsEntity.MarkSet[j].SubjectId)
                            {
                                lstAcademicViewCommonEntity[i].Marks = ObjAcademicDetailsEntity.MarkSet[j].Marks;
                                OutOfMarks += Convert.ToInt64(lstAcademicViewCommonEntity[i].AddParam);
                            }
                        }
                    }

                    grdAcademic.DataSource = lstAcademicViewCommonEntity;
                    grdAcademic.DataBind();
                    lblTotal.Text = "Total Marks: " + Convert.ToString(ObjAcademicDetailsEntity.TotalMarks) + " Out Of " + OutOfMarks;
                    divTotal.Visible = true;
                    grdAcademic.Visible = true;
                    pnlAcademic.Visible = true;
                    panelDisplayView.Visible = false;
                }
                else
                {
                    divTotal.Visible = false;
                    panelDisplayView.Visible = true;
                    pnlAcademic.Visible = false;
                }


            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindAcademicDetails", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", ThemeComponent.DisplayTheme.DisplayMessage("Error Occurred. Please try again", 2), false);
            }
        }
    }
}