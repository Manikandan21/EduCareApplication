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
    public partial class RoleMenuMapping : System.Web.UI.Page
    {
        string DisplayMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Role_Change(object sender, EventArgs e)
        {
            try
            {
                int roleId = hdnRoleValue.Value == "" ? 0 : Convert.ToInt32(hdnRoleValue.Value);
                lblMsg.Text = "Currently you are working on <b style=\"color:red\">" + hdnRoleText.Value.ToUpper() + "</b> role.";
                List<MenuListDetails> lstMenuListDetails = new List<MenuListDetails>();
                MasterDataAccessComponent ObjMasterDataAccessComponent = new MasterDataAccessComponent();
                lstMenuListDetails = ObjMasterDataAccessComponent.GetMenuMapping(roleId).ToList();
                //hdnRoleValue.Value = "";
                LoadtreeView(lstMenuListDetails);
                btnSubmitUp.Attributes.Add("style", "display:block");
            }
            catch (Exception Ex)
            {
                string Msg = ExceptionLog.SetException(Ex.Message, "Role_Change", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtSave = new DataTable();
                dtSave.Columns.Add("Roles_Id", typeof(Int32));
                dtSave.Columns.Add("Menu_Id", typeof(Int32));
                dtSave.Columns.Add("AccessId", typeof(Int32));
                dtSave.Columns.Add("IsActive", typeof(Int32));

                int roleId = hdnRoleValue.Value == "" ? 0 : Convert.ToInt32(hdnRoleValue.Value);
                int accessID;
                int menuid;
                string parentMenuID;

                TreeNodeCollection TNodes = TreeView1.Nodes;
                foreach(TreeNode node in TNodes)
                {
                    if (node.Checked)
                    {
                        DataRow drNew = null;
                        if (node.ChildNodes.Count > 0)
                        {
                            accessID = 0;
                            menuid = Convert.ToInt32(node.Value);
                            parentMenuID = node.Text.Split('-')[1].TrimEnd(')').ToString();

                            if (dtSave != null && dtSave.Rows.Count > 0 && !string.IsNullOrEmpty(parentMenuID))
                            {
                                DataRow[] drRootMenu = dtSave.Select("Menu_Id='" + parentMenuID + "'");
                                if (drRootMenu != null &&  drRootMenu.Length == 0)
                                {
                                    drNew = dtSave.NewRow();
                                    drNew["Roles_Id"] = roleId;
                                    drNew["Menu_Id"] = Convert.ToInt32(parentMenuID); ;
                                    drNew["AccessId"] = accessID;
                                    drNew["IsActive"] = 1;
                                    dtSave.Rows.Add(drNew);
                                }
                            }
                            else if (dtSave != null && dtSave.Rows.Count == 0 && !string.IsNullOrEmpty(parentMenuID))
                            {
                                drNew = dtSave.NewRow();
                                drNew["Roles_Id"] = roleId;
                                drNew["Menu_Id"] = Convert.ToInt32(parentMenuID); ;
                                drNew["AccessId"] = accessID;
                                drNew["IsActive"] = 1;
                                dtSave.Rows.Add(drNew);
                            }
                            drNew = dtSave.NewRow();
                            drNew["Roles_Id"] = roleId;
                            drNew["Menu_Id"] = menuid;
                            drNew["AccessId"] = accessID;
                            drNew["IsActive"] = 1;
                            dtSave.Rows.Add(drNew);

                            foreach (TreeNode tchild in node.ChildNodes)
                            {
                                drNew = dtSave.NewRow();
                                if (tchild.Checked)
                                {
                                    drNew["Roles_Id"] = roleId;
                                    drNew["Menu_Id"] = Convert.ToInt32(tchild.Parent.Value);
                                    drNew["AccessId"] = Convert.ToInt32(tchild.Value);
                                    drNew["IsActive"] = 1;
                                    dtSave.Rows.Add(drNew);
                                }
                            }
                        }
                        else
                        {
                            parentMenuID = node.Text.Split('-')[1].TrimEnd(')').ToString();

                            if (dtSave != null && dtSave.Rows.Count > 0 && !string.IsNullOrEmpty(parentMenuID))
                            {
                                DataRow[] drRootMenu = dtSave.Select("'Menu_Id" + parentMenuID + "'");
                                if (drRootMenu != null && drRootMenu.Length == 0)
                                {
                                    drNew = dtSave.NewRow();
                                    drNew["Roles_Id"] = roleId;
                                    drNew["Menu_Id"] = Convert.ToInt32(parentMenuID); ;
                                    drNew["AccessId"] = 0;
                                    drNew["IsActive"] = 1;
                                    dtSave.Rows.Add(drNew);
                                }
                            }
                            else if (dtSave != null && dtSave.Rows.Count == 0 && !string.IsNullOrEmpty(parentMenuID))
                            {
                                drNew = dtSave.NewRow();
                                drNew["Roles_Id"] = roleId;
                                drNew["Menu_Id"] = Convert.ToInt32(parentMenuID); ;
                                drNew["AccessId"] = 0;
                                drNew["IsActive"] = 1;
                                dtSave.Rows.Add(drNew);
                            }
                            drNew = dtSave.NewRow();
                            drNew["Roles_Id"] = roleId;
                            drNew["Menu_Id"] = Convert.ToInt32(node.Value);
                            drNew["AccessId"] = 0;
                            drNew["IsActive"] = 1;
                            dtSave.Rows.Add(drNew);
                        }
                        
                    }
                    
                }
                if (dtSave != null && dtSave.Rows.Count > 0)
                {
                    MasterDataAccessComponent ObjMasterDataAccessComponent = new MasterDataAccessComponent();
                    int ISsavedsuccess = ObjMasterDataAccessComponent.SaveMenuMApping(dtSave, roleId);
                    if (ISsavedsuccess == 1)
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data saved successfully.", 1);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert(Data saved successfully.", true);
                    }
                    else
                    {
                        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Data not saved successfully.", 2);
                        this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert(Data not saved successfully.", true);
                    }
                }
                else
                {
                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Please select any menu to map this role.", 4);
                    this.Page.ClientScript.RegisterStartupScript(typeof(Page), "popupScript", DisplayMsg);
                }
            }
            catch (Exception Ex)
            {
                string Msg = ExceptionLog.SetException(Ex.Message, "Save_Click", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }

        private void LoadtreeView(List<MenuListDetails> LoadData)
        {
            try
            {
                if (LoadData != null && LoadData.Count > 0)
                {
                    List<MenuListDetails> lstParent = LoadData.Where(x => x.ParentMenu == 0).ToList();
                    if (lstParent != null && lstParent.Count > 0)
                    {
                        TreeView1.Nodes.Clear();
                        foreach (var lstParentData in lstParent)
                        {
                            TreeNode tParent = new TreeNode
                            {
                                Text = lstParentData.MenuName.ToString(),
                                Value = lstParentData.MenuId.ToString(),
                                Checked = Convert.ToBoolean(lstParentData.IsActive)
                            };
                            TreeView1.Nodes.Add(tParent);

                            List<MenuListDetails> lstChild = LoadData.Where(m => m.ParentMenu == lstParentData.MenuId).ToList();
                            if (lstChild != null && lstChild.Count > 0)
                            {
                                foreach (var lstchildData in lstChild)
                                {
                                    TreeNode tchild = new TreeNode
                                    {
                                        Text = lstchildData.MenuName.ToString(),
                                        Value = lstchildData.MenuId.ToString(),
                                        Checked = Convert.ToBoolean(lstchildData.IsActive)
                                    };
                                    tParent.ChildNodes.Add(tchild);
                                }
                            }
                        }                        
                    }
                }
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
        }
    }
}