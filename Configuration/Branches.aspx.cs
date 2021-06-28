using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EntityComponent.MasterData;
using DataAccessComponent.MasterData;
using ThemeComponent;
namespace ILogisticsApplication.Configuration
{
    public partial class Branches : System.Web.UI.Page
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
            string branchName = txtBranchName.Value.Trim();
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
                BranchesDA objBranchesDA = new BranchesDA();
                objBranchesDA.SetBranchesDetails(branchName, Id, Mode, UserId, out Message, out status);
                
                if (Mode == "Insert")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch created successfully", 1);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                            ClearControls();
                            hdnMode.Value = string.Empty;
                            hdnId.Value = string.Empty;
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch already Exist", 4);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                    }
                }
                else if (Mode == "Update")
                {
                    if (status == true)
                    {
                        if (Message.Contains("Success"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch updated successfully", 1);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                            ClearControls();
                            hdnMode.Value = string.Empty;
                            hdnId.Value = string.Empty;
                        }
                    }
                    else
                    {
                        if (Message.Contains("Exist"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch already Exist", 4);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        if (Message.Contains("Exception"))
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                        else
                        {
                            DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
                            ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                        }
                    }
                }
                else if (Mode == "Delete")
                {
                    if (Message.Contains("Success"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch deleted successfully", 1);
                        ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                      
                    }
                    else if (Message.Contains("Mapped"))
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Branch Mapped with another entity so can not delete", 4);
                        ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);

                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
                        ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);
                    }
                    ClearControls();
                    hdnMode.Value = string.Empty;
                    hdnId.Value = string.Empty;
                }
            }
            catch (Exception ex)
            {
                DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(ex.Message, 2);
                ScriptManager.RegisterStartupScript(updatepanel, typeof(Page), "popupScript", DisplayMsg, false);

            }
            ScriptManager.RegisterStartupScript(this,this.GetType(), "popupScript", "<script language='javascript'>BindBranchesData();</script>", false);
        }

        public void ClearControls()
        {
            txtBranchName.Value = string.Empty;
        }
    }
}