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
    public partial class ViewAlbum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindAlbum();
        }
        public void BindAlbum()
        {
            List<GetAlbumEntity> lstGetAlbumEntity = new List<GetAlbumEntity>();
            ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();
            try
            {
                lstGetAlbumEntity = ObjImageHandlingDA.GetAlbumDetails("GetAlbum", Convert.ToInt32(Session["RoleId"].ToString()), Convert.ToInt64(Session["UserId"].ToString()));
                lvAlbumGrid.DataSource = lstGetAlbumEntity;
                lvAlbumGrid.DataBind();
                if (Convert.ToInt32(Session["RoleId"].ToString()) != 1)
                {
                    lvAlbumGrid.InsertItem.Visible = false;
                }
            }
            catch (Exception Ex) 
            {
                ExceptionLog.SetException(Ex.Message, "BindAlbum", Ex.Source, Convert.ToString(System.Web.HttpContext.Current.Request.Url.AbsolutePath));
            }
        }
     
        protected void lvAlbumName_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvAlbumGrid.FindControl("Pagination") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.BindAlbum();
        }
    }
}