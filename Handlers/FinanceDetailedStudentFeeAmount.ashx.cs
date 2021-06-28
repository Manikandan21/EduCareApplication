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
    /// Summary description for FinanceDetailedStudentFeeAmount
    /// </summary>
    public class FinanceDetailedStudentFeeAmount : IHttpHandler
    {
        string strUserName = string.Empty;
        string strResponse = string.Empty;
        int RoleId;
        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strUserName = Convert.ToString(context.Request.QueryString["UserName"]);
            RoleId = Convert.ToString(context.Request.QueryString["RoleId"]) != "" ? Convert.ToInt32(context.Request.QueryString["RoleId"]) : 0;
            ObjFinanceDa = new FinanceDA();
            List<Finance_PaymentDetailsEntity> lstDetailedFeeAmount = new List<Finance_PaymentDetailsEntity>();
            lstDetailedFeeAmount = ObjFinanceDa.GetDetailedFeeAmount(strUserName, RoleId);
            var Json = JsonConvert.SerializeObject(lstDetailedFeeAmount);
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