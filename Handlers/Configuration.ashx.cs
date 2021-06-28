using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EntityComponent.MasterData;
using DataAccessComponent.MasterData;
using Newtonsoft.Json;
using DataAccessComponent;
using System.Web.SessionState;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for Configuration
    /// </summary>
    public class Configuration : IHttpHandler, IRequiresSessionState
    {
        string Mode = string.Empty;
        string GetDataMode = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;

        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            GetDataMode = Convert.ToString(context.Request.QueryString["GetDataMode"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);

            if (Mode == "BranchConfig")
            {
                if (GetDataMode != "")
                {
                    List<BranchEntity> lstBranches = new List<BranchEntity>();
                    BranchesDA objBranchesDA = new BranchesDA();
                    lstBranches = objBranchesDA.GetBranchDetails(GetDataMode, Id);

                    var Json = JsonConvert.SerializeObject(lstBranches);
                    ResultString = Json;
                }
            }

            if (Mode == "CourseConfig")
            {
                if (GetDataMode != "")
                {
                    List<CourseEntity> lstCourseEntity = new List<CourseEntity>();
                    CoursesDataAccess ObjCoursesDataAccess = new CoursesDataAccess();
                    lstCourseEntity = ObjCoursesDataAccess.GetCourseDetails(GetDataMode, Id);

                    var Json = JsonConvert.SerializeObject(lstCourseEntity);
                    ResultString = Json;
                }
            }
            
            else if (Mode == "DepartmentConfig")
            {
                if (GetDataMode != "")
                {
                    List<DepartmentEntity> lstDepartmentEntity = new List<DepartmentEntity>();
                    DepartmentDA ObjDepartmentDA = new DepartmentDA();
                    lstDepartmentEntity = ObjDepartmentDA.GetDepartmentDetails(GetDataMode, Id);

                    var Json = JsonConvert.SerializeObject(lstDepartmentEntity);
                    ResultString = Json;
                }
            }
            else if (Mode == "SubjectConfig")
            {
                List<SubjectEntity> lstSubjectEntity = new List<SubjectEntity>();
                if (GetDataMode != "")
                {
                    SubjectDA ObjSubjectDA = new SubjectDA();
                    lstSubjectEntity = ObjSubjectDA.GetSubjectDetails(GetDataMode, Id);

                    var Json = JsonConvert.SerializeObject(lstSubjectEntity);
                    ResultString = Json;
                }
            }
            else if (Mode == "GetSubject" || Mode == "GetSubjectNonID")
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                if (GetDataMode != "")
                {
                    DataAccessComponent.CommonDA ObjCommonDA = new DataAccessComponent.CommonDA();
                    lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, "", Id);

                    var Json = JsonConvert.SerializeObject(lstCommonEntity);
                    ResultString = Json;
                }
            }
            else if (Mode == "ExamConfig")
            {
                if (GetDataMode != "")
                {
                    List<ExamEntity> lstExamEntity = new List<ExamEntity>();
                    ExamDA ObjExamDA = new ExamDA();
                    lstExamEntity = ObjExamDA.GetExamDetails(GetDataMode, Id);

                    var Json = JsonConvert.SerializeObject(lstExamEntity);
                    ResultString = Json;
                }
            }

            else if (Mode == "GetCourse")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }

            else if (Mode == "GetSection")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, GetDataMode, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "GetAcademicYr")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, GetDataMode, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }

            else if (Mode == "GetCountry")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }

            else if (Mode == "GetNationality")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "GetDepartment")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "AdminRoles")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, 0);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "RolesByUser")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, Id);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "NonAdminRoles")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, Id);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "RolesForSMS")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, Id);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
                ResultString = Json;
            }
            else if (Mode == "AdminMailRoles")
            {
                CommonDA ObjCommonDA = new CommonDA();
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                lstCommonEntity = ObjCommonDA.BindDropdownList(Mode, null, Id);

                var Json = JsonConvert.SerializeObject(lstCommonEntity);
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