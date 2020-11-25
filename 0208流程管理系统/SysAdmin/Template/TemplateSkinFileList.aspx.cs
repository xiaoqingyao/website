using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Model.FileManage;
using AllPower.BLL.FileManage;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.Common;
using System.IO;
using System.Web.Hosting;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 风格文件列表管理 
 * 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemplateSkinFileList : AdminPage
    {
        #region 属性
        public string tPath = "";           //当前的路径

        //当前风格的目录
        public string IndexPath
        {
            get
            {
                string p = "";
                object s = this.ViewState["path"];
                if (s != null)
                {
                    p = s as string;
                    this.ViewState["path"] = p;
                }
                else
                {
                    p = Request.QueryString["path"];                //获取当前风格的路径

                }
                return p;

            }
            set { this.ViewState["path"] = value; }
        }

        //当前风格ID 
        public string SID
        {
            get
            {
                string sId = Request.QueryString["sid"];
                return sId;
            }
        }
        #endregion

        #region 页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSkinImport.Attributes.Add("OnClick", string.Format("FileUpload('frmFileList','{0}',8192,'skin');return false;", IndexPath));  //添加导入风格按钮事件
            if (!IsPostBack)
            {
                if (!IndexPath.Equals("") && IndexPath.Length > 0)      //目录路径不为空
                {
                    PageInit(IndexPath);                                //获取文件列表
                    ltlRootPath.Text = IndexPath;                       //当前风格的根目录
                    Session["root"] = ltlRootPath.Text.Trim();
                }
            }
        }

        /// <summary>
        /// 加载文件列表
        /// </summary>
        /// <param name="directory">目录的路径</param>
        private void PageInit(string directory)
        {
            lblDirectoryPath.Text = directory;                      //当前的路径
            int recordCount = 0;                                    //记录数
            List<Files> fileList = FilesManage.GetFileList(directory, Utils.ParseInt(Request.QueryString["page"], 1), Split.PageSize, out recordCount);
            rptSkinFileList.DataSource = fileList;                  //文件列表
            rptSkinFileList.DataBind();
            Split.RecordCount = recordCount;

            tPath = Utils.ConvertSpecifiedPathToRelativePath(IndexPath);        //保存当前的URL
        }
        #endregion

        #region 操作的事件
        /// <summary>
        /// 重命名
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void FileList_Rename(object sender, CommandEventArgs e)
        {
            // 权限验证，是否具有修改权限
            if (IsHaveRightByOperCode("ReName"))
            {
                string isDir = e.CommandName.ToString();
                string objectName = e.CommandArgument.ToString();
                string directoryPath = lblDirectoryPath.Text;
                Response.Redirect("FileRename.aspx?ObjectPath=" + directoryPath + "/" + objectName + "&Action=ReName&IsDir=" + isDir + "&page=" + Request.QueryString["page"]);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有重命名操作的权限！',title:'提示信息'})");
            }
        }

        /// <summary>
        /// 编辑修改文件的内容
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void FileList_Edit(object sender, CommandEventArgs e)
        {
            // 权限验证，是否具有修改权限
            if (IsHaveRightByOperCode("Edit"))
            {
                string path = e.CommandArgument.ToString();                                                       //绝对的完整路径
                string name = Path.GetFileName(path);
                if (name != ".svn")
                {
                    Response.Redirect("TemplateSkinFileEdit.aspx?path=" + path + "&sid=" + SID + "&Action=EDIT&NodeCode=" + NodeCode + "&page=" + Request.QueryString["page"]);
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
                PageInit(directoryPath);
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
                PageInit(lblDirectoryPath.Text.Trim());
            }
        }

        /// <summary>
        /// 删除事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
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
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有删除操作的权限！',title:'提示信息'})");
            }

        }

        /// <summary>
        ///  绑定的命名操作事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptSkinFileList_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            //根据不同的事件名，并执行相应的事件操作
            if (e.CommandName == "check")
            {
                string rootName = e.CommandArgument as string;
                if (Path.HasExtension(rootName))
                {
                    string name = Path.GetFileName(rootName);
                    string ext = Path.GetExtension(rootName);
                    if (name != ".svn")
                    {
                        if (".css".Equals(ext) || ".js".Equals(ext))
                        {
                            this.Response.Redirect("TemplateSkinFileEdit.aspx?path=" + rootName + "&sid=" + SID + "&Action=EDIT&NodeCode=" + NodeCode);
                        }
                        else
                        {
                            LinkButton lbtn = (LinkButton)e.Item.FindControl("lbtnFileName");
                            lbtn.Enabled = false;
                        }
                    }
                }
                else
                {
                    this.IndexPath = rootName;
                    this.PageInit(IndexPath);
                }
            }
            else if (e.CommandName == "back")
            {
                string npath = Utils.ConvertSpecifiedPathToRelativePath(this.IndexPath);

                string rootPath = ltlRootPath.Text;                                     //取出当前风格的根目录

                if (rootPath.Length > 0)
                {
                    string newpath = Path.GetDirectoryName(npath);
                    string rPath = Path.GetDirectoryName(rootPath);
                    if (!newpath.Equals(rPath))
                    {
                        this.IndexPath = newpath;
                        this.PageInit(IndexPath);
                    }
                    else
                    {
                        ImageButton ibtn = (ImageButton)e.Item.FindControl("ibtnBack");             //根目录时,向上的不可用
                        ibtn.Enabled = false;
                    }
                }
            }
            else if (e.CommandName == "Add")
            {
                string npath = Utils.ConvertSpecifiedPathToRelativePath(this.IndexPath);
                this.Response.Redirect("TemplateSkinFileEdit.aspx?path=" + npath + "&Action=ADD&NodeCode=" + NodeCode);
            }
        }

        /// <summary>
        ///  绑定的事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptSkinFileList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lnk = (LinkButton)e.Item.FindControl("lbtnEdit");                                    //获取编辑按钮
            if (lnk != null)                                                                                //判断是否有找到                                                               
            {
                string commandArgument = lnk.CommandArgument;                                               //绑定的文件名
                if (commandArgument.IndexOf(".js") > 0 || commandArgument.IndexOf(".css") > 0)              //只有css和JS文件才可以编辑
                {
                    lnk.Visible = true;
                }
                else
                {
                    lnk.Visible = false;
                }
            }
        }

        //返回风格管理
        protected void btnBack_Click(object sender, EventArgs e)
        {
            // 权限验证，是否具有返回权限
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("TemplateSkinList.aspx?Action=ALL&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有操作的权限！',title:'提示信息'})");
            }
        }

        //新建目录
        protected void btnAddDir_Click(object sender, EventArgs e)
        {
            // 权限验证，是否具有新增权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("AddDirectory.aspx?path=" + IndexPath + "&sid=" + SID + "&Action=ADDSKINDIR&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增操作的权限！',title:'提示信息'})");
            }
        }

        //新建风格文件
        protected void btnAddSkin_Click(object sender, EventArgs e)
        {
            // 权限验证，是否具有新增权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("TemplateSkinFileEdit.aspx?path=" + IndexPath + "&sid=" + SID + "&Action=ADD&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增操作的权限！',title:'提示信息'})");
            }
        }
        #endregion
    }
}
