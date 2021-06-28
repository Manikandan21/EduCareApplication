using DataAccessComponent.Communication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for CommunicationOperation
    /// </summary>
    public class CommunicationOperation : IHttpHandler
    {
        string Mode = string.Empty;
        string Ids = "";
        string ResultString = string.Empty;
        string Message = string.Empty;
        bool Status = false;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Ids = Convert.ToString(context.Request.QueryString["Ids"]);
            if (Mode == "Trash")
            {
                InternalMailDA ObjInternalMailDA = new InternalMailDA();
                ObjInternalMailDA.SetInternalMailOperation(Ids, Mode,out Status,out Message);
                if (Status == true)
                {
                    ResultString = Message;
                }
                else 
                {
                    ResultString = "Error";
                }
            }
            else if (Mode == "Restore")
            {
                InternalMailDA ObjInternalMailDA = new InternalMailDA();
                ObjInternalMailDA.SetInternalMailOperation(Ids, Mode, out Status, out Message);
                if (Status == true)
                {
                    ResultString = Message;
                }
                else
                {
                    ResultString = "Error";
                }
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