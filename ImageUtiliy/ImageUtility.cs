using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace ILogisticsApplication.ImageUtiliy
{
    public class ImageUtility
    {
        public static byte[] ImageResize(byte[] Images)
        {
            byte[] ByteArray = Images;
            double scale = 1f;
            MemoryStream ms = new MemoryStream(Images);
            Image FullSizeImage = Image.FromStream(ms);
            while (ByteArray.Length >= 524288)
            {
                Bitmap fullSizeBitMap = new Bitmap(FullSizeImage, new Size((int)(FullSizeImage.Width * scale), (int)(FullSizeImage.Height * scale)));
                Graphics g = Graphics.FromImage(fullSizeBitMap);
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                g.SmoothingMode = SmoothingMode.HighQuality;
                g.PixelOffsetMode = PixelOffsetMode.HighQuality;
                g.CompositingQuality = CompositingQuality.HighQuality;
                MemoryStream MemoryStrm = new MemoryStream();
                fullSizeBitMap.Save(MemoryStrm, FullSizeImage.RawFormat);
                ByteArray = MemoryStrm.ToArray();
                MemoryStrm.Dispose();
                MemoryStrm.Close();
                scale -= 0.05f;
            }
            return ByteArray;
        }

        public static Byte[] returnImageResize(byte[] image)
        {
            byte[] bmpBytes;
            Byte[] bytes = image;
            Stream str = new MemoryStream(bytes);
            int thumbnailSize = 150;
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
                    target.Save(ms, ImageFormat.Png);
                    byte[] bmpByte = ms.GetBuffer();
                    target.Dispose();
                    ms.Close();
                    bmpBytes = bmpByte;
                }
            }
            return bmpBytes;
        }
    }
}