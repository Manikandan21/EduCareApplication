using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent.Student;
using EntityComponent.Student;
using ThemeComponent;
using System.Globalization;
using System.Text.RegularExpressions;
using EmailUtility;
using ExceptionComponent;

namespace ILogisticsApplication.Students
{
    public partial class StudentEnrollment : System.Web.UI.Page
    {
        string DisplayMsg = string.Empty;
        private static Regex digitsOnly = new Regex(@"[^\d]");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 1)
                {
                    long StudentId = Convert.ToInt64(Request.QueryString["StudentId"].ToString());

                    if (StudentId != 0)
                    {
                        BindStudentInfo(StudentId);
                    }
                }
            }
        }

        protected void BindStudentInfo(long StudentId)
        {
            List<StudentEnrollmentEntity> lstStudentEnrollmentEntity = new List<StudentEnrollmentEntity>();
            StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();
            try
            {

                lstStudentEnrollmentEntity = ObjStudentEnrollmentDA.GetStudentInformation(null, null, StudentId, "ByStudent");

                txtAdmission.Value = lstStudentEnrollmentEntity[0].Admission_Number;
                txtFirstName.Value = lstStudentEnrollmentEntity[0].FirstName;
                txtLastname.Value = lstStudentEnrollmentEntity[0].LastName;
                hdnCourse.Value = lstStudentEnrollmentEntity[0].Course;
                hdnSection.Value = lstStudentEnrollmentEntity[0].Section;
                hdnAcademicYear.Value = lstStudentEnrollmentEntity[0].AcademicYear.ToString();
                txtDOB.Value = Convert.ToString(lstStudentEnrollmentEntity[0].DOB);
                hdnGender.Value = lstStudentEnrollmentEntity[0].Gender;
                hdnBloodGroup.Value = lstStudentEnrollmentEntity[0].BloodGroup;
                txtBirthPalce.Value = lstStudentEnrollmentEntity[0].BirthPlace;
                hdnNationality.Value = Convert.ToString(lstStudentEnrollmentEntity[0].Nationality);
                txtMotherTongue.Value = lstStudentEnrollmentEntity[0].MotherTongue;
                hdnCategory.Value = lstStudentEnrollmentEntity[0].Category;
                hdnReligion.Value = lstStudentEnrollmentEntity[0].Religion;
                txtCaste.Value = lstStudentEnrollmentEntity[0].Caste;
                txtAddressOne.Value = lstStudentEnrollmentEntity[0].AddressOne;
                txtAddresstwo.Value = lstStudentEnrollmentEntity[0].Addresstwo;
                txtCity.Value = lstStudentEnrollmentEntity[0].City;
                txtState.Value = lstStudentEnrollmentEntity[0].State;
                txtPincode.Value = lstStudentEnrollmentEntity[0].Pincode;
                hdnCountry.Value = Convert.ToString(lstStudentEnrollmentEntity[0].Country);
                txtMobileNumber.Value = lstStudentEnrollmentEntity[0].MobileNumber;
                txtAltMobileNumber.Value = lstStudentEnrollmentEntity[0].AltPhoneNumber;
                txtEmail.Value = lstStudentEnrollmentEntity[0].Email;
                txtParentName.Value = lstStudentEnrollmentEntity[0].ParentName;
                hdnRelation.Value = lstStudentEnrollmentEntity[0].Relationship;

                for (int i = 0; i < ddlGender.Items.Count; i++)
                {
                    if (ddlGender.Items[i].Text.ToString() == lstStudentEnrollmentEntity[0].Gender.ToString())
                    {
                        ddlGender.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlBloodgroup.Items.Count; i++)
                {
                    if (ddlBloodgroup.Items[i].Text.ToString() == lstStudentEnrollmentEntity[0].BloodGroup.ToString())
                    {
                        ddlBloodgroup.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlCategory.Items.Count; i++)
                {
                    if (ddlCategory.Items[i].Text.ToString() == lstStudentEnrollmentEntity[0].Category.ToString())
                    {
                        ddlCategory.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlReligion.Items.Count; i++)
                {
                    if (ddlReligion.Items[i].Text.ToString() == lstStudentEnrollmentEntity[0].Religion.ToString())
                    {
                        ddlReligion.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlRelationship.Items.Count; i++)
                {
                    if (ddlRelationship.Items[i].Text.ToString() == lstStudentEnrollmentEntity[0].Relationship.ToString())
                    {
                        ddlRelationship.Items[i].Selected = true;

                    }
                }

                txtEmergencyNumber.Value = lstStudentEnrollmentEntity[0].EmergencyNumber;
                hdnSiblingsId.Value = Convert.ToString(lstStudentEnrollmentEntity[0].SiblingId);

                btnSubmitDown.InnerText = "Update";
                btnSubmitUp.InnerText = "Update";
            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            if (btnSubmitUp.InnerText == "Update")
            {
                SaveDetails("Update");
            }
            else if (btnSubmitUp.InnerText == "Save")
            {
                SaveDetails("Insert");
            }

        }
        public void SaveDetails(string Mode)
        {
            string Message = string.Empty;
            bool Status = false;
            long StudentID = 0;
            StudentEnrollmentDA ObjStudentEnrollmentDA = new StudentEnrollmentDA();
            StudentEnrollmentEntity ObjStudentEnrollmentEntity = new StudentEnrollmentEntity();
            bool iscredentialSent = Convert.ToBoolean(chkCredentialSend.Checked);
            try
            {
                if (Mode == "Insert")
                {
                    ObjStudentEnrollmentEntity.Student_Id = 0;
                    ObjStudentEnrollmentEntity.Mode = Mode;
                }
                else if (Mode == "Update")
                {
                    ObjStudentEnrollmentEntity.Student_Id = Convert.ToInt64(Request.QueryString["StudentId"].ToString());
                    ObjStudentEnrollmentEntity.Mode = Mode;
                }
                ObjStudentEnrollmentEntity.Admission_Number = txtAdmission.Value.Trim();
                ObjStudentEnrollmentEntity.FirstName = txtFirstName.Value.Trim();
                ObjStudentEnrollmentEntity.LastName = txtLastname.Value.Trim();
                ObjStudentEnrollmentEntity.Course = hdnCourse.Value.Trim();
                ObjStudentEnrollmentEntity.Section = hdnSection.Value.Trim();
                ObjStudentEnrollmentEntity.DOB = txtDOB.Value.Trim();
                ObjStudentEnrollmentEntity.Gender = ddlGender.Items[ddlGender.SelectedIndex].Text.Trim();
                ObjStudentEnrollmentEntity.BloodGroup = ddlBloodgroup.Items[ddlBloodgroup.SelectedIndex].Text.Trim();
                ObjStudentEnrollmentEntity.BirthPlace = txtBirthPalce.Value.Trim();
                ObjStudentEnrollmentEntity.Nationality = Convert.ToInt32(hdnNationality.Value.Trim());
                ObjStudentEnrollmentEntity.MotherTongue = txtMotherTongue.Value.Trim();
                ObjStudentEnrollmentEntity.Religion = ddlReligion.Items[ddlReligion.SelectedIndex].Text.Trim();
                ObjStudentEnrollmentEntity.Category = ddlCategory.Items[ddlCategory.SelectedIndex].Text.Trim();
                ObjStudentEnrollmentEntity.Caste = txtCaste.Value.Trim();
                ObjStudentEnrollmentEntity.AddressOne = txtAddressOne.Value.Trim();
                ObjStudentEnrollmentEntity.Addresstwo = txtAddresstwo.Value.Trim();
                ObjStudentEnrollmentEntity.City = txtCity.Value.Trim();
                ObjStudentEnrollmentEntity.State = txtState.Value.Trim();
                ObjStudentEnrollmentEntity.Pincode = txtPincode.Value.Trim();
                ObjStudentEnrollmentEntity.Country = Convert.ToInt32(hdnCountry.Value.Trim());
                ObjStudentEnrollmentEntity.MobileNumber = FormatPhoneNumber(txtMobileNumber.Value.Trim());
                ObjStudentEnrollmentEntity.AltPhoneNumber = FormatPhoneNumber(txtAltMobileNumber.Value.Trim());
                ObjStudentEnrollmentEntity.Email = txtEmail.Value.Trim();
                ObjStudentEnrollmentEntity.ParentName = txtParentName.Value.Trim();
                ObjStudentEnrollmentEntity.Relationship = ddlRelationship.Items[ddlRelationship.SelectedIndex].Text.Trim();
                ObjStudentEnrollmentEntity.EmergencyNumber = FormatPhoneNumber(txtEmergencyNumber.Value.Trim());
                ObjStudentEnrollmentEntity.SiblingId = Convert.ToInt64(ddlSiblingName.Value);
                ObjStudentEnrollmentEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                ObjStudentEnrollmentEntity.isSendCredential = Convert.ToBoolean(chkCredentialSend.Checked);
                //Upload Image
                if (UploadImage.HasFile)
                {
                    int length = UploadImage.PostedFile.ContentLength;
                    if (length > 0)
                    {
                        ObjStudentEnrollmentEntity.ProfileImage = UploadImage.FileBytes;
                    }
                }

                ObjStudentEnrollmentDA.SetStudentEnrollment(ObjStudentEnrollmentEntity, out Status, out Message, "", out StudentID); //The last parameter added for sending the delete reason to DB. Here no need to pass any value.

                if (Status == true)
                {
                    if (Mode == "Insert")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Students details saved successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    if (Mode == "Update")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Students details updated successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        Response.Redirect("../Students/StudentInfo.aspx?MenuID=7", false);
                    }
                    if (Mode == "Delete")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Students details deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        Response.Redirect("../Students/StudentInfo.aspx?MenuID=7", false);
                    }
                    ClearControl();
                }
                else if (Status == false)
                {
                    if (Message.Contains("Exists"))
                    {
                        if (Mode == "Insert" || Mode == "Update")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Students details already exists", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                    else if (Message.Contains("Mapped"))
                    {
                        if (Mode == "Delete")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Students details mapped with another entity , Please check before you delete", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error occurred, Please try again", 2);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

                    }
                }
            }
            catch (Exception Ex)
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error occurred, Please try again,Please contact the system Administrator", 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                ExceptionLog.SetException(Ex.Message, "GetCredentialInfo", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
            finally
            {
                if (iscredentialSent && (Mode == "Insert") && Status && StudentID > 0)
                {
                    CommunicationChannelUtility Obj = new CommunicationChannelUtility();
                    Obj.SendCredentials(3, StudentID, ObjStudentEnrollmentEntity.CreatedBy);
                }
            }
        }


        public static string FormatPhoneNumber(string phone)
        {
            return digitsOnly.Replace(phone, "");
        }

        public void ClearControl()
        {
            txtAdmission.Value = string.Empty;
            txtFirstName.Value = string.Empty;
            txtLastname.Value = string.Empty;
            hdnCourse.Value = "0";
            hdnSection.Value = "0";
            // ddlCourse.SelectedIndex = 0;
            //  ddlSection.Items.Clear();
            txtDOB.Value = string.Empty;
            ddlGender.SelectedIndex = 0;
            ddlBloodgroup.SelectedIndex = 0;
            txtBirthPalce.Value = string.Empty;
            hdnNationality.Value = "19";
            txtMotherTongue.Value = string.Empty;
            ddlReligion.SelectedIndex = 0;
            ddlCategory.SelectedIndex = 0;
            txtCaste.Value = string.Empty;
            txtAddressOne.Value = string.Empty;
            txtAddresstwo.Value = string.Empty;
            txtCity.Value = string.Empty;
            txtState.Value = string.Empty;
            txtPincode.Value = string.Empty;
            hdnCountry.Value = "99";
            txtMobileNumber.Value = string.Empty;
            txtAltMobileNumber.Value = string.Empty;
            txtEmail.Value = string.Empty;
            txtParentName.Value = string.Empty;
            ddlRelationship.SelectedIndex = 0;
            txtEmergencyNumber.Value = string.Empty;
            ddlSiblingDetails.SelectedIndex = 0;
            ddlSiblingCourse.SelectedIndex = 0;
            ddlSiblingSection.SelectedIndex = 0;
            ddlSiblingName.SelectedIndex = 0;
            chkCredentialSend.Checked = false;
        }
    }
}