using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ILogisticsApplication.ImageUtiliy;
using System.Web.SessionState;
using DataAccessComponent.Gallery;
using EntityComponent.Gallery;
using Newtonsoft.Json;
using System.IO;
namespace ILogisticsApplication.Handlers
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler, IRequiresSessionState
    {
        string Mode = string.Empty;
        int Id = 0;
        string ResultString = string.Empty;
        string Message = string.Empty;
        bool Status = false;
        Byte[] ThumbByte = null;
        public void ProcessRequest(HttpContext context)
        {
            Mode = Convert.ToString(context.Request.QueryString["Mode"]);
            Id = Convert.ToInt32(context.Request.QueryString["Id"]);
            ImageHandlingEntity ObjImageHandlingEntity = new ImageHandlingEntity();
            GalleryImageEntity ObjGalleryImageEntity = new GalleryImageEntity();
            ImageHandlingDA ObjImageHandlingDA = new ImageHandlingDA();

            if (context.Session != null)
            {
                if (Mode == "AlbumCreate")
                {
                    int AlbumId = 0;
                    string Message = string.Empty;
                    bool Status = false;
                    ObjImageHandlingEntity.Albumname = Convert.ToString(context.Request.QueryString["Name"]);
                    ObjImageHandlingEntity.Description = Convert.ToString(context.Request.QueryString["Desc"]);
                    if (Convert.ToString(context.Request.QueryString["target"]) == "1")
                    {
                        ObjImageHandlingEntity.Target = "1";
                        ObjImageHandlingEntity.Std = null;
                        ObjImageHandlingEntity.Section = null;
                    }
                    else
                    {
                        ObjImageHandlingEntity.Target = "2";
                        ObjImageHandlingEntity.Std = Convert.ToString(context.Request.QueryString["Course"]);
                        ObjImageHandlingEntity.Section = Convert.ToString(context.Request.QueryString["Section"]);
                    }
                    if (Id == 0)
                    {
                        ObjImageHandlingEntity.Mode = "Insert";
                    }
                    else
                    {
                        ObjImageHandlingEntity.Mode = "Update";
                        ObjImageHandlingEntity.AlbumId = Id;
                    }
                    ObjImageHandlingEntity.CreatedBy = Convert.ToInt32(context.Request.QueryString["UserId"]);
                    ObjImageHandlingDA.SetAlbumDetails(ObjImageHandlingEntity, out AlbumId, out Message, out Status);
                    AlbumOutputEntity ObjAlbumOutputEntity = new AlbumOutputEntity();
                    ObjAlbumOutputEntity.AlbumId = AlbumId;
                    ObjAlbumOutputEntity.Message = Message;
                    ObjAlbumOutputEntity.Status = Status;
                    var Json = JsonConvert.SerializeObject(ObjAlbumOutputEntity);
                    ResultString = Json;
                }
                else if (Mode == "Upload")
                {
                    HttpPostedFile fileToUpload = context.Request.Files["Filedata"];
                    byte[] bytes = new byte[fileToUpload.ContentLength];
                    fileToUpload.InputStream.Read(bytes, 0, fileToUpload.ContentLength);
                    ObjGalleryImageEntity.AlbumId = Id;
                    string ImageName = fileToUpload.FileName;
                    string[] Image = ImageName.Split('.');
                    ObjGalleryImageEntity.ImageName = Image[0].ToString();
                    ObjGalleryImageEntity.FileType = Image[1].ToString();
                    ObjGalleryImageEntity.Size = Convert.ToString(bytes.Length);
                    ObjGalleryImageEntity.Data = bytes;
                    ObjGalleryImageEntity.CreatedBy = Convert.ToInt32(context.Request.QueryString["UserId"]);
                    ObjGalleryImageEntity.Mode = "Insert";
                    if (bytes.Length >= 524288)
                    {
                        bytes = ImageUtility.ImageResize(bytes);
                    }
                    ObjImageHandlingDA.SetGalleryDetails(ObjGalleryImageEntity, out Message, out Status);
                    if (Status)
                    {
                        ResultString = Message;
                    }
                    else
                    {
                        ResultString = "Error";
                    }
                }
                else if (Mode == "AlbumThumb")
                {
                    Byte[] bytes;
                    bytes = ObjImageHandlingDA.GetAlbumThumb("GetImageByAlbumThumb", Id, 0);
                    if (bytes != null)
                    {
                        byte[] ImageData = ImageUtility.returnImageResize(bytes);
                        ThumbByte = ImageData;
                    }

                }
                else if (Mode == "ViewImageThumb")
                {
                    Byte[] bytes;
                    bytes = ObjImageHandlingDA.GetAlbumThumb("GetImageByAlbum", Id, 0);
                    if (bytes != null)
                    {
                        byte[] ImageData = ImageUtility.returnImageResize(bytes);
                        ThumbByte = ImageData;
                    }

                }
                else if (Mode == "GetImageByIdThumb")
                {
                    Byte[] bytes;
                    bytes = ObjImageHandlingDA.GetAlbumThumb("GetImageById", Id, 0);
                    if (bytes != null)
                    {
                        byte[] ImageData = ImageUtility.returnImageResize(bytes);
                        ThumbByte = ImageData;
                    }

                }
                else if (Mode == "ViewImageByIdThumb")
                {
                    Byte[] bytes;
                    bytes = ObjImageHandlingDA.GetAlbumThumb("GetImageById", Id, 0);
                    if (bytes != null)
                    {
                        byte[] ImageData = bytes;
                        ThumbByte = ImageData;
                    }

                }
                else if (Mode == "AlbumInfo")
                {
                    int AlbumId = Convert.ToInt32(context.Request.QueryString["AlbumId"]);
                    long ImageId = Convert.ToInt32(context.Request.QueryString["ImageId"]);
                    string Type = context.Request.QueryString["Type"];
                    List<AlbumInfo> lstAlbumInfo = new List<AlbumInfo>();
                    lstAlbumInfo = ObjImageHandlingDA.GetAlbumInfo(Type, AlbumId, ImageId);

                    var Json = JsonConvert.SerializeObject(lstAlbumInfo);
                    ResultString = Json;
                }
                else if (Mode == "AlbumDelete")
                {
                    int AlbumId = Convert.ToInt32(context.Request.QueryString["AlbumId"]);
                    long ImageId = Convert.ToInt32(context.Request.QueryString["ImageId"]);
                    string Type = context.Request.QueryString["Type"];
                    List<AlbumInfo> lstAlbumInfo = new List<AlbumInfo>();
                    ResultString = ObjImageHandlingDA.SetAlbumDelete(AlbumId, ImageId, Type, Convert.ToInt32(context.Request.QueryString["UserId"]));
                }
            }
            else
            {
                ResultString = "Session Expired";
            }
            if (Mode.Contains("Thumb") && ThumbByte != null)
            {
                context.Response.BinaryWrite(ThumbByte);
            }
            else
            {
                context.Response.Write(ResultString);
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