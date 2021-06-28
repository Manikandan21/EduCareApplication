using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityComponent.MasterData;
using DataAccessComponent;
using Newtonsoft.Json;
using System.Data;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for masters
    /// </summary>
    public class masters : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        string Mode = string.Empty;
        string GetDataMode = string.Empty;
        int MenuId;

        string ResultString = string.Empty;

        public void ProcessRequest(HttpContext context)
        {

            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            GetDataMode = Convert.ToString(context.Request.QueryString["GetDataMode"]);
            MenuId = Convert.ToInt32(context.Request.QueryString["Id"]);
            if (Mode == "MenuDetails")
            {
                List<MenuListDetails> lstMenuListDetails = new List<MenuListDetails>();
                MasterDataAccessComponent ObjMasterDataAccessComponent = new MasterDataAccessComponent();
                if (context.Session["MenuDetails"] == null)
                {
                    lstMenuListDetails = ObjMasterDataAccessComponent.GetMenuList(GetDataMode, MenuId,Convert.ToInt32(Convert.ToString(context.Session["RoleId"]))).ToList();
                    lstMenuListDetails = GetTreeView(lstMenuListDetails, 0);
                    context.Session["MenuDetails"] = lstMenuListDetails;
                }
                else
                {
                    lstMenuListDetails = (List<MenuListDetails>)(context.Session["MenuDetails"]);
                }

                var Json = JsonConvert.SerializeObject(lstMenuListDetails);
                ResultString = Json;
            }

           
            context.Response.Write(ResultString);
        }


        public List<MenuListDetails> GetTreeView(List<MenuListDetails> lstMenuListDetails, int parent)
        {
            List<MenuListDetails> lst = new List<MenuListDetails>();
            return lstMenuListDetails.Where(x => x.ParentMenu == parent).Select(x => new MenuListDetails
            {
                MenuId = x.MenuId,
                MenuName = x.MenuName,
                Url = x.Url,
                ClassName = x.ClassName,
                ListMenu = GetTreeView(lstMenuListDetails, x.MenuId)
            }).ToList();
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