using ExcelSample.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Excel = Microsoft.Office.Interop.Excel;
namespace ExcelSample
{
    public partial class ExcelUpload : System.Web.UI.Page
    {
        //Excel.Application excelApp = new Excel.Application();


        public void DownloadButton(object sender, EventArgs e)
        {
            string _templatePath = ConfigurationManager.AppSettings["ExcelTemplatepath"].ToString();
            string _fileName = ConfigurationManager.AppSettings["FileName"].ToString();
            string PathToExcelFile = "@" + _templatePath;
            FileInfo file = new FileInfo(PathToExcelFile);

            if (file.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=" + _fileName);
                Response.AddHeader("Content-Type", "application/Excel");
                Response.ContentType = "application/vnd.xls";
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.WriteFile(file.FullName);
                Response.End();
            }
            else
            {
                Response.Write("This file does not exist.");
            }

        }


        public void UploadButton(object sender, EventArgs e)
        {
            if (FileUpLoad.HasFile)
            {

                // FileUpLoad.SaveAs(@"C:\temp\" + FileUpLoad.FileName);
                string _Excelfolder = ConfigurationManager.AppSettings["ExcelFolder"].ToString();
                string _fileName = FileUpLoad.FileName;
                string _extension = _fileName.Substring(_fileName.LastIndexOf('.') + 1);

                if (_extension.ToLower() == "csv" || _extension.ToLower() == "xlsx")
                {

                    if (!Directory.Exists(_Excelfolder))
                    {
                        Directory.CreateDirectory(_Excelfolder);
                    }
                    string fullpathfilename = Path.Combine(_Excelfolder, FileUpLoad.FileName);
                    FileUpLoad.SaveAs(fullpathfilename);
                    //string connString = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + _Excelfolder + ";" + "Extended Properties=\"Excel 8.0;HDR=Yes;\"";
                    string connString = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + fullpathfilename + ";" + "Extended Properties=\"Excel 12.0;HDR=Yes;\"";
                    DbProviderFactory factory = DbProviderFactories.GetFactory("System.Data.OleDb");
                    using (DbConnection connection = factory.CreateConnection())
                    {
                        connection.ConnectionString = connString;
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }
                        // connection.Open();

                        using (DbCommand _command = connection.CreateCommand())
                        {
                            int totalRows = 0;
                            _command.CommandText = "select count(*) FROM [Studentinfo$]";
                            int.TryParse(_command.ExecuteScalar().ToString(), out totalRows);
                            // connection.Close();
                            //totalRows = Utility.GetInt(_command.ExecuteScalar());
                            if (totalRows == 0)
                            {
                                return;
                            }
                            else
                            {

                                using (DbCommand command = connection.CreateCommand())
                                {
                                    command.CommandText = "SELECT [Admission_Number],[FirstName],[LastName]," +
                                        "[Course],[Section],[Academic_Year],[DOB],[Gender],[Blood_Group],[BirthPlace]," +
                                        "[Nationality],[MotherTongue],[Category],[Caste],[Religion],[AddressOne]," +
                                        "[Addresstwo],[City],[State],[Pincode],[Country],[MobileNumber],[Alternate_Phone_Number],[Email]," +
                                        "[Parent_Name],[Relationship],[Emergency_ContactNumber] FROM [Studentinfo$]";
                                    try
                                    {
                                        // connection.Open();
                                        using (DbDataReader dr = command.ExecuteReader())
                                        {
                                            DataTable dt = dr.GetSchemaTable();

                                            string _Admission_Number = dt.Rows[0][0].ToString();
                                            string _FirstName = dt.Rows[1][0].ToString();
                                            string _LastName = dt.Rows[2][0].ToString();
                                            string _Course = dt.Rows[3][0].ToString();
                                            string _Section = dt.Rows[4][0].ToString();
                                            string _Academic_Year = dt.Rows[5][0].ToString();
                                            string _DOB = dt.Rows[6][0].ToString();
                                            string _Gender = dt.Rows[7][0].ToString();
                                            string _BloodGroup = dt.Rows[8][0].ToString();
                                            string _BirthPlace = dt.Rows[9][0].ToString();
                                            string _Nationality = dt.Rows[10][0].ToString();
                                            string _MotherTongue = dt.Rows[11][0].ToString();
                                            string _Category = dt.Rows[12][0].ToString();
                                            string _Caste = dt.Rows[13][0].ToString();
                                            string _Religion = dt.Rows[14][0].ToString();
                                            string _AddressOne = dt.Rows[15][0].ToString();
                                            string _Addresstwo = dt.Rows[16][0].ToString();
                                            string _City = dt.Rows[17][0].ToString();
                                            string _State = dt.Rows[18][0].ToString();
                                            string _Pincode = dt.Rows[19][0].ToString();
                                            string _Country = dt.Rows[20][0].ToString();
                                            string _MobileNumber = dt.Rows[21][0].ToString();//
                                            string _AltPhoneNumber = dt.Rows[22][0].ToString();
                                            string _Email = dt.Rows[23][0].ToString();
                                            string _ParentName = dt.Rows[24][0].ToString();
                                            string _Relationship = dt.Rows[25][0].ToString();
                                            string _EmergencyNumber = dt.Rows[26][0].ToString();


                                            List<StudentDetails> studentDetails = new List<StudentDetails>();
                                            List<StudentDetails> ErrorDetails = new List<StudentDetails>();
                                            //compare the excel column names with defined column names
                                            if (!string.IsNullOrEmpty(_Course) && _Course.Trim() == Constants.Course && !string.IsNullOrEmpty(_Section) && _Section.Trim() == Constants.Section
                                              && !string.IsNullOrEmpty(_FirstName) && _FirstName.Trim() == Constants.FirstName && !string.IsNullOrEmpty(_LastName) && _LastName.Trim() == Constants.LastName
                                              && !string.IsNullOrEmpty(_Academic_Year) && _Academic_Year.Trim() == Constants.AcademicYear
                                              && !string.IsNullOrEmpty(_DOB) && _DOB.Trim() == Constants.DOB
                                              && !string.IsNullOrEmpty(_Gender) && _Gender.Trim() == Constants.Gender
                                              && !string.IsNullOrEmpty(_BloodGroup) && _BloodGroup.Trim() == Constants.BloodGroup && !string.IsNullOrEmpty(_Course) && _Course.Trim() == Constants.Course
                                              && !string.IsNullOrEmpty(_BirthPlace) && _BirthPlace.Trim() == Constants.BirthPlace
                                              && !string.IsNullOrEmpty(_Nationality) && _Nationality.Trim() == Constants.Nationality
                                              && !string.IsNullOrEmpty(_MotherTongue) && _MotherTongue.Trim() == Constants.MotherTongue
                                              && !string.IsNullOrEmpty(_Category) && _Category.Trim() == Constants.Category
                                              && !string.IsNullOrEmpty(_Caste) && _Caste.Trim() == Constants.Caste
                                              && !string.IsNullOrEmpty(_Religion) && _Religion.Trim() == Constants.Religion
                                              && !string.IsNullOrEmpty(_AddressOne) && _AddressOne.Trim() == Constants.AddressOne
                                              && !string.IsNullOrEmpty(_Addresstwo) && _Addresstwo.Trim() == Constants.Addresstwo
                                              && !string.IsNullOrEmpty(_City) && _City.Trim() == Constants.City
                                              && !string.IsNullOrEmpty(_State) && _State.Trim() == Constants.State
                                              && !string.IsNullOrEmpty(_Pincode) && _Pincode.Trim() == Constants.Pincode
                                              && !string.IsNullOrEmpty(_Country) && _Country.Trim() == Constants.Country
                                              && !string.IsNullOrEmpty(_MobileNumber) && _MobileNumber.Trim() == Constants.MobileNumber
                                              && !string.IsNullOrEmpty(_AltPhoneNumber) && _AltPhoneNumber.Trim() == Constants.AltPhoneNumber
                                              && !string.IsNullOrEmpty(_Email) && _Email.Trim() == Constants.Email
                                              && !string.IsNullOrEmpty(_ParentName) && _ParentName.Trim() == Constants.ParentName
                                              && !string.IsNullOrEmpty(_Relationship) && _Relationship.Trim() == Constants.Relationship
                                              && !string.IsNullOrEmpty(_EmergencyNumber) && _EmergencyNumber.Trim() == Constants.EmergencyNumber)
                                            {
                                                while (dr.Read())
                                                {

                                                    StudentDetails _student = new StudentDetails();
                                                    //_student.Studentid = dr["Student_ID"].ToString();
                                                    _student.AdmissionNumber = dr["Admission_Number"].ToString();
                                                    _student.FirstName = dr["FirstName"].ToString();
                                                    _student.LastName = dr["LastName"].ToString();
                                                    _student.Course = dr["Course"].ToString();
                                                    _student.Section = dr["Section"].ToString();
                                                    _student.AcademicYear = dr["Academic_Year"].ToString();
                                                    _student.DOB = dr["DOB"].ToString();
                                                    _student.Gender = dr["Gender"].ToString();
                                                    _student.BloodGroup = dr["Blood_Group"].ToString();
                                                    _student.BirthPlace = dr["BirthPlace"].ToString();
                                                    _student.Religion = dr["Religion"].ToString();
                                                    _student.MotherTongue = dr["MotherTongue"].ToString();
                                                    _student.Category = dr["Category"].ToString();
                                                    _student.Caste = dr["Caste"].ToString();
                                                    _student.AddressOne = dr["AddressOne"].ToString();
                                                    _student.Addresstwo = dr["Addresstwo"].ToString();
                                                    _student.City = dr["City"].ToString();
                                                    _student.State = dr["State"].ToString();
                                                    _student.Pincode = dr["Pincode"].ToString();
                                                    _student.Country = dr["Country"].ToString();
                                                    _student.State = dr["State"].ToString();
                                                    _student.MobileNumber = dr["MobileNumber"].ToString();
                                                    _student.AltPhoneNumber = dr["Alternate_Phone_Number"].ToString();
                                                    _student.Email = dr["Email"].ToString();
                                                    _student.ParentName = dr["Parent_Name"].ToString();
                                                    _student.Relationship = dr["Relationship"].ToString();
                                                    _student.Nationality = dr["Nationality"].ToString();
                                                    _student.EmergencyNumber = dr["Emergency_ContactNumber"].ToString();


                                                    if (!string.IsNullOrWhiteSpace(_student.FirstName) && !string.IsNullOrWhiteSpace(_student.LastName)
                                                        && !string.IsNullOrWhiteSpace(_student.Course) && !string.IsNullOrWhiteSpace(_student.Section)
                                                        && !string.IsNullOrWhiteSpace(_student.AcademicYear) && !string.IsNullOrWhiteSpace(_student.DOB)
                                                        && !string.IsNullOrWhiteSpace(_student.Gender) && !string.IsNullOrWhiteSpace(_student.Nationality)
                                                        && !string.IsNullOrWhiteSpace(_student.AddressOne) && !string.IsNullOrWhiteSpace(_student.Addresstwo)
                                                        && !string.IsNullOrWhiteSpace(_student.City) && !string.IsNullOrWhiteSpace(_student.Pincode)
                                                        && !string.IsNullOrWhiteSpace(_student.Country) && !string.IsNullOrWhiteSpace(_student.State)
                                                        && !string.IsNullOrWhiteSpace(_student.Relationship) && !string.IsNullOrWhiteSpace(_student.ParentName))
                                                    {
                                                    _student.Status = 0;
                                                    studentDetails.Add(_student);

                                                    }
                                                     else
                                                     {
                                                    _student.ErrorDescription = "Mandtitory field is required";
                                                      ErrorDetails.Add(_student);


                                                     }


                                                }
                                                if(studentDetails.Count()>0)
                                                studentDetails = studentDetails.GroupBy(x => new { x.FirstName, x.LastName, x.ParentName, x.MobileNumber }).Select(x => x.First()).ToList();

                                                DataTable _newDT = ToDataTable(studentDetails);
                                                string _conn = ConfigurationManager.ConnectionStrings["DBconnection"].ConnectionString;
                                                SqlBulkCopy bulkInsert = new SqlBulkCopy(_conn);
                                             
                                                bulkInsert.DestinationTableName = "TempRegistration";
                                                
                                                bulkInsert.WriteToServer(_newDT);

                                                using (SqlConnection con = new SqlConnection(_conn))
                                                {
                                                    using (SqlCommand cmd = new SqlCommand("USP_Temp_StudentRegistration", con))
                                                    {
                                                        cmd.CommandType = CommandType.StoredProcedure;
                                                        con.Open();
                                                        SqlDataReader _reader = cmd.ExecuteReader();

                                                        while(_reader.Read())
                                                        {
                                                            StudentDetails _student = new StudentDetails();
                                                            _student.AdmissionNumber = dr["Admission_Number"].ToString();
                                                            _student.FirstName = dr["FirstName"].ToString();
                                                            _student.LastName = dr["LastName"].ToString();
                                                            _student.Course = dr["Course"].ToString();
                                                            _student.Section = dr["Section"].ToString();
                                                            _student.AcademicYear = dr["Academic_Year"].ToString();
                                                            _student.DOB = dr["DOB"].ToString();
                                                            _student.Gender = dr["Gender"].ToString();
                                                            _student.BloodGroup = dr["Blood_Group"].ToString();
                                                            _student.BirthPlace = dr["BirthPlace"].ToString();
                                                            _student.Religion = dr["Religion"].ToString();
                                                            _student.MotherTongue = dr["MotherTongue"].ToString();
                                                            _student.Category = dr["Category"].ToString();
                                                            _student.Caste = dr["Caste"].ToString();
                                                            _student.AddressOne = dr["AddressOne"].ToString();
                                                            _student.Addresstwo = dr["Addresstwo"].ToString();
                                                            _student.City = dr["City"].ToString();
                                                            _student.State = dr["State"].ToString();
                                                            _student.Pincode = dr["Pincode"].ToString();
                                                            _student.Country = dr["Country"].ToString();
                                                            _student.State = dr["State"].ToString();
                                                            _student.MobileNumber = dr["MobileNumber"].ToString();
                                                            _student.AltPhoneNumber = dr["Alternate_Phone_Number"].ToString();
                                                            _student.Email = dr["Email"].ToString();
                                                            _student.ParentName = dr["Parent_Name"].ToString();
                                                            _student.Relationship = dr["Relationship"].ToString();
                                                            _student.Nationality = dr["Nationality"].ToString();
                                                            _student.EmergencyNumber = dr["Emergency_ContactNumber"].ToString();
                                                            _student.Status = Convert.ToInt32(dr["Status"]);
                                                            ErrorDetails.Add(_student);
                                                        }
                                                        
                                                        if (ErrorDetails.Count() > 0)
                                                        {
                                                            btnErrorButton.Visible = true;
                                                            btnDownloadButton.Visible = false;
                                                            DataTable dtable = new DataTable();
                                                            SqlConnection objcon = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DBconnection"].ToString());
                                                            SqlDataAdapter objda = new SqlDataAdapter("select * from TempRegistration where status=2", objcon);
                                                            objda.Fill(dtable);
                                                            int _error =dtable.Rows.Count;
                                                            //gvreport.DataSource = dtable;
                                                            //gvreport.DataBind();
                                                            ExportToExcel("ErrorListReport.xls",dtable);
                                                            //gvreport = null;
                                                            //gvreport.Dispose();
                                                            Status.Text = "File Uploaded: " + FileUpLoad.FileName;

                                                        }
                                                    }
                                                    
                                                
                                                }
                                            }

                                        }


                                    }

                                    catch (Exception ex)
                                    {

                                    }

                                }

                            }
                        }
                    }

                }
                else
                {
                    Status.Text = "No File Uploaded.";
                }
            }
        }

        public DataTable ToDataTable<T>(List<T> items)

        {

            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties

            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);

            foreach (PropertyInfo prop in Props)

            {

                //Setting column names as Property names

                dataTable.Columns.Add(prop.Name);

            }

            foreach (T item in items)

            {

                var values = new object[Props.Length];

                for (int i = 0; i < Props.Length; i++)

                {

                    //inserting property values to datatable rows

                    values[i] = Props[i].GetValue(item, null);

                }

                dataTable.Rows.Add(values);

            }

            return dataTable;

        }

        private void ExportToExcel(string strFileName,DataTable dt)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=" + strFileName);
            Response.ContentType = "application/excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            dt.WriteXml(sw);
            Response.Write(sw.ToString());
            Response.End();
        }

    }
}