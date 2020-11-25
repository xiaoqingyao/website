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

namespace AllPower.WEB.SysAdmin.Editor.eWebEditor.Aspx
{
    public partial class upload : AllPower.Web.Admin.AdminPage
    {
        #region 变量
        private string _upType = string.Empty;
        private string _extType = string.Empty;
        private string _controlMaxSize = string.Empty;
        private int MaxSize = 104857600;      //2M 1024*1024*2 允许上传最大文件大小

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
            string upType = Request.QueryString["type"];
            if (string.IsNullOrEmpty(upType))
            {
                upType = "image";
            }
            this.UpType = upType.ToLower();


            if (uploadobj.IsEnableUpload == "0")  //判断是否关闭上传功能
            {
                OutScript("parent.UploadError('IsOpen')");
                return;
            }

            switch (this.UpType)
            {
                case "media"://视频
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadMediaSize));
                    SavePath = uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                    AllowExt = GetExtType(uploadobj.UploadMediaType);
                    URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", SavePath);
                    break;

                case "file"://文件
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadFilesSize));
                    SavePath = uploadobj.FileSavePath + "/" + SiteDir + "/Files";
                    AllowExt = GetExtType(uploadobj.UploadFilesType);
                    URL = GetUploadUrl(uploadobj.FileUrl, "Files", SavePath);
                    break;

                case "image"://图片
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadImageSize));
                    SavePath = uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
                    AllowExt = GetExtType(uploadobj.UploadImageType);
                    URL = GetUploadUrl(uploadobj.ImageUrl, "Images", SavePath);
                    break;

                case "flash"://视频，flash
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadMediaSize));
                    SavePath = uploadobj.MediaSavePath + "/" + SiteDir + "/Medias";
                    AllowExt = "fla|swf";
                    URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", SavePath);
                    break;

                case "local"://图片
                    MaxSize = GetMaxSize(int.Parse(uploadobj.UploadImageSize));
                    SavePath = uploadobj.ImageSavePath + "/" + SiteDir + "/Images";
                    AllowExt = GetExtType(uploadobj.UploadImageType);
                    URL = GetUploadUrl(uploadobj.ImageUrl, "Images", SavePath);
                    break;

                default:
                    break;
            }
            string sAction = Request.QueryString["action"];
            if (!string.IsNullOrEmpty(sAction))
            {
                sAction = sAction.Trim().ToUpper();
                if (sAction == "SAVE" || sAction == "LOCAL")
                {
                    UploadFile(sAction);
                }
            }
        }
        #endregion

        #region 输出js
        private void OutScript(string str)
        {
            Response.Write("<script language=javascript>" + str + ";history.back()</script>");
        }

        private void OutScriptNoBack(string str)
        {
            Response.Write("<script language=javascript>" + str + "</script>");
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
        private void UploadFile(string sAction)
        {
            if (uploadobj.IsEnableUpload == "1")  //判断是否允许上传
            {
                HttpPostedFile postedFile = Request.Files["uploadfile"];
                if (!string.IsNullOrEmpty(postedFile.FileName))
                {
                    #region 变量

                    string noExt = SystemConst.NOT_ALLOWED_UPLOAD_TYPE; //不允许上传类型

                    string fileName = string.Empty;                             //文件名

                    string saveName = DateTime.Now.ToString("yyyyMMddHHmmss");  //上传文件名

                    string reFilePath = URL; //返回文件路径,如果保存路径填写的是绝对地址，则返回文件路径为域名+系统创建路径，如果为相对地址，则为：域名+相对路径+系统创建路径
                    string fileExt = string.Empty; //上传文件扩展名


                    fileName = Path.GetFileName(postedFile.FileName);
                    fileExt = Path.GetExtension(fileName).ToLower();  //上传文件扩展名

                    #endregion

                    if (postedFile.ContentLength > MaxSize)
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

                    fileName = SavePath + saveName + fileExt;
                    URL = URL + DateTime.Now.Year + "/" + DateTime.Now.Month + "/" + saveName + fileExt;

                    try
                    {
                        postedFile.SaveAs(fileName); //保存至服务器
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
                            //MakeThumbnail(fileName, fileName + ".gif", int.Parse(uploadobj.ThumbnailWidth), int.Parse(uploadobj.ThumbnailHeight), "HW");     // 生成缩略图方法

                        }
                    }
                    catch (Exception ex)
                    {
                        ex.ToString();
                    }

                    if (sAction == "LOCAL")
                    {
                        Response.Write(URL);
                    }
                    else
                    {
                        OutScript("parent.UploadSaved('" + URL + "','');var obj=parent.dialogArguments;if((!obj.eWebEditor)||(!obj.eWebEditor_Temp_HTML)||(!obj.eWebEditor_UploadForm)){obj=parent.dialogArguments.dialogArguments;} try{obj.addUploadFile('" + Path.GetFileName(postedFile.FileName) + "', '" + saveName + fileExt + "', '" + URL + "');} catch(e){} ");
                    }
                }
            }
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {

        }
        #endregion
    }
}
