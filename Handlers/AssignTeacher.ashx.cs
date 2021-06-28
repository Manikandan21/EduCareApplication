using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for AssignTeacher
    /// </summary>
    public class AssignTeacher : IHttpHandler
    {
        string Mode = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);

            if (Mode == "GetDataById")
            {
                AssignTeacherDA ObjAssignTeacherDA = new AssignTeacherDA();
                List<AssignClassTeacherEntity> lstAssignClassTeacherEntity = new List<AssignClassTeacherEntity>();
                lstAssignClassTeacherEntity = ObjAssignTeacherDA.GetAssignTeacher(Mode, Id);

                var Json = JsonConvert.SerializeObject(lstAssignClassTeacherEntity);
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