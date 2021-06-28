using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.Finance;
using EntityComponent.MasterData;
using EntityComponent.Finance;
using Newtonsoft.Json;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for FinancePaymentCollection
    /// </summary>
    public class FinancePaymentCollection : IHttpHandler
    {
        string strMode = string.Empty;
        string strPayMode = string.Empty;
        string strChqDDTxnChllnNumber = string.Empty;
        string strPaymentDate = string.Empty;
        string strResponse = string.Empty;
        int StudentID;
        int UserID;
        decimal inputAmount; 
        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strPayMode = Convert.ToString(context.Request.QueryString["PayMode"]);
            strChqDDTxnChllnNumber = Convert.ToString(context.Request.QueryString["ChqDDTxnChllnNumber"]);
            strPaymentDate = Convert.ToString(context.Request.QueryString["PaymentDate"]);
            UserID = Convert.ToInt32(context.Request.QueryString["UserId"]);
            StudentID = Convert.ToInt32(context.Request.QueryString["StudentID"]);
            inputAmount = Convert.ToDecimal(context.Request.QueryString["InputAmt"]);
            ObjFinanceDa = new FinanceDA();
            List<Finance_PaymentDetailsEntity> lstPaymentdetails = new List<Finance_PaymentDetailsEntity>();
            lstPaymentdetails = ObjFinanceDa.Get_Set_PaymentDetails(strMode, strPayMode, inputAmount, strChqDDTxnChllnNumber, strPaymentDate, UserID, StudentID);
            var Json = JsonConvert.SerializeObject(lstPaymentdetails);
            strResponse = Json;
            context.Response.Write(strResponse);
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