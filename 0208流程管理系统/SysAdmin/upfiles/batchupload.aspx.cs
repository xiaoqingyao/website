using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.upfiles
{
    public partial class batchupload : AllPower.Web.Admin.AdminPage
    {
        #region 变量
        private string _upType = string.Empty;
        private string _extType = string.Empty;
        private string _controlMaxSize = string.Empty;
        private int MaxSize = 2097152;      //2M 1024*1024*2 允许上传最大文件大小

        UploadConfig uploadobj;  //上传设置信息
        string SavePath = ""; // 保存路径;
        string URL = "";      //上传文件域名
        string AllowExt = ""; //上传文件类型
        protected string jsExe = string.Empty;  //输出字符串

        protected int thumbWidth, thumbHeight; // 缩咯图的宽与高 修改人：吴岸标

        #endregion

        #region 属性

        private string UpType
        {
            get { return _upType; }
            set { _upType = value; }
        }

        private string ExtType
        {
            get { return _extType; }
            set { _extType = value; }
        }

        private string ControlMaxSize
        {
            get { return _controlMaxSize; }
            set { _controlMaxSize = value; }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            uploadobj = Upload.GetConfig(GetUploadImgPath);   //上传设置信息


            if (uploadobj.IsEnableUpload == "0")  //判断是否关闭上传功能
            {
                System.Web.HttpContext.Current.Response.Write("上传功能已关闭！");
                Response.End();
            }


            MaxSize = GetMaxSize(int.Parse(uploadobj.UploadImageSize));
            SavePath = uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
            AllowExt = GetExtType(uploadobj.UploadImageType);
            //URL = GetUploadUrl(uploadobj.ImageUrl, "Images", SavePath);
            SetThumbWH();
            lblObjectPath.Text = "单个文件不能大于" + (Math.Round(float.Parse(MaxSize.ToString()) / 1048576, 2)).ToString() + "M";
            lblObjectPath.Text = lblObjectPath.Text + "允许上传类型有：" + AllowExt;

        }
        #endregion

        #region 设置图片缩略图宽、高
        // 作者：吴岸标

        private void SetThumbWH()
        {
            thumbWidth = Utils.ParseInt(uploadobj.ThumbnailWidth, 125);
            thumbHeight = Utils.ParseInt(uploadobj.ThumbnailHeight, 125);

            if (Request.Cookies["HQB_UpFile_ThumbHW"] != null && Server.UrlDecode(Request.Cookies["HQB_UpFile_ThumbHW"].Value).Contains("$$")) // 上传窗口中设置
            {
                string[] thumbWH;

                thumbWH = Server.UrlDecode(Request.Cookies["HQB_UpFile_ThumbHW"].Value).Split(new string[] { "$$" }, StringSplitOptions.None);

                if (thumbWH.Length > 1 && !string.IsNullOrEmpty(thumbWH[0].Trim()) && !string.IsNullOrEmpty(thumbWH[1].Trim()))
                {
                    thumbWidth = Utils.ParseInt(thumbWH[0], thumbWidth);
                    thumbHeight = Utils.ParseInt(thumbWH[1], thumbHeight);
                }

            }

            txtThumbWidth.Value = thumbWidth.ToString();
            txtTumbHeight.Value = thumbHeight.ToString();
        }
        #endregion

        #region 得到上传文件URL
        private string GetUploadUrl(string strUrl, string fileDir, string setUploadPath)
        {
            string reUrl;
            if (string.IsNullOrEmpty(strUrl))
            {
                reUrl = GetVirtualPath + setUploadPath;
            }
            else
            {
                reUrl = strUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }
            return reUrl;

        }
        #endregion

        #region 得到上传文件限制大小
        private int GetMaxSize(int uploadSetSize)
        {
            int reSize = uploadSetSize;
            if (!Utils.StrIsNullOrEmpty(this.ControlMaxSize))
            {
                reSize = Utils.ParseInt(this.ControlMaxSize, uploadSetSize);
            }

            return reSize * 1024;
        }
        #endregion

        #region 得到上传文件限制类型
        private string GetExtType(string uploadSetExt)
        {
            string reExt = uploadSetExt;
            if (!Utils.StrIsNullOrEmpty(this.ExtType))
            {
                reExt = this.ExtType;
            }

            return reExt.ToLower();
        }
        #endregion

        #region 文件上传
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string msg = "";
            if (uploadobj.IsEnableUpload == "1")  // 判断是否允许上传
            {
                string noExt = SystemConst.NOT_ALLOWED_UPLOAD_TYPE;         // 不允许上传类型
                int num = Utils.ParseInt(Request.Form["hidNum"], 0);
                
                for (int i = 1; i <= num; i++)
                {
                    HttpPostedFile fil=Request.Files["file"+i];
                    if (!string.IsNullOrEmpty(fil.FileName))
                    {
                        if (fil.ContentLength > MaxSize)
                        {
                            msg += "文件" + i + "上传失败，原因是文件大小超过最大上传限制!<br>";
                            continue;
                        }
                        string fileName = Path.GetFileName(fil.FileName);
                        string fileExt = Path.GetExtension(fileName).ToLower();  //上传文件扩展名

                        if (AllowExt.IndexOf(fileExt.Replace(".", "")) == -1)
                        {
                            msg += "文件" + i + "上传失败，原因是文件类型不正确!<br>";
                            continue;
                        }

                        if (noExt.IndexOf(fileExt) != -1)
                        {
                            msg += "文件" + i + "上传失败，原因是文件类型“" + fileExt + "”的文件不允许上传!<br>";
                            continue;
                        }

                        if (SavePath.IndexOf(":") == -1)  //判断输入的是虚拟路径
                        {
                            SavePath = Server.MapPath(GetVirtualPath + SavePath);
                        }

                        SavePath = SavePath + "/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/";
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }

                        string saveName = DateTime.Now.ToString("yyyyMMddHHmmss");  // 上传文件名

                        fileName = SavePath + saveName + fileExt;
                        URL = DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + saveName + fileExt;

                        try
                        {
                            fil.SaveAs(fileName); //保存至服务器
                            DelFile();
                            if (this.UpType == "image" && uploadobj.IsEnableWatermark == "1") //如果上传图片，则判断是否需要打水印
                            {
                                ImageWatermark iwobj = new ImageWatermark(0, 0, fileName);
                                if (uploadobj.WatermarkType == "0") //水印为文字类型
                                {
                                    iwobj.Quality = 100;
                                    iwobj.Title = uploadobj.WatermarkText;
                                    iwobj.FontSize = int.Parse(uploadobj.WatermarkFontSize);
                                    switch (uploadobj.WatermarkFontStyle)
                                    {
                                        case "1":
                                            iwobj.StrStyle = FontStyle.Bold;
                                            break;
                                        case "2":
                                            iwobj.StrStyle = FontStyle.Italic;
                                            break;
                                        case "4":
                                            iwobj.StrStyle = FontStyle.Underline;
                                            break;
                                        case "8":
                                            iwobj.StrStyle = FontStyle.Strikeout;
                                            break;

                                    }
                                    iwobj.FontColor = ColorTranslator.FromHtml("#" + uploadobj.WatermarkFontColor);
                                    iwobj.BackGroudColor = Color.White;
                                    iwobj.FontFamilyName = uploadobj.WatermarkFontType;
                                    iwobj.Waterpos = uploadobj.WatermarkLocation;
                                    iwobj.FontBorderColor = ColorTranslator.FromHtml("#" + uploadobj.WatermarkFontBorderColor);
                                    iwobj.FontBorderSize = int.Parse(uploadobj.WatermarkFontBorder);

                                    iwobj.Watermark();
                                }
                                else
                                {
                                    iwobj.Waterpos = uploadobj.WatermarkLocation;
                                    //iwobj.Height = 100;
                                    //iwobj.Width = 100;
                                    iwobj.WaterPath = Server.MapPath("~/" + uploadobj.WatermarkPic);
                                    iwobj.WaterPicturemark();
                                }
                            }
                            if (Request.Form["chkIshumbnail"] == "1")  //判断是否上传的是否需生成缩略图
                            {
                                MakeThumbnail(fileName, fileName + ".gif", thumbWidth, thumbHeight, "HW");     // 生成缩略图方法

                            }
                        }
                        catch (Exception ex)
                        {
                            ex.ToString();
                        }
                    }



                    //if (controlType == "0")         // 将上传文件名加到下拉列表控件中
                    //{
                    //    jsExe = "<script type=\"text/javascript\">parent.document.getElementById(\"" + elementName + "\").options[parent.document.getElementById(\"" + elementName + "\").options.length] = new Option(\"" + URL + "\", \"" + URL + "\");parent.Closed();</script>";
                    //}
                    //else if (controlType == "2")    // 多文件自定义系统字段
                    //{
                    //    jsExe = "<script type=\"text/javascript\">parent.AddItemToMultiFile(\"" + URL + "\", \"" + elementName + "\", \"" + getSizeControl + "\", true);parent.Closed();</script>";
                    //}
                    //else                            // 将上传文件地址附加至文本框
                    //{
                    //    jsExe = "<script language='javascript'>parent.document.getElementById(\"" + elementName + "\").value=\"" + URL + "\";if(parent.document.getElementById(\"" + elementName + "_Del\") != null){parent.document.getElementById(\"" + elementName + "_Del\").disabled=false;};";

                    //    if (!string.IsNullOrEmpty(getSizeControl) && getSizeControl != "undefined")
                    //    {
                    //        jsExe += "parent.document.getElementById(\"" + getSizeControl + "\").value=\"" + txtFileUpload.FileContent.Length + "\";";
                    //    }
                    //    jsExe += "if(parent.document.getElementById(\"" + elementName + "_Look\") != null){parent.document.getElementById(\"" + elementName + "_Look\").disabled=false;}; parent.Closed();</script>";
                    //}
                }
            }
        }
        #endregion

        #region 删除原文件

        void DelFile()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pFile"]))
            {
                string filePath = Server.MapPath(Request.QueryString["pFile"]);
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                if (File.Exists(filePath + ".gif"))
                {
                    File.Delete(filePath + ".gif");
                }
            }
        }
        #endregion

        #region 生成缩略图

        /// <summary>
        /// 生成缩略图

        /// </summary>
        /// <param Name="originalImagePath">源图路径（物理路径）</param>
        /// <param Name="thumbnailPath">缩略图路径（物理路径）</param>
        /// <param Name="width">缩略图宽度</param>
        /// <param Name="height">缩略图高度</param>
        /// <param Name="mode">生成缩略图的方式</param>    
        public static void MakeThumbnail(string originalImagePath, string thumbnailPath, int width, int height, string mode)
        {
            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(originalImagePath);

            int towidth = width;
            int toheight = height;

            int x = 0;
            int y = 0;
            int ow = originalImage.Width;
            int oh = originalImage.Height;

            switch (mode)
            {
                case "HW"://指定高宽缩放（可能变形）                
                    break;
                case "W"://指定宽，高按比例                    
                    toheight = originalImage.Height * width / originalImage.Width;
                    break;
                case "H"://指定高，宽按比例
                    towidth = originalImage.Width * height / originalImage.Height;
                    break;
                case "Cut"://指定高宽裁减（不变形）                
                    if ((double)originalImage.Width / (double)originalImage.Height > (double)towidth / (double)toheight)
                    {
                        oh = originalImage.Height;
                        ow = originalImage.Height * towidth / toheight;
                        y = 0;
                        x = (originalImage.Width - ow) / 2;
                    }
                    else
                    {
                        ow = originalImage.Width;
                        oh = originalImage.Width * height / towidth;
                        x = 0;
                        y = (originalImage.Height - oh) / 2;
                    }
                    break;
                default:
                    break;
            }//新建一个bmp图片
            System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);

            //新建一个画板



            System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);

            //设置高质量插值法
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

            //设置高质量,低速度呈现平滑程度
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

            //清空画布并以透明背景色填充



            g.Clear(System.Drawing.Color.Transparent);

            //在指定位置并且按指定大小绘制原图片的指定部分
            g.DrawImage(originalImage, new System.Drawing.Rectangle(0, 0, towidth, toheight),
                new System.Drawing.Rectangle(x, y, ow, oh),
                System.Drawing.GraphicsUnit.Pixel);

            try
            {
                //以jpg格式保存缩略图



                bitmap.Save(thumbnailPath, System.Drawing.Imaging.ImageFormat.Jpeg);
            }
            catch (System.Exception e)
            {
                throw e;
            }
            finally
            {
                originalImage.Dispose();
                bitmap.Dispose();
                g.Dispose();
                // File.Delete(originalImagePath);//删除原图
            }
        }
        #endregion
    }
}
