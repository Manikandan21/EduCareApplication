using DataAccessComponent.MasterData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessComponent;
namespace ILogisticsApplication.Configuration
{
    public partial class Department : System.Web.UI.Page
    {
        bool status = false;
        string Message = string.Empty;
        string DisplayMsg = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
         protected void Save_Click(object sender, EventArgs e)
        {
            Save();
        }

         public void Save()
         {
             string Department = txtDepartment.Value.Trim();
             string Description = txtDescription.Value.Trim();
             int UserId = Convert.ToInt32(Session["UserId"].ToString());
             string Mode = string.Empty;
             int Id = 0;
             try
             {
                 if (hdnMode.Value == "")
                 {
                     Mode = "Insert";
                 }
                 else
                 {
                     Mode = hdnMode.Value;
                     Id = Convert.ToInt32(hdnId.Value);
                 }
                 DepartmentDA ObjDepartmentDA = new DepartmentDA();
                 ObjDepartmentDA.SetDepartmentDetails(Department, Description, Id, Mode, UserId, out Message, out status);

                 if (Mode == "Insert")
                 {
                     if (status == true)
                     {
                         if (Message.Contains("Success"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department saved successfully", 1);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                             ClearControls();
                         }
                         hdnMode.Value = string.Empty;
                         hdnId.Value = string.Empty;
                     }
                     else
                     {
                         if (Message.Contains("Exist"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department already Exist", 4);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                         if (Message.Contains("Exception"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                         else
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                     }
                 }
                 else if (Mode == "Update")
                 {
                     if (status == true)
                     {
                         if (Message.Contains("Success"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department updated successfully", 1);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                             ClearControls();
                         }
                         hdnMode.Value = string.Empty;
                         hdnId.Value = string.Empty;
                     }
                     else
                     {
                         if (Message.Contains("Exist"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department already Exist", 4);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                         if (Message.Contains("Exception"))
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                         else
                         {
                             DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                             this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         }
                     }
                 }
                 else if (Mode == "Delete")
                 {
                     if (Message.Contains("Success"))
                     {
                         DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department deleted successfully", 1);
                         this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                         ClearControls();
                         hdnMode.Value = string.Empty;
                         hdnId.Value = string.Empty;
                     }
                     else if (Message.Contains("Mapped"))
                     {
                         DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Department Mapped with user profile. Please be sure before proceeding to Delete", 4);
                         this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                     }
                 }
             }
             catch (Exception ex)
             {
                 DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                 this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);

             }
            
         }
         public void ClearControls()
         {
             txtDepartment.Value = string.Empty;
             txtDescription.Value = string.Empty;
         }
    }
   
}