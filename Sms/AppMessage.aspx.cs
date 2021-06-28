using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using ExceptionComponent;
using MailMessageUtility;
namespace ILogisticsApplication.Sms
{
    public partial class AppMessage : System.Web.UI.Page
    {
        List<AppMessageListEntity> lstAppMessage = null;
        BirthdayDA birthdayDA = null;
        public AppMessage()
        {
            lstAppMessage= new List<AppMessageListEntity>();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmit.Visible = false;
        }
        private void InitialLoad()
        {
            grdList.DataSource = null;
            grdList.DataBind();
            btnSubmit.Disabled = true;
            btnSubmit.Visible = false;
        }
        public void BindAppMessageInfo(int Type)
        {
            try
            {
                birthdayDA = new BirthdayDA();
                if (GetStatus(Type) == 0)
                {
                    lstAppMessage = birthdayDA.GetAppMessageList("GETLIST", Type == 2 ? "USP_GET_BIRTHDAY" : "USP_GET_ATTENDANCE_SMS_LIST");
                    if (lstAppMessage.Count > 0)
                    {
                        grdList.DataSource = lstAppMessage;
                        grdList.DataBind();
                        btnSubmit.Disabled = false;
                        btnSubmit.Visible = true;
                    }
                    else
                    {
                        grdList.DataSource = null;
                        grdList.EmptyDataText = "No Records found";
                        grdList.DataBind();
                        btnSubmit.Disabled = true;
                        btnSubmit.Visible = false;                        
                    }                   
                }
                else
                {
                    grdList.DataSource = null;
                    grdList.EmptyDataText = "<code>Message already sent<code>";
                    grdList.DataBind();
                    btnSubmit.Disabled = true;
                    btnSubmit.Visible = false;
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindAppMessageInfo", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }
        private int GetStatus(int Type)
        {
            int result = 0;
            try
            {
                result= birthdayDA.GetAppMessageStatus(Type);                
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "GetStatus", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
            return result;
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ddlType.SelectedItem.Value) > 0)
            {
                pnlGrid.Visible = true;
                BindAppMessageInfo(Convert.ToInt32(ddlType.SelectedItem.Value));
            }
            else
            {
                pnlGrid.Visible = false;
                InitialLoad();
                grdList.EmptyDataText = "No Records";
            }
        }
        protected void btnSubmit_ServerClick(object sender, EventArgs e)
        {
            string DisplayMsg = string.Empty;
            if (Convert.ToInt32(ddlType.SelectedItem.Value) == 1)
            {
                if (GetAppMessageAttendanceStatus() > 0)
                {
                    btnSubmit.Disabled = false;
                    btnSubmit.Visible = true;
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Please make sure, you have marked the attendance for all students", 2);
                    ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);                    
                    return;
                }
            }
            if (SendAppMessage())
            {
                DisplayMsg =ThemeComponent.DisplayTheme.DisplayMessage("Message sent successfully", 1);
            }
            else
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message could not be send, Please try again", 2);
            }
            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
            BindAppMessageInfo(Convert.ToInt32(ddlType.SelectedItem.Value));
        }
        private bool SendAppMessage()
        {
            try
            {
                birthdayDA = new BirthdayDA();
                lstAppMessage = birthdayDA.GetAppMessageList("GETLIST", Convert.ToInt32(ddlType.SelectedItem.Value) == 2 ? "USP_GET_BIRTHDAY" : "USP_GET_ATTENDANCE_SMS_LIST");
                MessageUtility ObjMessage = new MessageUtility();
                return ObjMessage.MultiSendMessage(lstAppMessage, Convert.ToInt32(ddlType.SelectedItem.Value), Convert.ToInt32(Session["UserId"].ToString()));
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SendAppMessage", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                return false;
            }          
        }
        private int GetAppMessageAttendanceStatus()
        {
            try
            {
                birthdayDA = new BirthdayDA();
                int count = birthdayDA.GetAppMessageAttendanceStatus();
                return count;
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SendAppMessage", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                return 1;
            }
        }
    }
}