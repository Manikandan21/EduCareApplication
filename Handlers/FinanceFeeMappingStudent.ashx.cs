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
    /// Summary description for FinanceFeeMappingStudent
    /// </summary>
    public class FinanceFeeMappingStudent : IHttpHandler
    {

        string strMode = string.Empty;
        string strUserName = string.Empty;
        string strResponse = string.Empty;
        int RoleId;
        int StudentId;
        string strCourseName = string.Empty;
        string strSectionName = string.Empty;

        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strMode = Convert.ToString(context.Request.QueryString["Mode"]);
            strUserName = Convert.ToString(context.Request.QueryString["UserName"]);
            RoleId = Convert.ToString(context.Request.QueryString["RoleId"]) != "" ? Convert.ToInt32(context.Request.QueryString["RoleId"]) : 0;
            StudentId = Convert.ToString(context.Request.QueryString["StudentId"]) != "" ? Convert.ToInt32(context.Request.QueryString["StudentId"]) : 0;
            strCourseName = Convert.ToString(context.Request.QueryString["Course"]);
            strSectionName = Convert.ToString(context.Request.QueryString["Section"]);
            ObjFinanceDa = new FinanceDA();
            List<Finance_MappedFeeDetailsEntity> lstMappedFeeDetails = new List<Finance_MappedFeeDetailsEntity>();
            lstMappedFeeDetails = ObjFinanceDa.GetFeeDetails(strMode, RoleId, strCourseName, strSectionName, StudentId, strUserName);
            var Json = JsonConvert.SerializeObject(lstMappedFeeDetails);
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