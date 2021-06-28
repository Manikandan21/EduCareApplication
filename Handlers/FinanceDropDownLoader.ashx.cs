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
    /// Summary description for FinanceDropDownLoader
    /// </summary>
    public class FinanceDropDownLoader : IHttpHandler
    {

        string strType = string.Empty;
        string strValue = string.Empty;
        string ResultString = string.Empty;

        FinanceDA ObjFinanceDa = null;
        public void ProcessRequest(HttpContext context)
        {
            strType = Convert.ToString(context.Request.QueryString["Type"]);
            strValue = Convert.ToString(context.Request.QueryString["Value"]);

            List<DropDownListEntity> lstDropDownList = new List<DropDownListEntity>();
            if (!string.IsNullOrEmpty(strType))
            {
                ObjFinanceDa = new FinanceDA();
                lstDropDownList = ObjFinanceDa.BindDropdownList_Finance(strType, strValue);
                var Json = JsonConvert.SerializeObject(lstDropDownList);
                ResultString = Json;
                context.Response.Write(ResultString);
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
