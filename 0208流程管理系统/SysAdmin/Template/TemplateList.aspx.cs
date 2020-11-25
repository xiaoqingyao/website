using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.Web.Admin;
using System.Data;
using System.IO;
using System.Text;
using System.Collections;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.Hosting;
using AllPower.Model.FileManage;
using AllPower.BLL.FileManage;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 方案列表 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/

namespace AllPower.WEB.SysAdmin.Template.Template
{
    public partial class TemplateList : AdminPage
    {
        #region 设置参数
        AllPower.Model.TemplateProject model = new AllPower.Model.TemplateProject();      //方案的实体类
        AllPower.BLL.TemplateProject bll = new AllPower.BLL.TemplateProject();            //方案的业务类
        public string tPath = "";                                                       //当前的路径

        public string IndexPath
        {
            get
            {
                string p = "";
                object s = this.ViewState["path" + SiteID.ToString()];
                if (s != null)
                {
                    p = s as string;
                    this.ViewState["path" + SiteID.ToString()] = p;
                }
                else
                {
                    object o = AllPower.Template.LabelUtils.GetTemplateProjectPath(SiteID);                  //获取当前的模板目录
                    if (o != null)
                    {
                        p = o as string;
                    }
                }
                return p;

            }
            set { this.ViewState["path" + SiteID.ToString()] = value; }
        }
        #endregion

        #region 页面初始化

        protected void Page_Load(object sender, EventArgs e)
        {
            btnTempImport.Attributes.Add("OnClick", string.Format("FileUpload('frmTepList','{0}',5120,'temp');return false;", IndexPath));           //添加导入模板按钮事件
            if (!IsPostBack)
            {
                PageInit();                         //加载模板文件
                if (IndexPath.Length > 0)
                {
                    ltlRootPath.Text = IndexPath;   //设置当前模板的根目录
                }
            }
        }

        /// <summary>
        /// 加载模板文件列表
        /// </summary>
        private void PageInit()
        {
            int recordCount = 0;                                        //记录数
            string directory = "";                                      //目录的路径

            //获取当前模板的目录
            if (this.lblDirectoryPath.Text.Length > 0)
            {
                directory = lblDirectoryPath.Text;                       //当前的路径
            }
            else
            {
                directory = this.IndexPath;
                lblDirectoryPath.Text = directory;                      //当前的路径
            }

            if (directory.Length > 0 && !"".Equals(directory))         //验证当前站点是否存在并且为默认的方案,如果没有则创建一个
            {
                //获取并绑定文件列表
                List<Files> fileList = FilesManage.GetFileList(directory, Utils.ParseInt(Request.QueryString["page"], 1), Split.PageSize, out recordCount);
                this.rptTemplateList.DataSource = fileList;
                this.rptTemplateList.DataBind();
                Split.RecordCount = recordCount;

                tPath = Utils.ConvertSpecifiedPathToRelativePath(IndexPath);        //保存当前的路径
            }
            else
            {
                if (base.IsHaveRightByOperCode("New"))          //验证操作权限    
                {
                    string logTitle = "默认的";

                    string result = bll.CreateDefaultProject(SiteDir, NodeCode, SiteID);                    //创建默认方案
                    if (result.Length > 0)                                                                  //如果成功则绑定创建方案下的模板文件列表
                    {
                        WriteLog(GetLogValue(logTitle, Action, "TemplateProject", true), logTitle, 2);       //写日志;
                        directory = "/SysAdmin/Template/" + result;
                        //获取并绑定文件列表
                        List<Files> fileList = FilesManage.GetFileList(directory, Utils.ParseInt(Request.QueryString["page"], 1), Split.PageSize, out recordCount);
                        this.rptTemplateList.DataSource = fileList;
                        this.rptTemplateList.DataBind();
                        Split.RecordCount = recordCount;

                        lblDirectoryPath.Text = directory;                                  //显示当前的路径
                        tPath = Utils.ConvertSpecifiedPathToRelativePath(directory);        //保存当前的路径
                    }
                }
            }
        }
        #endregion

        #region 文件/文件夹处理程序

        //处理并获取文件文件夹列表
        private DataTable ReturnBindTable(DirectoryInfo[] dicts, FileInfo[] files)
        {
            DataTable table = new DataTable();
            DataColumn cell = new DataColumn("name", typeof(string));
            DataColumn cell1 = new DataColumn("extebsion", typeof(string));
            DataColumn cell2 = new DataColumn("fullname", typeof(string));
            DataColumn cell3 = new DataColumn("type", typeof(string));
            DataColumn cell4 = new DataColumn("size", typeof(string));
            DataColumn cell5 = new DataColumn("time", typeof(string));
            table.Columns.Add(cell);
            table.Columns.Add(cell1);
            table.Columns.Add(cell2);
            table.Columns.Add(cell3);
            table.Columns.Add(cell4);
            table.Columns.Add(cell5);
            foreach (DirectoryInfo dict in dicts)
            {
                DataRow row = table.NewRow();
                row["name"] = dict.Name;
                row["extebsion"] = "newfolder";
                row["fullname"] = dict.FullName;
                row["type"] = "文件夹";
                row["size"] = (Utils.CalculateDirSize(dict, true) / 1024).ToString() + "K";
                row["time"] = dict.LastWriteTime.ToString();
                table.Rows.Add(row);
            }

            foreach (FileInfo file in files)
            {
                DataRow row = table.NewRow();
                row["name"] = file.Name;
                if (file.Name.IndexOf('.') != -1)
                {
                    if (file.Extension.IndexOf('.') != -1)
                    {
                        row["type"] = file.Extension.Replace('.', ' ') + "文件";
                        row["extebsion"] = file.Extension.Substring(1, file.Extension.Length - 1);
                    }
                }
                else
                {
                    row["type"] = "文件夹";
                }
                row["fullname"] = file.FullName;
                if (file.Length != 0)
                {
                    row["size"] = Math.Round(Convert.ToDouble(file.Length) / 1024, 2) + "K";
                }
                else
                {
                    row["size"] = "0K";
                }
                row["time"] = file.LastWriteTime.ToString();
                table.Rows.Add(row);
            }
            return table;
        }
        //处理前台图标
        public string GetIcon(object type)
        {
            string typeName = type as string;
            string src = "~/SysAdmin/img/t_" + typeName + ".gif";
            return src;

        }
        #endregion

        #region 事件相关操作
        /// <summary>
        ///  绑定的事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptTemplateList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lbtn = (LinkButton)e.Item.FindControl("lbtnEdit");           //找编辑按钮
            if (lbtn != null)
            {
                string fileNam = lbtn.CommandArgument.ToString();                  //文件或文件夹的名称
                if (fileNam.IndexOf(".htm") > 0 || fileNam.IndexOf(".html") > 0 || fileNam.IndexOf(".aspx") > 0) //判断是否为文件，否则不能编辑
                {
                    lbtn.Visible = true;
                }
                else
                {
                    lbtn.Visible = false;
                }
            }
        }

        /// <summary>
        /// 绑定Repeate中的命令操作事件
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void rptTemplateList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //根据相应的命令执行相应的操作
            if (e.CommandName == "check")
            {
                string rootName = e.CommandArgument as string;
                if (Path.HasExtension(rootName))
                {
                    string name = Path.GetFileName(rootName);
                    string ext = Path.GetExtension(rootName);
                    if (name != ".svn")
                    {
                        if (".htm".Equals(ext) || ".html".Equals(ext) || ".aspx".Equals(ext))
                        {
                            this.Response.Redirect("AddTemplate.aspx?Path=" + rootName + "&Action=EDIT&NodeCode=" + NodeCode);
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
                    this.lblDirectoryPath.Text = rootName;
                    this.PageInit();
                }
            }
            else if (e.CommandName == "back")
            {
                string npath = Utils.ConvertSpecifiedPathToRelativePath(this.lblDirectoryPath.Text);  //取出当前模板的目录 
                string rootPath = ltlRootPath.Text;                                                   //当前模板文件的根目录
                if (rootPath.Length > 0)
                {
                    string newpath = Path.GetDirectoryName(npath);
                    string rPath = Path.GetDirectoryName(rootPath);
                    if (!newpath.Equals(rPath))
                    {
                        this.lblDirectoryPath.Text = newpath;
                        this.PageInit();
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
                this.Response.Redirect("AddTemplate.aspx?Path=" + npath + "&Action=ADD&NodeCode=" + NodeCode);
            }
        }

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
                string objectName = e.CommandArgument.ToString();
                string directoryPath = this.IndexPath;
                Response.Redirect("FileRename.aspx?ObjectPath=" + directoryPath + "/" + objectName + "&Action=ReName&page=" + Request.QueryString["page"]);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有重命名操作的权限！',title:'提示信息'})");
            }
        }

        /// <summary>
        /// 编辑文本文件类型的则是修改文件的内容
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
                    Response.Redirect("AddTemplate.aspx?Path=" + path + "&Action=EDIT&NodeCode=" + NodeCode + "&page=" + Request.QueryString["page"]);
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
        private void OnDeleteFile(string fileName)
        {
            if (!string.IsNullOrEmpty(fileName))
            {
                string[] arrFilePath = fileName.Split(',');
                string directoryPath = this.lblDirectoryPath.Text.Trim();
                string Path = directoryPath;
                if (directoryPath.IndexOf(":") == -1)
                {
                    if (directoryPath.LastIndexOf("/") + 1 < directoryPath.Length)
                    {
                        directoryPath += "/";
                    }
                    if (directoryPath.Substring(0, 1) != "/")
                        directoryPath = "/" + directoryPath;

                    Path = directoryPath;
                }
                else
                {
                    Path = directoryPath.Replace("/", "\\").Replace("\\\\", "\\");

                }
                foreach (string file in arrFilePath)
                {
                    Utils.FileDelete(Path + file);
                }
                PageInit();
            }
        }

        /// <summary>
        /// 删除文件夹
        /// </summary>
        /// <param name="directoryName">文件夹名称</param>
        /// <param name="IsAll">是否删除非空目录</param>
        private void OnDeleteDirectory(string directoryName, bool isAll)
        {
            if (!string.IsNullOrEmpty(directoryName))
            {
                string directoryPath = this.lblDirectoryPath.Text.Trim();
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
                PageInit();
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

        //添加目录
        protected void btnAddDir_Click(object sender, EventArgs e)
        {
            // 权限验证，是否具有新增权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("AddDirectory.aspx?path=" + this.lblDirectoryPath.Text + "&Action=ADDTEMPDIR&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增操作的权限！',title:'提示信息'})");
            }
        }

        //添加模板
        protected void btnAddTemplate_Click(object sender, EventArgs e)
        {
            // 权限验证，是否具有新增权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("AddTemplate.aspx?Path=" + this.lblDirectoryPath.Text + "&Action=ADD&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增操作的权限！',title:'提示信息'})");
            }
        }
        #endregion

        #region 生成目录
        /// <summary>
        /// 自动创建目录
        /// </summary>
        /// <returns>自动生成的名字</returns>
        private string CreateProjectDirectory()
        {
            string dirName = "";                                                //方案目录名
            string indexPath = "~/SysAdmin/Template/";                          //根目录
            string sPath = LabelUtils.GetWebSavePathName(SiteID.ToString());        //站点目录名
            DataTable dt = bll.GetList("LASTONE", new AllPower.Model.SelectParams());                    //取出最后创建的一个条记录
            string strDirectory = "";                                                                   //最后一个添加的方案目录名
            if (dt.Rows.Count > 0)
            {
                strDirectory = dt.Rows[0]["Directory"].ToString();                                  //得到最后的一个目录名
            }
            try
            {
                if (!strDirectory.Equals("") && strDirectory.Length > 0)                     //当目录名不为空时,对目录名加一如:P01,则返回P02
                {
                    dirName = GetNo(strDirectory);
                }
                else                                                                          //否则从生成第一个初始值目录名
                {
                    dirName = sPath + "P01";
                }

                if (Directory.Exists(dirName))                        //验证目录是否已经存在
                {
                    Utils.RunJavaScript(this, "alert({jsMessage:'目录已经存在！',title:'提示信息'})");
                }
                else
                {
                    Directory.CreateDirectory(Server.MapPath(indexPath + dirName));                     //创建方案目录
                    Directory.CreateDirectory(Server.MapPath(indexPath + dirName + "/Include"));        //创建包含文件目录
                    Directory.CreateDirectory(Server.MapPath(indexPath + dirName + "/HTML"));            //创建HTML文件目录
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dirName;
        }

        /// <summary>
        /// 取得编号
        /// 如GetNo("P01"),返回"P02"
        /// </summary>
        /// <param name="strIn">基础编号</param>
        /// <returns>新编号</returns>
        public static string GetNo(string strIn)
        {
            string res = "";                             //返回的编号

            if (!strIn.Equals("") && strIn.Length > 0)  //目录名不为空
            {
                string[] chars = strIn.Split('P');        //取出目录名和编号的字符串数组           
                string dName = chars[0];               //前面的目录名字
                string strNo = chars[1];               //获取后面的数字编号

                string strNum = "";                  //新的编号
                int num = Int32.Parse(strNo);        //转换成数字对其加1操作,并返回01,02这种类型   
                num += 1;
                strNum = num.ToString("00");

                res = dName + "P" + strNum;
            }
            return res;
        }

        #endregion
    }
}
