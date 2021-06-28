using System;
using DataAccessComponent.Sms;
using EntityComponent.Sms;
using MailMessageUtility;
using System.Web.UI;
namespace ILogisticsApplication.Sms
{
    public partial class UserMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OnSend_Click(object sender, EventArgs e)
        {
            SMSSendEntity ObjSMSEntity = new SMSSendEntity();
            ObjSMSEntity.Role = ddlReceiverRole.SelectedIndex;
            if (ObjSMSEntity.Role == 2)
            {
                ObjSMSEntity.EmployeeType = ddlAllEmployee.SelectedItem.Text.ToString();
            }
            else if (ObjSMSEntity.Role == 3)
            {
                ObjSMSEntity.Std = hdnCourse.Value.ToString();
                ObjSMSEntity.Section = hdnSection.Value.ToString();
                ObjSMSEntity.StudentIDs = hdnStudentIDs.Value.ToString();
            }
            ObjSMSEntity.UserID = Convert.ToInt32(Session["UserId"].ToString());
            ObjSMSEntity.Message = txtMessage.Text.ToString();
            ObjSMSEntity.Mode = hdnApprovalConfig.Value == "3" ? "Save" : "Send";
            MessageUtility ObjMessageUtility = new MessageUtility();

            bool result = ObjMessageUtility.TriggerSMS(ObjSMSEntity);
            string DisplayMsg = string.Empty;
            if (result)
            {
                if (hdnApprovalConfig.Value == "3")
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message sent for Approval", 1);
                }
                else
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message sent successfully", 1);
                }

            }
            else
            {
                if (hdnApprovalConfig.Value == "3")
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message could not be sent for Approval, Please contact the administrator", 2);
                }
                else
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message could not be sent, Please contact the administrator", 2);
                }
               
            }
            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            ddlReceiverRole.SelectedIndex = 0;
            txtMessage.Text = "";
        }

    }
}