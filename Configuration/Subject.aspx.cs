using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityComponent.MasterData;
using DataAccessComponent.MasterData;
namespace ILogisticsApplication.Configuration
{
    public partial class Subject : System.Web.UI.Page
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
            string Mode = string.Empty;
            SubjectEntity ObjSubject = new SubjectEntity();
            if (hdnMode.Value != "Delete")
            {
                ObjSubject.Subject = txtSubject.Value.Trim();
                ObjSubject.Type = Convert.ToInt16(ddlType.Value);
                ObjSubject.ShortCode = txtShortCode.Value.Trim();
                if (ObjSubject.Type == 2)
                {
                    ObjSubject.Primary_Subject = Convert.ToInt32(hdnPrimaryValue.Value);
                }
                else
                {
                    ObjSubject.Primary_Subject = 0;
                }
                ObjSubject.MaxMarks = Convert.ToInt32(txtMaxMarks.Value.Trim());
                ObjSubject.MinMarks = Convert.ToInt32(txtMinMarks.Value.Trim());
            }
            if (hdnMode.Value == "")
            {
                ObjSubject.Id = 0;
                Mode = "Insert";
            }
            else
            {
                Mode = hdnMode.Value;
                ObjSubject.Id = Convert.ToInt32(hdnId.Value);
            }
            ObjSubject.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());


            try
            {

                SubjectDA ObjSubjectDA = new SubjectDA();
                ObjSubjectDA.SetSubjectDetails(ObjSubject, Mode, out Message, out status);

                if (Mode == "Insert")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject saved successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            ClearControls();
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject already Exist", 4);
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
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject updated successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            ClearControls();
                        }
                        ClearControls();
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject already Exist", 4);
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
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        ClearControls();
                    }
                    else if (Message.Contains("Mapped"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Subject Mapped with another entity so can not delete", 4);
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
            hdnPrimaryValue.Value = string.Empty;
        }

        public void ClearControls()
        {
            txtSubject.Value = string.Empty;
            txtMaxMarks.Value = string.Empty;
            txtMinMarks.Value = string.Empty;
            ddlType.SelectedIndex = 0;
            txtShortCode.Value = string.Empty;
            ddlPrimarySubject.SelectedIndex = 0;
        }

        public void BindPrimarySubjects()
        {

        }
    }
}