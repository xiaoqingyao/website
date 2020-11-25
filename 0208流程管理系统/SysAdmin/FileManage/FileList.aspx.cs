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
    public partial class FileList : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);
                string directory = getUploadSetPath(uploadobj.ImageSavePath, "images");

                if (Request.QueryString["path"] != null)
                {
                    directory = Request.QueryString["path"].ToString().Replace("//", "/").Replace("\\\\", "\\");
                }

                GetUploadCategory(directory, uploadobj);

                GetGoParentDirectory(directory, uploadobj);

                PageInit(directory, Request.QueryString["keyword"]);
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

        private void PageInit(string directory, string keyword)
        {
            lblDirectoryPath.Text = directory;
            //if (directory.IndexOf(":") == -1)  //判断输入的是虚拟路径
            //{
            //    directory = Server.MapPath(GetVirtualPath + directory);
            //}
            int recordCount = 0;
            List<Files> fileList = FilesManage.GetFileList(directory, keyword, Utils.ParseInt(Request.QueryString["page"], 1), Split.PageSize, out recordCount);
            rptFileList.DataSource = fileList;
            rptFileList.DataBind();
            Split.RecordCount = recordCount;
        }
        /// <summary>
        /// 上传文件选项卡

        /// </summary>
        private void GetUploadCategory(string directory, UploadConfig uploadobj)
        {
            string path = getUploadSetPath(uploadobj.ImageSavePath, "images").ToLower();
            string URL = "";
            directory = directory.ToLower();
            string pathTips = "<a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
                URL = GetUploadUrl(uploadobj.ImageUrl, "images", path) + "<tp>" + uploadobj.ImageSavePath;
            }
            path = getUploadSetPath(uploadobj.MediaSavePath, "Medias").ToLower();
            pathTips += ">图片文件管理</a> | <a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
                URL = GetUploadUrl(uploadobj.MediaUrl, "Medias", path) + "<tp>" + uploadobj.MediaSavePath;
            }
            path = getUploadSetPath(uploadobj.FileSavePath, "Files").ToLower();
            pathTips += ">媒体文件管理</a> | <a href=\"?path=" + path + "\"";
            if (directory.IndexOf(path) > -1)
            {
                pathTips += " class=\"cRed\"";
                URL = GetUploadUrl(uploadobj.FileUrl, "Files", path) + "<tp>" + uploadobj.FileSavePath;
            }
            pathTips += ">其他文件管理</a>";
            ViewState["URL"] = URL + "<tp>";
            lblPathTips.Text = pathTips.ToString();
        }
        /// <summary>
        /// 上一级目录

        /// </summary>
        private void GetGoParentDirectory(string directory, UploadConfig uploadobj)
        {
            string path = "";

            if (directory.IndexOf(":") == -1)  //判断输入的是虚拟路径
            {
                directory = Server.MapPath(GetVirtualPath + directory);
            }
            string imgPath = getUploadSetPath(uploadobj.ImageSavePath, "images");
            string mediaPath = getUploadSetPath(uploadobj.MediaSavePath, "Medias");
            string filePath = getUploadSetPath(uploadobj.FileSavePath, "Files");

            if (Directory.Exists(directory))
            {
                if (Utils.IsChildDirectory(filePath, directory, GetVirtualPath))
                {
                    path = GetParentDir(filePath, directory);
                }
                else if (Utils.IsChildDirectory(imgPath, directory, GetVirtualPath))
                {
                    path = GetParentDir(imgPath, directory);
                }
                else if (Utils.IsChildDirectory(mediaPath, directory, GetVirtualPath))
                {
                    path = GetParentDir(mediaPath, directory);
                }
            }

            if (!string.IsNullOrEmpty(path))
            {
                lblParentPath.Text = "<a href=\"?path=" + path + "\"><img src=\"../images/up.gif\" border=\"0\" alt=\"向上\" style=\"vertical-align:middle\"></a>";
            }
            else
            {
                lblParentPath.Text = "<img src=\"../images/up_enable.gif\" alt=\"向上\" style=\"vertical-align:middle\">";
            }
        }

        private string GetParentDir(string uploadSetPath, string thisPath)
        {
            string path = string.Empty;

            DirectoryInfo dirInfo = new DirectoryInfo(thisPath);

            if (uploadSetPath.IndexOf(":") == -1)
            {
                DirectoryInfo dirTemp = new DirectoryInfo(Server.MapPath(GetVirtualPath + uploadSetPath));
                path = dirInfo.FullName.ToLower().Replace(dirTemp.FullName.ToLower(), "");
                path = path.ToLower().Substring(0, path.ToLower().IndexOf(dirInfo.Name.ToLower()));
                if (uploadSetPath.Substring(uploadSetPath.Length - 1) == "\\" || uploadSetPath.Substring(uploadSetPath.Length - 1) == "/")
                {
                    uploadSetPath += "/";
                }
                path = GetVirtualPath + uploadSetPath + path;
                path = path.Replace("\\", "/").Replace("//", "/");
            }
            else
            {
                //DirectoryInfo dirTemp = new DirectoryInfo(uploadSetPath);
                //if(uploadSetPath!=thisPath)
                //    thisPath = path.ToLower().Substring(0, path.ToLower().IndexOf(dirInfo.Name.ToLower()));
                if (thisPath.Length > uploadSetPath.Length + 3)
                {
                    string[] arrPath = Utils.strSplit(thisPath, "\\");
                    if (thisPath.Substring(thisPath.Length - 1) == "\\")
                    {
                        thisPath = thisPath.Substring(0, thisPath.IndexOf(arrPath[arrPath.Length - 2]));
                    }
                    else
                    {
                        thisPath = thisPath.Substring(0, thisPath.IndexOf(arrPath[arrPath.Length - 1]));
                    }
                    path = thisPath;
                    path = path.Replace("/", "\\").Replace("\\\\", "\\");
                }
            }

            return path;
        }

        /// <summary>
        /// 获取文件夹的目录
        /// </summary>
        /// <param name="dirPath"></param>
        /// <returns></returns>
        public string GetDirPath(string dirFullPath, string fileName, bool isDir)
        {
            string dirPath = fileName;
            string ext = "";
            if (dirPath.IndexOf(".") > 0)
            {
                string[] arrExt = dirPath.ToLower().Split('.');
                ext = arrExt[arrExt.Length - 1];
            }
            string systemPath = Server.MapPath("/");
            if (isDir && !string.IsNullOrEmpty(dirPath))
            {
                dirPath = "<a href=\"?path=" + dirFullPath + "/\" id='Title" + fileName + "'>" + fileName + "</a>";
            }
            else if (!string.IsNullOrEmpty(dirPath))
            {
                if (dirFullPath.IndexOf(systemPath) > -1)
                    dirFullPath = "/" + dirFullPath.Replace(systemPath, "").Replace("\\", "/");
                else
                {
                    string[] URL = Utils.strSplit(ViewState["URL"].ToString(), "<tp>");
                    systemPath = URL[1].ToLower();
                    dirFullPath = URL[0] + dirFullPath.ToLower().Replace(systemPath, "").Replace("\\", "/");
                    dirFullPath = dirFullPath.Replace("//", "/").Replace(":/", "://");
                }

                dirPath = "<a href='" + dirFullPath + "' target='_blank' id='Title" + fileName + "'>" + fileName + "</a>";
            }
            return dirPath;
        }
        /// <summary>
        /// 判断编辑按钮是否可用
        /// </summary>
        /// <param name="isDir"></param>
        /// <returns></returns>
        public string GetVisible(bool isDir)
        {
            if (isDir) return "false";
            return "true";
        }

        /// <summary>
        /// 重命名
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void FileList_Rename(object sender, CommandEventArgs e)
        {
            // 权限验证，是否具有修改权限

            if (IsHaveRightByOperCode("Edit"))
            {
                string isDir = e.CommandName.ToString();
                string objectName = e.CommandArgument.ToString();
                string directoryPath = lblDirectoryPath.Text;
                Response.Redirect("FileRename.aspx?ObjectPath=" + directoryPath + objectName + "&IsDir=" + isDir + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"]);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限！',title:'提示信息'})");
            }
        }
        /// <summary>
        /// 下载
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void FileList_Down(object sender, CommandEventArgs e)
        {
            string objectName = e.CommandArgument.ToString().ToLower();
            string directoryPath = lblDirectoryPath.Text;
            if (directoryPath.LastIndexOf("/") + 1 != directoryPath.Length)
            {
                directoryPath += "/";
            }
            if (directoryPath.IndexOf(":") == -1)
            {
                directoryPath = Server.MapPath(directoryPath);
            }
            directoryPath = directoryPath.Replace("\\\\", "\\");
            if (directoryPath.Substring(directoryPath.Length - 1) != "\\")
            {
                directoryPath = directoryPath + "\\";
            }

            Utils.ResponseFile(Request, Response, objectName, directoryPath + objectName, 1024000);
        }
        /// <summary>
        /// 编辑 如果是图片的，则是生成缩略图/加水印 文本文件类的则是修改文件的内容
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void FileList_Edit(object sender, CommandEventArgs e)
        {
            // 权限验证，是否具有修改权限

            if (IsHaveRightByOperCode("Edit"))
            {
                string objectName = e.CommandArgument.ToString().ToLower();
                string directoryPath = lblDirectoryPath.Text;
                if (directoryPath.LastIndexOf("/") + 1 != directoryPath.Length)
                {
                    directoryPath += "/";
                }

                if (objectName.IndexOf(".") > 0)
                {
                    if (objectName.IndexOf(".htm") > 0 || objectName.IndexOf(".txt") > 0 || objectName.IndexOf(".aspx") > 0 || objectName.IndexOf(".shtml") > 0)
                    {
                        Response.Redirect("FileEditTxt.aspx?ObjectPath=" + directoryPath + objectName + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"]);
                    }
                    else if (objectName.IndexOf(".jpg") > 0 || objectName.IndexOf(".gif") > 0 || objectName.IndexOf(".png") > 0 || objectName.IndexOf(".jpeg") > 0 || objectName.IndexOf(".bmp") > 0)
                    {
                        Response.Redirect("FileEditImage.aspx?ObjectPath=" + directoryPath + objectName + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"] + "&url=" + Server.UrlEncode(ViewState["URL"].ToString()));
                    }
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限！',title:'提示信息'})");
            }
        }
        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="id"></param>
        void OnDeleteFile(string fileName)
        {
            if (!string.IsNullOrEmpty(fileName))
            {
                string[] arrFilePath = fileName.Split(',');
                string directoryPath = lblDirectoryPath.Text.Trim();
                string Path = directoryPath;
                if (directoryPath.IndexOf(":") == -1)
                {
                    if (directoryPath.LastIndexOf("/") + 1 < directoryPath.Length)
                    {
                        directoryPath += "/";
                    }
                    if (directoryPath.Substring(0, 1) != "/")
                        directoryPath = "/" + directoryPath;

                    Path = Server.MapPath(directoryPath);
                }
                else
                {
                    Path = directoryPath.Replace("/", "\\").Replace("\\\\", "\\");

                }
                foreach (string file in arrFilePath)
                {
                    Utils.FileDelete(Path + file);
                }
                PageInit(directoryPath, Request.QueryString["keyword"]);
            }
        }

        /// <summary>
        /// 删除文件夹
        /// </summary>
        /// <param name="directoryName">文件夹名称</param>
        /// <param name="IsAll">是否删除非空目录</param>
        void OnDeleteDirectory(string directoryName, bool isAll)
        {
            if (!string.IsNullOrEmpty(directoryName))
            {
                string directoryPath = lblDirectoryPath.Text.Trim();

                if (directoryPath.IndexOf(":") == -1)
                {
                    if (directoryPath.Substring(0, 1) != "/")
                        directoryPath = "/" + directoryPath;

                    directoryPath = Server.MapPath(directoryPath);
                }
                directoryPath = directoryPath.Replace("\\\\", "\\");
                if (directoryPath.Substring(directoryPath.Length - 1) != "\\")
                {
                    directoryPath = directoryPath + "\\";
                }
                string[] arrDirectoryPath = directoryName.Split(',');
                foreach (string file in arrDirectoryPath)
                {
                    if (isAll)
                    {
                        Utils.DirectoryDelete(directoryPath + file);
                    }
                    else
                    {
                        if (Utils.IsEmptyDirectory(directoryPath + file))
                        {
                            Utils.DirectoryDelete(directoryPath + file);
                        }
                    }
                }
                PageInit(lblDirectoryPath.Text.Trim(), Request.QueryString["keyword"]);
            }
        }

        protected void butdel_Click(object sender, EventArgs e)
        {
            string type = Request.Form["btnHidAction"];
            if (IsHaveRightByOperCode("Delete"))
            {
                string objectName = Request.Form["chkId"];
                if (type == "0")
                {
                    string[] arrDirectoryPath = objectName.Split(',');
                    for (int i = 0; i < arrDirectoryPath.Length; i++)
                    {
                        if (arrDirectoryPath[i].IndexOf(".") == -1)
                        {
                            OnDeleteDirectory(arrDirectoryPath[i], true);
                        }
                        else
                        {
                            OnDeleteFile(arrDirectoryPath[i]);
                        }
                    }
                }
                else if (type == "1")
                {
                    OnDeleteDirectory(objectName, false);
                }
                else if (type == "2")
                {
                    OnDeleteFile(objectName);
                }
                else if (type == "3")
                {
                    if (objectName.IndexOf(".") == -1)
                    {
                        OnDeleteDirectory(objectName, true);
                    }
                    else
                    {
                        OnDeleteFile(objectName);
                    }
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限！',title:'提示信息'})");
            }

        }

        /// <summary>
        /// 新建目录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCreateDirectory_Click(object sender, EventArgs e)
        {
            if (base.IsHaveRightByOperCode("New"))
            {
                string directoryName = txtDirectoryName.Text.Trim();
                directoryName = Utils.cutBadStr(directoryName);
                string directoryPath = lblDirectoryPath.Text.Trim();

                try
                {
                    if (directoryPath.IndexOf(":") == -1)
                    {
                        directoryPath = directoryPath.Replace("\\", "/").Replace("//", "/");
                        if (directoryPath.Substring(directoryPath.Length - 1) != "/")
                            directoryPath = directoryPath + "/" + directoryName;
                        else
                            directoryPath = directoryPath + directoryName;
                        if (directoryPath.Substring(0, 1) != "/")
                        {
                            directoryPath = "/" + directoryPath;
                        }

                        Directory.CreateDirectory(Server.MapPath(directoryPath));
                    }
                    else
                    {
                        directoryPath = directoryPath.Replace("/", "\\").Replace("\\\\", "\\");
                        if (directoryPath.Substring(directoryPath.Length - 1) != "\\")
                            directoryPath = directoryPath + "\\" + directoryName;
                        else
                            directoryPath = directoryPath + directoryName;

                        Directory.CreateDirectory(directoryPath);
                    }
                    Utils.RunJavaScript(this, "alert({msg:'新建目录成功！',title:'提示信息'})");
                }
                catch (Exception ex)
                {
                    WriteLog(GetLogValue("文件管理-->新建目录出错", "Create", "FileManage", false), ex.Message, 3); //写日志

                    Utils.RunJavaScript(this, "alert({msg:'新建目录失败，请通知管理员！',title:'提示信息'})");
                }
                txtDirectoryName.Text = "";
                string keyword = txtSearch.Text.Trim();
                PageInit(lblDirectoryPath.Text.Trim(), keyword);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'新建目录失败，没有权限！',title:'提示信息'})");
            }
        }
        /// <summary>
        /// 搜索
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();
            keyword = Utils.cutBadStr(keyword);
            string directoryPath = lblDirectoryPath.Text;
            //ViewState["keyword"] = keyword;
            //PageInit(directoryPath, keyword);
            Response.Redirect("FileList.aspx?path=" + directoryPath + "&keyword=" + keyword);
        }

        protected void rptFileList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lnk = (LinkButton)e.Item.FindControl("lnkEidt");
            string commandName = lnk.CommandName;
            string commandArgument = lnk.CommandArgument;
            if (commandArgument.IndexOf(".jpg") > 0 || commandArgument.IndexOf(".gif") > 0 || commandArgument.IndexOf(".jpeg") > 0 || commandArgument.IndexOf(".bmp") > 0 || commandArgument.IndexOf(".png") > 0 || commandArgument.IndexOf(".htm") > 0 || commandArgument.IndexOf(".shtml") > 0 || commandArgument.IndexOf(".txt") > 0 || commandArgument.IndexOf(".aspx") > 0)
            {
                lnk.Visible = true;
            }
            else
            {
                lnk.Visible = false;
            }

            if (commandName == "1")
            {
                LinkButton lnkDown = (LinkButton)e.Item.FindControl("lnkDown");
                lnkDown.Visible = false;
            }
        }
    }
}
