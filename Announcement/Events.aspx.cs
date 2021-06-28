using DataAccessComponent.Communication;
using EntityComponent.Communication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThemeComponent;
namespace ILogisticsApplication.Announcement
{
    public partial class Events : System.Web.UI.Page
    {
        bool status = false;
        string Message = string.Empty;
        string DisplayMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Convert.ToString(Session["IsAdminRole"].ToString()) == "True")
            //{
            //    btnSubmit.Visible = true;
            //    btnClearData.Visible = true;
            //}
            //else
            //{
            //    btnSubmit.Visible = false;
            //    btnClearData.Visible = false;
            //}
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            Save();
        }
        public void Save()
        {
            EventsEntity ObjEventsEntity = new EventsEntity();
            AnnouncementDA ObjAnnouncementDA = new AnnouncementDA();
            ObjEventsEntity.Title = hdnTitle.Value.Trim();
            ObjEventsEntity.EventType = hdnType.Value.Trim();
            ObjEventsEntity.Content = hdnContent.Value.Trim();
            ObjEventsEntity.StartDate = DateTime.ParseExact(hdnStartDate.Value + " " + hdnStartTime.Value, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.CurrentUICulture.DateTimeFormat);
            ObjEventsEntity.EndDate = DateTime.ParseExact(hdnEndDate.Value + " " + hdnEndTime.Value, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.CurrentUICulture.DateTimeFormat);
            //ObjEventsEntity.EndDate = ObjEventsEntity.EndDate.AddDays(-1);
            ObjEventsEntity.OrganizerType =Convert.ToInt16(hdnOrganizerType.Value.Trim());
            ObjEventsEntity.Organizer = hdnOrganizerName.Value.Trim();
            ObjEventsEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
            string Mode = string.Empty;
           
            try
            {
                if (hdnMode.Value == "")
                {
                    Mode = "Insert";
                }
                else
                {
                    Mode = hdnMode.Value;
                    ObjEventsEntity.Id = Convert.ToInt32(hdnId.Value);
                }
                ObjAnnouncementDA.SetEventsDetails(ObjEventsEntity, Mode, out Message, out status);                

                if (Mode == "Insert")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Event saved successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                            hdnMode.Value = string.Empty;
                            hdnId.Value = string.Empty;
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Event already Exist", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
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
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Event updated successfully", 1);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Event already Exist", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                }
                else if (Mode == "Delete")
                {
                    if (Message.Contains("Success"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Event deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                }
            }
            catch (Exception ex)
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            }

        }
    }
}