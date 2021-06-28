using DataAccessComponent.Communication;
using EntityComponent.Communication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Announcement
{
    public partial class Noticeboard : System.Web.UI.Page
    {
        bool status = false;
        string Message = string.Empty;
        string DisplayMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSubject.Focus();
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Save();
        }

        public void Save()
        {
            NoticeboardEntity ObjNoticeboardEntity = new NoticeboardEntity();
            AnnouncementDA ObjAnnouncementDA = new AnnouncementDA();
            ObjNoticeboardEntity.Subject = hdnSubject.Value.Trim();
            ObjNoticeboardEntity.Content = hdnContent.Value.Trim();
            ObjNoticeboardEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
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
                    ObjNoticeboardEntity.Id = Convert.ToInt32(hdnId.Value);
                }
                ObjAnnouncementDA.SetNoticeboardDetails(ObjNoticeboardEntity, Mode, out Message, out status);

                if (Mode == "Insert")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data saved successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                           
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data already Exist", 4);
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
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data updated successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            ClearControls();
                            hdnMode.Value = string.Empty;
                            hdnId.Value = string.Empty;
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data already Exist", 4);
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
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                       
                    }
                }
            }
            catch (Exception ex)
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

            }
            ClearControls();
                           
        }

        public void ClearControls()
        {
            txtSubject.Text = string.Empty;
            hdnMode.Value = string.Empty;
            hdnId.Value = string.Empty;
            hdnContent.Value = string.Empty; ;
            hdnSubject.Value = string.Empty;
        }

    }
}