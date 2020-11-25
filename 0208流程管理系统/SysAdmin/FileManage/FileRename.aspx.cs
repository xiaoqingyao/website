using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using AllPower.Model.FileManage;
using AllPower.BLL.FileManage;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.FileManage
{
    public partial class FileRename : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            try
            {
                string objectPath = "";
                if (Request.QueryString["ObjectPath"] != null)
                {
                    objectPath = Request.QueryString["ObjectPath"].ToString().Trim();
                    if (objectPath.IndexOf(":") == -1)
                    {
                        if (objectPath.Substring(0, 1) != "/")
                        {
                            objectPath = "/" + objectPath.Replace("\\", "/").Replace("//", "/");
                        }
                    }
                    else
                    {

                        objectPath = objectPath.Replace("/", "\\").Replace("\\\\", "\\");

                    }
                }
                bool isDir = true;
                if (Request.QueryString["IsDir"] != null)
                {
                    isDir = Request.QueryString["IsDir"].ToString().Trim() == "1" ? true : false;
                }
                hidLogTitle.Value = "文件管理-->改名";

                hidUrlReferrer.Value = Request.UrlReferrer.ToString();

                if (!string.IsNullOrEmpty(objectPath))
                {
                    objectPath = objectPath.Replace("//", "/").Replace("\\\\", "\\");
                    if (isDir && (objectPath.IndexOf("/") + 1 == objectPath.Length || objectPath.IndexOf("\\") + 1 == objectPath.Length))
                    {
                        objectPath = objectPath.Substring(0, objectPath.Length - 1);
                    }
                    lblDirectoryPath.Text = objectPath;
                    if (objectPath.IndexOf(":") == -1)
                    {
                        txtObjectName.Text = objectPath.Substring(objectPath.LastIndexOf("/") + 1, objectPath.Length - objectPath.LastIndexOf("/") - 1);
                    }
                    else
                    {
                        txtObjectName.Text = objectPath.Substring(objectPath.LastIndexOf("\\") + 1, objectPath.Length - objectPath.LastIndexOf("\\") - 1);
                    }
                }

                //上传的文件目录列表

                UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
                GetUploadCategory(objectPath, uploadobj);
            }
            catch (Exception ex)
            {
                WriteLog(GetLogValue(LogTitle, "Update", "FileManage", false), ex.Message, 3); //写日志

                Utils.RunJavaScript(this, "alert({msg:'操作失败！',title:'提示信息'})");
            }
        }
        
        private string getUploadSetPath(string uploadSetPath, string uploadType)
        {
            string rePath = uploadSetPath;
            if (uploadSetPath.IndexOf(":") == -1)
            {
                if (uploadSetPath.Substring(uploadSetPath.Length - 1) == "/")
                {
                    rePath = uploadSetPath + SiteDir + "/" + uploadType + "/";
                }
                else
                {
                    rePath = uploadSetPath + "/" + SiteDir + "/" + uploadType + "/";
                }
            }

            return rePath;
        }


        /// <summary>
        /// 上传文件选项卡

        /// </summary>
        private void GetUploadCategory(string directory, UploadConfig uploadobj)
        {
            string path = getUploadSetPath(uploadobj.ImageSavePath, "images").ToLower();
            directory = directory.ToLower();
            string pathTips = "<a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
            }
            path = getUploadSetPath(uploadobj.MediaSavePath, "Medias").ToLower();
            pathTips += ">图片文件管理</a> | <a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
            }
            path = getUploadSetPath(uploadobj.FileSavePath, "Files").ToLower();
            pathTips += ">媒体文件管理</a> | <a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
            }
            pathTips += ">其他文件管理</a>";
            lblPathTips.Text = pathTips.ToString();
        }
        /// <summary>
        /// 重命名 对象
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string objectName = txtObjectName.Text.Trim();
                objectName = Utils.cutBadStr(objectName);
                if (!string.IsNullOrEmpty(objectName))
                {
                    string oldObjectPath = lblDirectoryPath.Text.Trim();
                    string newObjectPath;
                    if (oldObjectPath.IndexOf(":") == -1)
                    {
                        if (oldObjectPath.IndexOf("/") + 1 == oldObjectPath.Length)
                        {
                            oldObjectPath = oldObjectPath + "/";
                        }
                        newObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("/") + 1);
                    }
                    else
                    {
                        if (oldObjectPath.IndexOf("\\") + 1 == oldObjectPath.Length)
                        {
                            oldObjectPath = oldObjectPath + "\\";
                        }
                        newObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("\\") + 1);
                    }
                        newObjectPath += objectName;

                        if (Request.QueryString["IsDir"] != null && Request.QueryString["IsDir"].ToString() == "0")
                        {
                            ///文件重命名
                            if (oldObjectPath.IndexOf(":") == -1)
                            {
                                if (File.Exists(Server.MapPath(oldObjectPath)))
                                {
                                    File.Move(Server.MapPath(oldObjectPath), Server.MapPath(newObjectPath));
                                }
                            }
                            else
                            {
                                if (File.Exists(oldObjectPath))
                                {
                                    File.Move(oldObjectPath,newObjectPath);
                                }
                            }
                        }
                        else
                        {
                            //文件夹重命名
                            if (oldObjectPath.IndexOf(":") == -1)
                            {
                                if (Directory.Exists(Server.MapPath(oldObjectPath)))
                                {
                                    Directory.Move(Server.MapPath(oldObjectPath), Server.MapPath(newObjectPath));
                                }
                            }
                            else
                            {
                                if (Directory.Exists(oldObjectPath))
                                {
                                    Directory.Move(oldObjectPath, newObjectPath);
                                }
                            }
                        }
                        if (oldObjectPath.IndexOf(":") == -1)
                        {
                            oldObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("/") + 1);
                        }
                        else
                        {
                            oldObjectPath = oldObjectPath.Substring(0, oldObjectPath.LastIndexOf("\\") + 1);
                        }

                        Response.Redirect("FileList.aspx?path=" + oldObjectPath + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"]);
                    }
            }
            catch (Exception ex)
            {
                WriteLog(GetLogValue(LogTitle, "Update", "FileManage", false), ex.Message, 3); //写日志

                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是" + ex.Message .Replace ("\r\n","<br>").Replace("\'","\\'")+ "！',title:'提示信息'})");
            }
        }

        protected void lnkFileManage_Click(object sender, EventArgs e)
        {
            string url = hidUrlReferrer.Value.Trim();
            string oldObjectPath = Request.QueryString["ObjectPath"];
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
