

using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Drawing;

using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.upfiles
{
    public partial class ckeditorupload : AllPower.Web.Admin.AdminPage
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
            this.UpType = Request.QueryString["UpType"].ToLower();  //上传类型
            this.ExtType = Request.QueryString["ExtType"];            //用户设置允许上传文件类型
            this.ControlMaxSize = Request.QueryString["MaxSize"];      //用户设置允许最大上传文件大小

            tr3.Visible = false;
            if (uploadobj.IsEnableUpload == "0")  //判断是否关闭上传功能
            {
                span1.Visible = false;
                span2.Visible = true;
                return;
            }

            switch (this.UpType)
            {
                case "media"://视频，flash
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadMediaSize));
                    SavePath = uploadobj.MediaSavePath+"/" +SiteDir + "/Medias";
                    AllowExt = GetExtType(uploadobj.UploadMediaType + "|pdf");
                    URL = GetUploadUrl(uploadobj.MediaUrl,"Medias",SavePath );
                    break;

                case "file"://文件
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadFilesSize));
                    SavePath = uploadobj.FileSavePath + "/" + SiteDir + "/Files";
                    AllowExt = GetExtType(uploadobj.UploadFilesType+"|pdf");
                    URL = GetUploadUrl(uploadobj.FileUrl, "Files", SavePath);
                    break;

                case "image"://图片
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadImageSize));
                    SavePath = uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
                    AllowExt = GetExtType(uploadobj.UploadImageType + "|pdf");
                    URL = GetUploadUrl(uploadobj.ImageUrl, "Images", SavePath);
                    tr3.Visible = true;
                    break;

                case "flash"://flash
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadMediaSize));
                    SavePath = uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                    AllowExt = "swf|fla";
                    URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", SavePath);
                    break;
                default:
                    break;
            }

            if (!Page.IsPostBack)
            {
                spanSize.InnerHtml = (Math.Round (float.Parse (MaxSize.ToString ()) / 1048576,2)).ToString();
                this.lblMessage.Text = Utils.GetResourcesValue("Common","UploadMsg") + AllowExt;
                UploadFiles();
            }
        }
        #endregion

        #region 得到上传文件URL
        private string GetUploadUrl(string strUrl,string fileDir,string setUploadPath)
        {
            string reUrl;
            if (string.IsNullOrEmpty(strUrl))
            {
                reUrl = GetVirtualPath + setUploadPath;
            }
            else
            {
                reUrl = strUrl ;
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

            return reExt.ToLower ();
        }
        #endregion

        #region 文件上传
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            UploadFiles();
        }

        void UploadFiles()
        {
            if (uploadobj.IsEnableUpload == "1")  //判断是否允许上传
            {
                HttpPostedFile file = Request.Files["upload"];

                if (file.ContentLength>0)
                {
                    #region 变量
                    string formName = Request.QueryString["FormName"];  //表单名称
                    string elementName = Request.QueryString["ElementName"];  //控件名称
                    string saveType = Request.QueryString["SaveType"];  //保存文件名类型，1=用上传文件名保存，否则用系统时间重命名保存

                    string controlType = Request.QueryString["ControlType"];                  //控件类型，0=select,其他为input;

                    string noExt = SystemConst.NOT_ALLOWED_UPLOAD_TYPE; //不允许上传类型

                    string fileName = string.Empty;                             //文件名

                    string saveName = DateTime.Now.ToString("yyyyMMddHHmmss");  //上传文件名

                    string reFilePath = URL; //返回文件路径,如果保存路径填写的是绝对地址，则返回文件路径为域名+系统创建路径，如果为相对地址，则为：域名+相对路径+系统创建路径
                    string jsExe = string.Empty;  //输出字符串

                    string fileExt = string.Empty; //上传文件扩展名


                    fileName = Path.GetFileName(file.FileName).Trim ();
                    fileExt = Path.GetExtension(fileName).ToLower();  //上传文件扩展名

                    #endregion

                    if (file.ContentLength > MaxSize)
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadErr1") + Math.Round(float.Parse(MaxSize.ToString()) / 1048576, 2) + "M!');</script>");
                        return;
                    }

                    if (SavePath.IndexOf(":") == -1)  //判断输入的是虚拟路径
                    {
                        SavePath = Server.MapPath(GetVirtualPath + SavePath);
                    }

                    if (AllowExt.IndexOf(fileExt.Replace(".", "")) == -1)
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadExtErr") + "!');</script>");
                        return;
                    }

                    if (noExt.IndexOf(fileExt) != -1)
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadExtErr1") + "!');</script>");
                        return;
                    }

                    SavePath = SavePath + "/" + DateTime.Now.Year + "/" + DateTime.Now.Month + "/";
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }

                    if (saveType == "1")  //使用原文件名进行保存到服务器
                    {
                        int fileNameLength = fileName.LastIndexOf(".");
                        saveName = fileName.Substring(0, fileNameLength);
                    }

                    fileName = SavePath + saveName + fileExt;
                    URL = URL + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + saveName + fileExt;
                    if (File.Exists(fileName) && saveType == "1")
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script language=\"javascript\">alert('" + Utils.GetResourcesValue("Common", "UploadFileExistErr") + "!');</script>");
                        return;
                    }

                    try
                    {
                        file.SaveAs(fileName); //保存至服务器
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
                            MakeThumbnail(fileName, fileName + ".gif", int.Parse(uploadobj.ThumbnailWidth), int.Parse(uploadobj.ThumbnailHeight), "HW");     // 生成缩略图方法

                        }
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }


                    if (controlType == "0")  //将上传文件名加到下拉列表控件中

                    {
                        jsExe = "<script language='javascript'>var newOpt=window.opener.document.createElement(\"option\");newOpt.text=\"" + saveName + fileExt + "\";newOpt.value=\"" + URL + "\";newOpt.selected=true;  window.opener.document.all." + elementName + ".options.add(newOpt); self.close();</script>";
                    }
                    else if (controlType == "-1")  //用showModalDialog打开上传文件，ckeditor编辑器上传用此方法

                    {
                        jsExe = "<script language='javascript'>window.returnValue='" + URL + "';window.close();</script>";
                    }
                    else if (controlType == "-2")
                    {
                        jsExe = "<script language='javascript'>window.parent.CKEDITOR.tools.callFunction(" + Request.QueryString["CKEditorFuncNum"] + ",'" + URL + "','') ;</script>";
                    }
                    else
                    {
                        jsExe = "<script language='javascript'>tmp=eval(\"opener." + formName + "." + elementName + "\");tmp.value='" + URL + "';tmp=eval(\"opener." + formName + "." + elementName + "_Del\");if(tmp){tmp.disabled=false;};";

                        if (Request.QueryString["GetSizeControl"] != null && Request.QueryString["GetSizeControl"] != "")
                        {
                            jsExe += "tmp=eval(\"opener." + formName + "." + Request.QueryString["GetSizeControl"] + "\");tmp.value='" + file.ContentLength + "';";
                        }
                        jsExe += "tmp=eval(\"opener." + formName + "." + elementName + "_Look\");if(tmp){tmp.disabled=false;}; self.close();</script>";
                    }
                    Response.Write(jsExe);
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
