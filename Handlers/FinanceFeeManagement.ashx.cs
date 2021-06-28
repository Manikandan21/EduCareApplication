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
    /// Summary description for FinanceFeeManagement
    /// </summary>
    public class FinanceFeeManagement : IHttpHandler
    {
        string strMode = string.Empty;
        string strTermData = string.Empty;
        string strCategory = string.Empty;
        string strCourseDate = string.Empty;
        string strFeeDesc = string.Empty;
        string strFeeAmt = string.Empty;
        string strDeleteFeeIds = string.Empty;
        string strResponse = string.Empty;

        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strTermData = Convert.ToString(context.Request.QueryString["TermData"]);
            strCategory = Convert.ToString(context.Request.QueryString["Category"]);
            strCourseDate = Convert.ToString(context.Request.QueryString["CourseData"]);
            strFeeDesc = Convert.ToString(context.Request.QueryString["FeeDesc"]);
            strFeeAmt = Convert.ToString(context.Request.QueryString["FeeAmt"]);
            strDeleteFeeIds = Convert.ToString(context.Request.QueryString["DeleteFeeId"]);
            ObjFinanceDa = new FinanceDA();
            List<FinanceEntity> outFinList = new List<FinanceEntity>();
            int ReturnValue;
            ObjFinanceDa.GetSetFeeStructure(strMode, strTermData, strCategory, strCourseDate, strFeeDesc, strFeeAmt, strDeleteFeeIds, out ReturnValue, out outFinList);

            if (strMode == "INSERT")
                context.Response.Write(Convert.ToString(ReturnValue));
            else
            {
                var Json = JsonConvert.SerializeObject(outFinList);
                strResponse = Json;
                context.Response.Write(strResponse);
            }


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