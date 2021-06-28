using DataAccessComponent;
using DataAccessComponent.Gallery;
using DataAccessComponent.MasterData;
using EntityComponent.Gallery;
using EntityComponent.MasterData;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ILogisticsApplication.Gallery
{
    public partial class ManageAlbum : System.Web.UI.Page
    {
        string Message = string.Empty;
        bool Status = false;
        string DisplayMsg = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCourse();
                if (Request.QueryString["AlbumId"] != null)
                {
                    int Id =Convert.ToInt32(Request.QueryString["AlbumId"]);
                    BindAlbum(Id);
                }
            }            
        }
        public void BindAlbum(int Id)
        {
            List<ImageHandlingEntity> lstImageHandlingEntity = new List<ImageHandlingEntity>();
            ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();
            try
            {
                lstImageHandlingEntity = ObjImageHandlingDA.GetAlbumDetailsById("GetAlbumDetailsById", Id, Convert.ToInt64(Session["UserId"].ToString()));
                if (lstImageHandlingEntity != null)
                {
                    txtAlbumName.Value = lstImageHandlingEntity[0].Albumname;
                    txtDescription.Value = lstImageHandlingEntity[0].Description;
                    if (lstImageHandlingEntity[0].Target == "2")
                    {
                        for (int i = 0; i < ddlTargetCourse.Items.Count - 1; i++)
                        {
                            if (ddlTargetCourse.Items[i].Text.ToString() == lstImageHandlingEntity[0].Std.ToString())
                            {
                                ddlTargetCourse.Items[i].Selected = true;

                            }
                        }
                        BindSection(lstImageHandlingEntity[0].Std);
                        for (int i = 0; i < ddlSection.Items.Count - 1; i++)
                        {
                            if (ddlSection.Items[i].Text.ToString() == lstImageHandlingEntity[0].Section.ToString())
                            {
                                ddlSection.Items[i].Selected = true;
                            }
                        }

                        divSection.Style.Add("display", "block");
                    }
                    else
                    {
                        for (int i = 0; i < ddlTargetCourse.Items.Count - 1; i++)
                        {
                            if (ddlTargetCourse.Items[i].Text.ToString() == "All")
                            {
                                ddlTargetCourse.Items[i].Selected = true;

                            }
                        }
                    }
                    hdnId.Value =Convert.ToString(Id);
                    hdnMode.Value = "Update";
                    
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindAlbum", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }
        public void BindCourse()
        {
            try
            {
                List<CommonEntity> lstCommonEntity = new List<CommonEntity>();
                CommonDA ObjCommonDA = new CommonDA();
                lstCommonEntity = ObjCommonDA.BindDropdownList("GetCourse", null, 0);
                ddlTargetCourse.DataSource = lstCommonEntity;
                ddlTargetCourse.DataTextField = "Name";
                // ddlCourse.DataValueField = "Id";
                ddlTargetCourse.DataBind();
                ddlTargetCourse.Items.Insert(0, new ListItem("--Select Course--", "0"));
                ddlTargetCourse.Items.Insert(1, new ListItem("All", "All"));
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
            ddlSection.Items.Insert(1, new ListItem("All", "1000"));
        }
        //protected void btnSubmit_ServerClick(object sender, EventArgs e)
        //{
        //    ImageHandlingEntity ObjImageHandlingEntity = new ImageHandlingEntity();
        //    ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();
        //    int AlbumId=0;
        //    try
        //    {
        //        ObjImageHandlingEntity.Albumname=txtAlbumName.Value.Trim();
        //        ObjImageHandlingEntity.Description=txtDescription.Value.Trim();
        //        if (ddlTargetCourse.SelectedItem.Value == "All")
        //        {
        //            ObjImageHandlingEntity.Target = "1";
        //            ObjImageHandlingEntity.Std = null;
        //            ObjImageHandlingEntity.Section = null;
        //        }
        //        else
        //        {
        //            ObjImageHandlingEntity.Target = "2";
        //            ObjImageHandlingEntity.Std = ddlTargetCourse.SelectedItem.Value.Trim();
        //            ObjImageHandlingEntity.Section = hdnSection.Value.Trim();
        //        }
        //        if (string.IsNullOrEmpty(hdnId.Value))
        //        {
        //            ObjImageHandlingEntity.Mode = "Insert";
        //        }
        //        else
        //        {
        //            ObjImageHandlingEntity.Mode = "Update";
        //        }

        //        ObjImageHandlingEntity.CreatedBy =Convert.ToInt32(Session["UserId"].ToString());
        //        ObjImageHandlingDA.SetAlbumDetails(ObjImageHandlingEntity, out AlbumId, out Message, out Status);
                
        //        if (ObjImageHandlingEntity.Mode == "Insert")
        //        {
        //            if (Status == true)
        //            {
        //                if (Message.Contains("Success"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Album saved successfully", 1);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                hAlbumName.InnerText = txtAlbumName.Value.Trim();
        //                hdnId.Value = Convert.ToString(AlbumId);
        //                pnlAlbumCreate.Visible = false;
        //                pnlImageUpload.Visible = true;
        //                ClearData();
        //            }
        //            else
        //            {
        //                if (Message.Contains("Exist"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Album already Exist", 4);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                if (Message.Contains("Exception"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                else
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //            }
        //        }
        //        else if (ObjImageHandlingEntity.Mode == "Update")
        //        {
        //            if (Status == true)
        //            {
        //                if (Message.Contains("Success"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Album updated successfully", 1);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                ClearData();
        //            }
        //            else
        //            {
        //                if (Message.Contains("Exist"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Album already Exist", 4);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                if (Message.Contains("Exception"))
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Message, 2);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //                else
        //                {
        //                    DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage("Error Occured Please try again", 2);
        //                    ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception Ex)
        //    {
        //        DisplayMsg = ThemeComponent.DisplayTheme.DisplayMessage(Ex.Message, 2);
        //        ScriptManager.RegisterStartupScript(updatePanel, typeof(Page), "popupScript", DisplayMsg, false);
        //    }
        //}

        //public void ClearData()
        //{
        //    txtAlbumName.Value = string.Empty;
        //    txtDescription.Value = string.Empty;
        //    ddlTargetCourse.ClearSelection();
        //    ddlSection.Items.Clear();
        //    ddlSection.Items.Insert(0, new ListItem("--Select Section--", "0"));
        //}
    }
}