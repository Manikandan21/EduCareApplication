using DataAccessComponent;
using DataAccessComponent.MasterData;
using EntityComponent.MasterData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Configuration
{
    public partial class ViewCourseSubjectMapping : System.Web.UI.Page
    {
        string Message = string.Empty;
       // bool Status = false;
        string DisplayMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    BindCourse();
            //}
        }
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
            //    string Course = ddlCourse.SelectedItem.Text.Trim();
            //    if (Course != "0")
            //    {
            //        if (hdnId.Value == "")
            //        {
            //            BindSection(Course);
            //        }

            //    }

            //}
            //catch (Exception)
            //{
            //    throw;
            //}
        }

       
        public void BindCourse()
        {
            try
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();
                lstCommonEntity = ObjCommonDA.BindDropdownList("GetCourse", null, 0);
                ddlCourse.DataSource = lstCommonEntity;
                ddlCourse.DataTextField = "Name";
                // ddlCourse.DataValueField = "Id";
                ddlCourse.DataBind();
                ddlCourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void BindSection(string Course)
        {
            List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
            CommonDA ObjCommonDA = new CommonDA();
            lstCommonEntity = ObjCommonDA.BindDropdownList("GetSection", Course, 0);
            ddlSection.DataSource = lstCommonEntity;
            ddlSection.DataTextField = "Name";
            ddlSection.DataValueField = "Id";
            ddlSection.DataBind();
            ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
        }
    }
}