using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Web.SessionState;
using EntityComponent.User;
using DataAccessComponent.User;
using DataAccessComponent.Student;
using EntityComponent.MasterData;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for ManageUser
    /// </summary>
    public class ManageUser :  IHttpHandler, IReadOnlySessionState 
    {
        string Mode = string.Empty;
        string category = string.Empty;        
        int Id = 0;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            category = Convert.ToString(context.Request.QueryString["Category"]);           
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);

            if (Mode == "ForGrid")
            {
                List<UserInformationForGrid> lstUserInformationForGrid = new List<UserInformationForGrid>();
                UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();

                lstUserInformationForGrid = ObjUserEnrollmentDA.GetUserInformationForGrid(category, Id, Mode);

                var Json = JsonConvert.SerializeObject(lstUserInformationForGrid);
                ResultString = Json;
            }
            else if (Mode == "DeleteUserById")
            {
                string Message = string.Empty;
                bool Status = false;
                int ID = 0;

                UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();
                UserEnrollmentEntity ObjUserEnrollmentEntity = new UserEnrollmentEntity();
                ObjUserEnrollmentEntity.User_Id = Id;
                ObjUserEnrollmentEntity.CreatedBy = Convert.ToInt32(context.Session["UserId"].ToString());
                ObjUserEnrollmentEntity.Mode = "Delete";
                ObjUserEnrollmentDA.SetUserEnrollment(ObjUserEnrollmentEntity, out Status, out Message,out ID);

                ResultString = Message;
            }
            else if (Mode == "GetById")
            {
                UserEnrollmentEntity ObjUserEnrollmentEntity = new UserEnrollmentEntity();
                UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();

                ObjUserEnrollmentEntity = ObjUserEnrollmentDA.GetUserInformation(Id, Mode);

                var Json = JsonConvert.SerializeObject(ObjUserEnrollmentEntity);
                ResultString = Json;
            }
            else if (Mode == "GetUserList")
            {
                List<CommonEntity> lstCommonEntityEntity = new List<CommonEntity>();
                UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();

                lstCommonEntityEntity = ObjUserEnrollmentDA.GetUserList("All");

                var Json = JsonConvert.SerializeObject(lstCommonEntityEntity);
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