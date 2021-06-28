using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DataAccessComponent.MasterData;
using System.Web.SessionState;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for UserProfileImg
    /// </summary>
    public class UserProfileImg : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string SessionID = context.Request.QueryString["UserID"];
            if (SessionID != null)
            {
                MasterDA Obj = new MasterDA();
                byte[] bytes = Obj.GetUserThumb(Convert.ToBoolean(context.Session["IsAdminRole"]), Convert.ToInt32(context.Session["UserId"]));
                if (bytes != null && bytes.Count()>0)
                {
                    Stream str = new MemoryStream(bytes);
                    int thumbnailSize = 48;
                    Bitmap bmp = new Bitmap(str);
                    int width, height;
                    if (bmp.Width > bmp.Height)
                    {
                        width = thumbnailSize * bmp.Width / bmp.Height;
                        height = thumbnailSize;
                    }
                    else
                    {
                        width = thumbnailSize;
                        height = thumbnailSize * bmp.Height / bmp.Width;
                    }
                    Bitmap target = new Bitmap(thumbnailSize, thumbnailSize);
                    using (Graphics graphics = Graphics.FromImage(target))
                    {
                        graphics.CompositingQuality = CompositingQuality.HighSpeed;
                        graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphics.CompositingMode = CompositingMode.SourceCopy;
                        graphics.DrawImage(bmp, (thumbnailSize - width) / 2, (thumbnailSize - height) / 2, width, height);
                        using (MemoryStream ms = new MemoryStream())
                        {
                            target.Save(ms, ImageFormat.Jpeg);
                            ms.WriteTo(context.Response.OutputStream);
                        }
                    }
                }
                
                //context.Response.Clear();
                //context.Response.AddHeader("Content-Disposition", "Attachment;filename=image.png");
                //context.Response.AddHeader("content-Length", bytes.Length.ToString());
                //context.Response.ContentType = "application/octet-stream";
                //context.Response.BinaryWrite(bytes);
                //context.Response.End();
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