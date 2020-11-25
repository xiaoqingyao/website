using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

using AllPower.Model.FileManage;
using AllPower.BLL.FileManage;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.FileManage
{
    public partial class FileEditImage : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();                
            }
        }
        /// <summary>
        /// 加载水印等信息
        /// </summary>
        private void PageInit()
        {
            string objectPath = "";
            if (!string.IsNullOrEmpty(Request.QueryString["ObjectPath"]))
            {
                objectPath = Request.QueryString["ObjectPath"].ToString().ToLower();
                
                if (objectPath.IndexOf(":") > 0)
                {
                    objectPath = objectPath.Replace("/", "\\").Replace("\\\\", "\\");
                    lblObjectPath.Text = objectPath;
                    objectPath = objectPath.ToLower();
                    string systemPath = Server.MapPath("/").ToLower ();

                    if (objectPath.IndexOf(systemPath) > -1)
                        objectPath = "/" + objectPath.Replace(systemPath, "").Replace("\\", "/");
                    else
                    {
                        string[] URL = Utils.strSplit(Server.UrlDecode(Request.QueryString["URL"]), "<tp>");
                        systemPath = URL[1].ToLower();
                        objectPath = URL[0] + objectPath.ToLower().Replace(systemPath, "").Replace("\\", "/");
                    }
                }
                else
                {
                    objectPath = objectPath.Replace("\\", "/").Replace("//", "/");
                    if (objectPath.Substring(0, 1) != "/")
                        objectPath = "/" + objectPath;

                    lblObjectPath.Text = objectPath;
                }
            }
            
            hidUrlReferrer.Value = Request.UrlReferrer.ToString();

            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
            if (uploadobj != null)
            {
                txtHeight.Text = uploadobj.ThumbnailHeight;
                txtWidth.Text = uploadobj.ThumbnailWidth;
                imgPhoto.Height = Convert.ToInt32(uploadobj.ThumbnailHeight);
                imgPhoto.Width = Convert.ToInt32(uploadobj.ThumbnailWidth);
                imgWaterMark.ImageUrl = "~/" + uploadobj.WatermarkPic;
            }
            else
            {
                imgPhoto.Height = 50;
                imgPhoto.Width = 80;
            }
            imgPhoto.ImageUrl = objectPath;
        }

        /// <summary>
        /// 生成缩略图 / 加水印
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string objcetPath = lblObjectPath.Text.Trim();
                if (objcetPath.IndexOf(":") == -1)
                {
                    objcetPath = Server.MapPath(objcetPath);
                }
                if (File.Exists(objcetPath))
                {
                    string waterMark = radlWaterMarkType.SelectedValue;
                    string extension = Path.GetExtension(objcetPath);
                    UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
                    int width = Utils.ParseInt(uploadobj.ThumbnailWidth,0);
                    int height = Utils.ParseInt(uploadobj.ThumbnailHeight,0);
                    if (Utils.ParseInt(txtHeight.Text, 0) > 0)
                    {
                        height = int.Parse(txtHeight.Text);
                    }
                    if (Utils.ParseInt(txtWidth.Text, 0) > 0)
                    {
                        width = int.Parse(txtWidth.Text);
                    }
                    upfiles.ckeditorupload.MakeThumbnail(objcetPath, objcetPath + ".gif",width, height, "HW");
                    Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'操作失败！',title:'提示信息'})");
                }
            }
            catch (Exception ex)
            {
                WriteLog("文件管理-->生成缩略图", ex.Message, 3); //写日志

                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是" + ex.Message .Replace("\r\n","<br>").Replace ("\'","\\'")+ "！',title:'提示信息'})");
            }
        }
        /// <summary>
        /// 添加水印
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnWaterMark_Click(object sender, EventArgs e)
        {
            try
            {
                string objcetPath = lblObjectPath.Text.Trim();
                if (objcetPath.IndexOf(":") == -1)
                {
                    objcetPath = Server.MapPath(objcetPath);
                }
                if (File.Exists(objcetPath))
                {
                    string waterMark = radlWaterMarkType.SelectedValue;
                    UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
                    //不添加水印
                    if (waterMark != "-1")
                    {
                        ImageWatermark iwobj = new ImageWatermark(0, 0, objcetPath);
                        if (waterMark == "0") //水印为文字类型
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
                            iwobj.WaterPath = Server.MapPath("~/" + uploadobj.WatermarkPic);
                            iwobj.WaterPicturemark();
                        }
                    }
                    Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                }
            }
            catch (Exception ex)
            {
                WriteLog("文件管理-->添加水印出错", ex.Message, 3); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是"+ex.Message .Replace ("\r\n","<br>").Replace ("\'","\\'")+"！',title:'提示信息'})");
            }
        }
        /// <summary>
        /// 文件管理
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkFileManage_Click(object sender, EventArgs e)
        {
            string url = hidUrlReferrer.Value.Trim();
            string oldObjectPath = Request.QueryString["ObjectPath"].ToString().ToLower();
            if (string.IsNullOrEmpty(url))
            {
                if (oldObjectPath.IndexOf(":") == -1)
                {
                    oldObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("/") + 1);
                }
                else
                {
                    oldObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("\\") + 1);
                }
                url = "FileList.aspx?path=" + oldObjectPath + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"];
            }
            Response.Redirect(url);
        }
    }
}
