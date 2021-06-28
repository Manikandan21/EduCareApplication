using DataAccessComponent.Gallery;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for DownloadImage
    /// </summary>
    public class DownloadImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();
            if (Mode == "Download")
            {
                Byte[] bytes;
                int ImageId = Convert.ToInt32(context.Request.QueryString["ImageId"]);
                bytes = ObjImageHandlingDA.GetAlbumThumb("GetImageById", ImageId, Convert.ToInt64(context.Request.QueryString["UserId"]));

                context.Response.AddHeader("Content-Disposition", "attachment; filename=" + (DateTime.Now.ToString("ddMMyyyyHHmmss"))+".jpeg");
                context.Response.AddHeader("Content-Length", bytes.Length.ToString());
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(bytes);
                context.Response.End();
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}