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
    /// Summary description for FinanceStudentFeeMappingSave
    /// </summary>
    public class FinanceStudentFeeMappingSave : IHttpHandler
    {
        string strMode = string.Empty;
        string strFeeIds = string.Empty;
        string strResponse = string.Empty;
        int studentID;
        int UserId;
        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strFeeIds = Convert.ToString(context.Request.QueryString["FeeIds"]);
            UserId = Convert.ToString(context.Request.QueryString["UserId"]) != "" ? Convert.ToInt32(context.Request.QueryString["UserId"]) : 0;
            studentID = Convert.ToString(context.Request.QueryString["studentID"]) != "" ? Convert.ToInt32(context.Request.QueryString["studentID"]) : 0;
            ObjFinanceDa = new FinanceDA();
            int ReturnResult ;
            ObjFinanceDa.Set_FeeMappingForStudent(strMode, studentID, strFeeIds, UserId, out ReturnResult);
            context.Response.Write(Convert.ToString(ReturnResult));
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