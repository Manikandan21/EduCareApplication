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
    /// Summary description for FinanceGetStudent
    /// </summary>
    public class FinanceGetStudent : IHttpHandler
    {
        string strCourse = string.Empty;
        string strSection = string.Empty;
        string strResponse = string.Empty;

        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strCourse = Convert.ToString(context.Request.QueryString["Course"]);
            strSection = Convert.ToString(context.Request.QueryString["Section"]);
            ObjFinanceDa = new FinanceDA();
            List<Finance_StudentEntity> lstSudent = new List<Finance_StudentEntity>();
            lstSudent = ObjFinanceDa.GetStudentList(strCourse, strSection);
            var Json = JsonConvert.SerializeObject(lstSudent);
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