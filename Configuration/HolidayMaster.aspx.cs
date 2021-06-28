using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using EntityComponent.MasterData;
using ExceptionComponent;
using DataAccessComponent;

namespace ILogisticsApplication.Configuration
{
    public partial class HolidayMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtAcademicYr = new DataTable();
                dtAcademicYr.Columns.Add("Id", typeof(int));
                dtAcademicYr.Columns.Add("Name", typeof(string));
                string strAcademicYrFormat = string.Empty;
                for (int i = 0; i <= 10; i++)
                {
                    DataRow drNewRow = dtAcademicYr.NewRow();
                    int yr = DateTime.Now.Year;
                    strAcademicYrFormat = Convert.ToString(yr  - i) + "-" + Convert.ToString(yr + 1- i);
                    drNewRow["Id"] = i + 1;
                    drNewRow["Name"] = strAcademicYrFormat;
                    dtAcademicYr.Rows.Add(drNewRow);
                }
                ddlType.DataSource = dtAcademicYr;
                ddlType.DataBind();
                ddlType.DataValueField = "Id";
                ddlType.DataTextField = "Name";
                ddlType.DataBind();
            }
           
        }
    }
}