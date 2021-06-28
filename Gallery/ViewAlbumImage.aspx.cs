using DataAccessComponent.Gallery;
using EntityComponent.Gallery;
using ExceptionComponent;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ILogisticsApplication.Gallery
{
    public partial class ViewAlbumImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlAlbumData.Visible = false;
            pnlNoRecord.Visible = false;
            BindImageByAlbum();
        }
        public void BindImageByAlbum()
        {
            string AlbumId = Convert.ToString(Request.QueryString["Album_Id"]);
            List<GetImageByAlbum> lstGetImageByAlbum = new List<GetImageByAlbum>();
            ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();
            try
            {
                lstGetImageByAlbum = ObjImageHandlingDA.GetImageByAlbum("GetImageByAlbum", Convert.ToInt32(AlbumId), 0);
                if (lstGetImageByAlbum.Count > 0)
                {
                    pnlAlbumData.Visible = true;
                    pnlNoRecord.Visible = false;
                    lvAlbumGrid.DataSource = lstGetImageByAlbum;
                    lvAlbumGrid.DataBind();
                }
                else
                {
                    pnlAlbumData.Visible = false;
                    pnlNoRecord.Visible = true;
                }
            }
            catch (Exception Ex)
            {
                ExceptionLog.SetException(Ex.Message, "BindImageByAlbum", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
                pnlNoRecord.Visible = true;
            }
        }
        protected void lvAlbumName_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvAlbumGrid.FindControl("Pagination") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindImageByAlbum();
        }
    }
}