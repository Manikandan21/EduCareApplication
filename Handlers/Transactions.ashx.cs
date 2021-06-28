using DataAccessComponent.Transactions;
using MailMessageUtility;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Transactions
    /// </summary>
    public class Transactions : IHttpHandler, IReadOnlySessionState
    {
        string Mode = string.Empty;
        string Password = string.Empty;
        string ResultString = string.Empty;
        TransactionDA ObjTransactionDA = null;
        public Transactions()
        {

            ObjTransactionDA = new TransactionDA();
        }
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            if (Mode == "Tnx" || Mode == "Otp")
            {
                Password = Convert.ToString(context.Request.QueryString["Password"]);              
                bool result = ObjTransactionDA.GetTxtPwdIsvalid(Password, Mode, Convert.ToInt64(context.Session["UserId"].ToString()));
                var Json = JsonConvert.SerializeObject(result);
                ResultString = Json;
            }
            else if (Mode == "GenerateOtp")
            {
                string Number="", OTP = "";
                int UserID = Convert.ToInt32(context.Session["UserId"].ToString());
                bool result = ObjTransactionDA.GenerateOTP(UserID, ref OTP,ref Number);
                if (result) {
                    string Message = "Test:You have initiated an authenticated message service. OTP is "+OTP+". DO NOT SHARE IT WITH ANYONE. If not done by you, Please contact system Administrator";
                    MessageUtility ObjMessageUtility = new MessageUtility();
                    bool isSend = ObjMessageUtility.SendMessage("Web", Message, Number, UserID);
                }
                var Json = JsonConvert.SerializeObject(result);

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