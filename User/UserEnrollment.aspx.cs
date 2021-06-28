using DataAccessComponent.User;
using EmailUtility;
using EntityComponent.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.User
{
    public partial class UserEnrollment : System.Web.UI.Page
    {
        string DisplayMsg = string.Empty;
        private static Regex digitsOnly = new Regex(@"[^\d]");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 1)
                {
                    int UserId = Convert.ToInt32(Request.QueryString["UserId"].ToString());

                    if (UserId != 0)
                    {
                        BindUserInfo(UserId);
                    }
                }
            }
        }

        public void BindUserInfo(int UserId)
        {
            UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();
            UserEnrollmentEntity ObjUserEnrollmentEntity = new UserEnrollmentEntity();
            try
            {               
                ObjUserEnrollmentEntity = ObjUserEnrollmentDA.GetUserInformation(UserId, "GetById");

                txtFirstName.Value =Convert.ToString(ObjUserEnrollmentEntity.FirstName);
                txtLastname.Value = Convert.ToString(ObjUserEnrollmentEntity.LastName);
                txtDOB.Value = Convert.ToString(ObjUserEnrollmentEntity.DOB);
                txtFatherName.Value = Convert.ToString(ObjUserEnrollmentEntity.FatherName);
                txtMotherName.Value = Convert.ToString(ObjUserEnrollmentEntity.MotherName);
                txtSpouseName.Value = Convert.ToString(ObjUserEnrollmentEntity.SpouseName);                
                txtAddressOne.Value = Convert.ToString(ObjUserEnrollmentEntity.AddressOne);
                txtAddresstwo.Value = Convert.ToString(ObjUserEnrollmentEntity.AddressTwo);
                txtCity.Value = Convert.ToString(ObjUserEnrollmentEntity.City);
                txtState.Value = Convert.ToString(ObjUserEnrollmentEntity.State);
                txtPincode.Value = Convert.ToString(ObjUserEnrollmentEntity.Pincode);
                txtMobileNumber.Value = Convert.ToString(ObjUserEnrollmentEntity.PhoneNumber);
                txtEmergencyNumber.Value = Convert.ToString(ObjUserEnrollmentEntity.EmergencyNumber);
                txtEmail.Value = Convert.ToString(ObjUserEnrollmentEntity.EmailID);               
                txtDesignation.Value = Convert.ToString(ObjUserEnrollmentEntity.Designation);               
                txtQualification.Value = Convert.ToString(ObjUserEnrollmentEntity.Qualification);
                txtExperience.Value = Convert.ToString(ObjUserEnrollmentEntity.Experience);
                txtExperienceDetails.Value =Convert.ToString(ObjUserEnrollmentEntity.Experience_Details);

                for (int i = 0; i < ddlGender.Items.Count; i++)
                {
                    if (ddlGender.Items[i].Text.ToString() == ObjUserEnrollmentEntity.Gender.ToString())
                    {
                        ddlGender.Items[i].Selected = true;
                    }
                }
                for (int i = 0; i < ddlBloodgroup.Items.Count; i++)
                {
                    if (ddlBloodgroup.Items[i].Text.ToString() == ObjUserEnrollmentEntity.BloodGroup.ToString())
                    {
                        ddlBloodgroup.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlCategory.Items.Count; i++)
                {
                    if (ddlCategory.Items[i].Text.ToString() == ObjUserEnrollmentEntity.Category.ToString())
                    {
                        ddlCategory.Items[i].Selected = true;

                    }
                }
                for (int i = 0; i < ddlMaritalStatus.Items.Count; i++)
                {
                    if (ddlMaritalStatus.Items[i].Text.ToString() == ObjUserEnrollmentEntity.MaritalStatus.ToString())
                    {
                        ddlMaritalStatus.Items[i].Selected = true;

                    }
                }
                hdnGender.Value = Convert.ToString(ObjUserEnrollmentEntity.Gender);
                hdnBloodGroup.Value = Convert.ToString(ObjUserEnrollmentEntity.BloodGroup);
              //  hdnma.Value = Convert.ToString(ObjUserEnrollmentEntity.MaritalStatus);
                hdnNationality.Value = Convert.ToString(ObjUserEnrollmentEntity.Nationality);
                hdnDepartment.Value = Convert.ToString(ObjUserEnrollmentEntity.Department);
                hdnCategory.Value = Convert.ToString(ObjUserEnrollmentEntity.Category);
                btnSubmitDown.InnerText = "Update";
                btnSubmitUp.InnerText = "Update";


                StringBuilder strBuilder = new StringBuilder();
                for (int i = 0; i < ObjUserEnrollmentEntity.UserRoleEntity.Count; i++)
                {                    
                    strBuilder.Append("<tr id=rowCount" + ObjUserEnrollmentEntity.UserRoleEntity[i].Id + "><td><label>" + ObjUserEnrollmentEntity.UserRoleEntity[i].Id + "</label></td><td><label>" + ObjUserEnrollmentEntity.UserRoleEntity[i].RoleName + "</label></td><td> <a href=javascript:void(0); onclick=removeRow(" + ObjUserEnrollmentEntity.UserRoleEntity[i].Id +");><i class='fa fa-trash'></i></a></td></tr>");
                    if(i==0)
                    {
                        hdnRoleIDs.Value = ObjUserEnrollmentEntity.UserRoleEntity[i].Id.ToString();
                    }
                    else
                    {
                        hdnRoleIDs.Value = hdnRoleIDs.Value + "," + ObjUserEnrollmentEntity.UserRoleEntity[i].Id.ToString();
                    }
                }
                hdnRoleTable.Value = strBuilder.ToString();
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
            int UserID = 0;
            ViewState["RoleTable"] = hdnRoleTable.Value.ToString();
            bool iscredentialSent = Convert.ToBoolean(chkCredentialSend.Checked);
            UserEnrollmentDA ObjUserEnrollmentDA = new UserEnrollmentDA();
            UserEnrollmentEntity ObjUserEnrollmentEntity = new UserEnrollmentEntity();
            try
            {
                if (Mode == "Insert")
                {
                    ObjUserEnrollmentEntity.User_Id = 0;
                    ObjUserEnrollmentEntity.Mode = Mode;
                }
                else if (Mode == "Update")
                {
                    ObjUserEnrollmentEntity.User_Id = Convert.ToInt32(Request.QueryString["UserId"].ToString());
                    if (hdnIsRoleModified.Value.ToString() == "1")
                    {
                        ObjUserEnrollmentEntity.IsRoleModified = true;
                    }
                    else
                    {
                        ObjUserEnrollmentEntity.IsRoleModified = false;
                    }
                    ObjUserEnrollmentEntity.Mode = Mode;
                }
                ObjUserEnrollmentEntity.FirstName = txtFirstName.Value.Trim();
                ObjUserEnrollmentEntity.LastName = txtLastname.Value.Trim();
                ObjUserEnrollmentEntity.Gender = ddlGender.Items[ddlGender.SelectedIndex].Text.Trim();
                ObjUserEnrollmentEntity.DOB = txtDOB.Value.Trim();
                ObjUserEnrollmentEntity.BloodGroup = ddlBloodgroup.Items[ddlBloodgroup.SelectedIndex].Text.Trim();

                ObjUserEnrollmentEntity.MaritalStatus = ddlMaritalStatus.Items[ddlMaritalStatus.SelectedIndex].Text.Trim();
                ObjUserEnrollmentEntity.FatherName = txtFatherName.Value.Trim();
                ObjUserEnrollmentEntity.MotherName = txtMotherName.Value.Trim();
                ObjUserEnrollmentEntity.SpouseName = txtSpouseName.Value.Trim();
                ObjUserEnrollmentEntity.Nationality = Convert.ToInt32(hdnNationality.Value.Trim());
                ObjUserEnrollmentEntity.AddressOne = txtAddressOne.Value.Trim();
                ObjUserEnrollmentEntity.AddressTwo = txtAddresstwo.Value.Trim();
                ObjUserEnrollmentEntity.City = txtCity.Value.Trim();
                ObjUserEnrollmentEntity.State = txtState.Value.Trim();
                ObjUserEnrollmentEntity.Pincode = txtPincode.Value.Trim();
                ObjUserEnrollmentEntity.PhoneNumber = FormatPhoneNumber(txtMobileNumber.Value.Trim());
                ObjUserEnrollmentEntity.EmergencyNumber = FormatPhoneNumber(txtEmergencyNumber.Value.Trim());
                ObjUserEnrollmentEntity.EmailID = txtEmail.Value.Trim();
                ObjUserEnrollmentEntity.Department = Convert.ToString(hdnDepartment.Value.Trim());
                ObjUserEnrollmentEntity.Designation = txtDesignation.Value.Trim();
                ObjUserEnrollmentEntity.Category = ddlCategory.Items[ddlCategory.SelectedIndex].Text.Trim();
                ObjUserEnrollmentEntity.Qualification = txtQualification.Value.Trim();
                ObjUserEnrollmentEntity.Experience = txtExperience.Value.Trim();
                ObjUserEnrollmentEntity.Experience_Details = txtExperienceDetails.Value.Trim();
                ObjUserEnrollmentEntity.CreatedBy = Convert.ToInt32(Session["UserId"].ToString());
                ObjUserEnrollmentEntity.RoleMappingIds = hdnRoleIDs.Value.ToString();


                //Upload Image
                if (UploadImage.HasFile)
                {
                    int length = UploadImage.PostedFile.ContentLength;
                    if (length > 0)
                    {
                        ObjUserEnrollmentEntity.ProfileImage = UploadImage.FileBytes;
                    }
                }

                ObjUserEnrollmentDA.SetUserEnrollment(ObjUserEnrollmentEntity, out Status, out Message,out UserID);

                if (Status == true)
                {
                    if (Mode == "Insert")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Employee details saved successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                    }
                    if (Mode == "Update")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Employee details updated successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        Response.Redirect("../User/UserInfo.aspx?MenuID=8", false);
                    }
                    if (Mode == "Delete")
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Employee details deleted successfully", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        Response.Redirect("../User/UserInfo.aspx?MenuID=8", false);
                    }
                    ClearControl();
                }
                else if (Status == false)
                {
                    if (Message.Contains("Exists"))
                    {
                        if (Mode == "Insert" || Mode == "Update")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Employee details already exists", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                    else if (Message.Contains("Mapped"))
                    {
                        if (Mode == "Delete")
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Employee details mapped with another entity , Please check before you delete", 4);
                            this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        }
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error occurred, Please try again", 2);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

                    }
                    hdnRoleTable.Value = ViewState["RoleTable"].ToString();
                }
            }
            catch (Exception ex)
            {
                hdnRoleTable.Value = ViewState["RoleTable"].ToString();
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
            }
            finally
            {
                if (iscredentialSent && (Mode == "Insert") && Status && UserID>0)
                {
                    CommunicationChannelUtility Obj = new CommunicationChannelUtility();
                    Obj.SendCredentials(1, UserID, ObjUserEnrollmentEntity.CreatedBy);
                }
            }
        }

        public static string FormatPhoneNumber(string phone)
        {
            return digitsOnly.Replace(phone, "");
        }

        public void ClearControl()
        {
            txtFirstName.Value = string.Empty;
            txtLastname.Value = string.Empty;
            txtDOB.Value = string.Empty;
            ddlGender.SelectedIndex = 0;
            ddlBloodgroup.SelectedIndex = 0;
            ddlMaritalStatus.SelectedIndex = 0;
            txtFatherName.Value = string.Empty;
            txtMotherName.Value = string.Empty;
            txtSpouseName.Value = string.Empty;
            hdnNationality.Value = "19";
            txtAddressOne.Value = string.Empty;
            txtAddresstwo.Value = string.Empty;
            txtCity.Value = string.Empty;
            txtState.Value = string.Empty;
            txtPincode.Value = string.Empty;
            txtMobileNumber.Value = string.Empty;
            txtEmergencyNumber.Value = string.Empty;
            txtEmail.Value = string.Empty;
            hdnDepartment.Value ="0";
            txtDesignation.Value = string.Empty;
            ddlCategory.SelectedIndex = 0;
            txtQualification.Value = string.Empty;
            txtExperience.Value = string.Empty;
            txtExperienceDetails.Value = string.Empty;
            hdnRoleTable.Value = string.Empty;
            chkCredentialSend.Checked = false;
        }
    }
}