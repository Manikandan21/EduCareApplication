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
    /// Summary description for FinancePaymentHistory
    /// </summary>
    public class FinancePaymentHistory : IHttpHandler
    {
        string strMode = string.Empty;
        string strUserName = string.Empty;
        string strResponse = string.Empty;
        int RoleId;
        int StudentId;
        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strUserName = Convert.ToString(context.Request.QueryString["UserName"]);
            RoleId = Convert.ToString(context.Request.QueryString["RoleId"]) != "" ? Convert.ToInt32(context.Request.QueryString["RoleId"]) : 0;
            StudentId = Convert.ToString(context.Request.QueryString["StudentId"]) != "" ? Convert.ToInt32(context.Request.QueryString["StudentId"]) : 0;
            ObjFinanceDa = new FinanceDA();
            List<Finance_PaymentHistoryEntity> lstPaymentHistory = new List<Finance_PaymentHistoryEntity>();
            lstPaymentHistory = ObjFinanceDa.GetPaymentHistory(strMode, RoleId, StudentId, strUserName);
            var Json = JsonConvert.SerializeObject(lstPaymentHistory);
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