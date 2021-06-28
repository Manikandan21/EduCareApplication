using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityComponent.Communication;
using Newtonsoft.Json;
using DataAccessComponent.Communication;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Communication
    /// </summary>
    public class Communication : IHttpHandler
    {
        string Mode = string.Empty;
        string Type = string.Empty;
        long UserId = 0;
        int RoleId = 0;
        long MsgId=0;
        string ResultString = string.Empty;
       

        public void ProcessRequest(HttpContext context)
        {
            Mode=Convert.ToString(context.Request.QueryString["Mode"]);
            Type = Convert.ToString(context.Request.QueryString["Type"]);
            UserId = Convert.ToInt64(context.Request.QueryString["Id"]);
            RoleId = Convert.ToInt32(context.Request.QueryString["Role"]);
            InternalMailDA ObjInternalMailDA = null;
            if (Mode == "InboxByUser")
            {
                List<InternalMailEntity> lstInternalMailEntity = new List<InternalMailEntity>(); 
                ObjInternalMailDA = new InternalMailDA();
                lstInternalMailEntity = ObjInternalMailDA.GetInternalMail(UserId, RoleId, Mode,Type);
                var Json = JsonConvert.SerializeObject(lstInternalMailEntity);
                ResultString = Json;
            }
            if (Mode == "SentByUser")
            {
                List<InternalMailEntity> lstInternalMailEntity = new List<InternalMailEntity>();
                ObjInternalMailDA = new InternalMailDA();
                lstInternalMailEntity = ObjInternalMailDA.GetInternalMail(UserId, RoleId, Mode, Type);
                var Json = JsonConvert.SerializeObject(lstInternalMailEntity);
                ResultString = Json;
            }
            if (Mode == "TrashByUser")
            {
                List<InternalMailEntity> lstInternalMailEntity = new List<InternalMailEntity>();
                ObjInternalMailDA = new InternalMailDA();
                lstInternalMailEntity = ObjInternalMailDA.GetInternalMail(UserId, RoleId, Mode, Type);
                var Json = JsonConvert.SerializeObject(lstInternalMailEntity);
                ResultString = Json;
            }
            if (Mode == "MsgByInbox")
            {
                MsgId = Convert.ToInt32(context.Request.QueryString["MsgId"]);
                InternalMailEntity ObjInternalMailEntity = new InternalMailEntity();
                ObjInternalMailDA = new InternalMailDA();
                ObjInternalMailEntity = ObjInternalMailDA.GetInternalMailByID(MsgId, Mode);
                var Json = JsonConvert.SerializeObject(ObjInternalMailEntity);
                ResultString = Json;
            }
            if (Mode == "MsgBySent")
            {
                MsgId = Convert.ToInt32(context.Request.QueryString["MsgId"]);
                InternalMailEntity ObjInternalMailEntity = new InternalMailEntity();
                ObjInternalMailDA = new InternalMailDA();
                ObjInternalMailEntity = ObjInternalMailDA.GetInternalMailByID(MsgId, Mode);
                var Json = JsonConvert.SerializeObject(ObjInternalMailEntity);
                ResultString = Json;
            }
            if (Mode == "MsgByTrash")
            {
                MsgId = Convert.ToInt32(context.Request.QueryString["MsgId"]);
                InternalMailEntity ObjInternalMailEntity = new InternalMailEntity();
                ObjInternalMailDA = new InternalMailDA();
                ObjInternalMailEntity = ObjInternalMailDA.GetInternalMailByID(MsgId, Mode);
                var Json = JsonConvert.SerializeObject(ObjInternalMailEntity);
                ResultString = Json;
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