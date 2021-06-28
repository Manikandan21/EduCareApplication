using DataAccessComponent.Communication;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.InternalMail
{
    public partial class Inbox : System.Web.UI.Page
    {
        bool Status = false;
        string Message = string.Empty;
        string DisplayMsg = string.Empty;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //if (Session["RoleID"] != null)
            //{
            //    int RoleID = Convert.ToInt32(Session["RoleId"].ToString());
            //    if (RoleID == 6 || RoleID == 7)
            //    {
            //        this.MasterPageFile = "~/MasterPage/User.Master";
            //    }
            //    else
            //    {
            //        this.MasterPageFile = "~/MasterPage/AdminMaster.Master";
            //    }
            //}

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Save_Click(object sender, EventArgs e)
        {
            SaveMail("SendMail");
        }
        public void SaveMail(string Mode)
        {

            EntityComponent.Communication.InternalMailEntity OBjInternalMail = new EntityComponent.Communication.InternalMailEntity();
            InternalMailDA ObjInternalMailDA = new InternalMailDA();
            try
            {
                OBjInternalMail.ReceiverRole = Convert.ToInt32(HdnReceiverRole.Value.ToString());
                OBjInternalMail.ReceiverId = Convert.ToInt64(HdnReceiverId.Value);
                OBjInternalMail.SenderId = Convert.ToInt64(Session["UserId"].ToString());
                OBjInternalMail.SenderRole = Convert.ToInt32(Session["RoleId"].ToString());
                OBjInternalMail.Subject = hdnSubject.Value.Trim();
                OBjInternalMail.MessageBody = hdnMessageBody.Value.Trim();
                OBjInternalMail.Mode = Mode;

                ObjInternalMailDA.SetInternalMail(OBjInternalMail, out Message, out Status);
                if (Status == true)
                {
                    if (Mode == "SendMail")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message sent successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    if (Mode == "SendDraft")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Message drafted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }


                }
                else if (Status == false)
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error occurred. Please contact Administrator", 2);
                    this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "SaveMail", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error found. Please contact Administrator", 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            }
            ClearControl();
        }
        public void ClearControl()
        {
            txtSubject.Value = "";
        }
    }
}