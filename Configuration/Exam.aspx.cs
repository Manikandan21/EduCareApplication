using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityComponent.MasterData;
using DataAccessComponent.MasterData;
using ThemeComponent;
namespace ILogisticsApplication.Configuration
{
    public partial class Exam : System.Web.UI.Page
    {
        bool status = false;
        string Message = string.Empty;
        string DisplayMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
           protected void Save_Click(object sender, EventArgs e)
        {
            Save();
        }

        public void Save()
        {
            string Exam = txtExam.Value.Trim();
            int ExamType =Convert.ToInt16(ddlExamType.SelectedItem.Value);
            int UserId = Convert.ToInt32(Session["UserId"].ToString());
            string Mode = string.Empty;
            int Id = 0;
            try
            {
                if (hdnMode.Value == "")
                {
                    Mode = "Insert";
                }
                else
                {
                    Mode = hdnMode.Value;
                    Id = Convert.ToInt32(hdnId.Value);
                }
                ExamDA ObjExamDA = new ExamDA();
                ObjExamDA.SetExamDetails(Exam, ExamType, Id, Mode, UserId, out Message, out status);
                

                if (Mode == "Insert")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam saved successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            ClearControls();
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam already Exist", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                }
                else if (Mode == "Update")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam updated successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            ClearControls();
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam already Exist", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                }
                else if (Mode == "Delete")
                {
                    if (Message.Contains("Success"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        ClearControls();
                    }
                    else if (Message.Contains("Mapped"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Exam Mapped with another entity so can not delete", 4);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                }
            }
            catch (Exception ex)
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

            }
            hdnMode.Value = string.Empty;
            hdnId.Value = string.Empty;
        }

        public void ClearControls()
        {
            txtExam.Value = string.Empty;
            ddlExamType.SelectedIndex =0;
        }
    }
}