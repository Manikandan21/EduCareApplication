using DataAccessComponent.Sms;
using MailMessageUtility;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using EntityComponent.Sms;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for SmsApproval
    /// </summary>
    public class SmsApproval : IHttpHandler, IReadOnlySessionState
    {
        string Mode = string.Empty;
        string ResultString = string.Empty;
        SmsDA ObjSmsDA = null;
        public SmsApproval()
        {
            ObjSmsDA = new SmsDA();
        }
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            if (Mode == "ApprovalList" || Mode == "ByID")
            {
                int APPID = Convert.ToInt32(context.Request.QueryString["AppID"]);
                List<SMSApprovalEntity> lstSMSApprovalEntity = ObjSmsDA.GetSMSApprovalList(Convert.ToInt64(context.Session["UserId"].ToString()),Mode, APPID);
                var Json = JsonConvert.SerializeObject(lstSMSApprovalEntity);
                ResultString = Json;
            }
            else if (Mode == "SetApproved")
            {
                long UserID = Convert.ToInt64(context.Session["UserId"].ToString());
                long ID = Convert.ToInt64(context.Request.QueryString["ID"]);
                string UserMessage = "", Numbers = "", StatusMessage = "";
                var Json = "";
                bool result = ObjSmsDA.SetApprovalMessage(UserID, ID, ref UserMessage, ref Numbers, ref StatusMessage);
                if (result)
                {
                    MessageUtility ObjMessageUtility = new MessageUtility();
                    bool MessageSendStatus = ObjMessageUtility.SendMessage("Web", UserMessage, Numbers, Convert.ToInt32(UserID));
                    if (MessageSendStatus)
                    {
                        Json = JsonConvert.SerializeObject("Message sent successfully");
                    }
                    else
                    {
                        Json = JsonConvert.SerializeObject("Message could not be sent, Please contact the Administrator");
                    }
                }
                else
                {
                    Json = JsonConvert.SerializeObject(StatusMessage);                    
                }
                ResultString = Json;
            }

            context.Response.Write(ResultString);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}