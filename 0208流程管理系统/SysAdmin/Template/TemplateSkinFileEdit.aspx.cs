using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Web.Admin;
using AllPower.Common;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 风格文件添加/修改 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemplateSkinFileEdit : AdminPage
    {
        #region 属性参数
        public string tPath = "";
        private string _path = null;
        /// <summary>
        /// 当前的路径
        /// </summary>
        public string IndexPath
        {
            get
            {
                if (this._path == null)
                {
                    this._path = Request.QueryString["path"];
                }
                return this._path;
            }
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

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initail();
                string root = Session["root"].ToString();
                if (root.Length > 0)
                {
                    ltlRootPath.Text = root;            //设置当前文件的根目录
                }
            }
        }

        /// <summary>
        /// 加载数据
        /// </summary>
        private void Initail()
        {
            if ("EDIT".Equals(Action))              //编辑时加载数据
            {
                this.txtFileName.Visible = false;
                this.lblPath.Visible = true;
                this.lblFileName.Visible = true;

                string path = this.IndexPath;       //取得风格文件路径
                this.HiddenField_Path.Value = path;
                FileContent.Text = Utils.showFileContet(path);
                FileInfo file = new FileInfo(path);
                this.lblFileName.Text = file.Name;
                this.lblPath.Text = " (所在目录：" + path + " )";
                this.lblPath.ForeColor = System.Drawing.Color.Gray;
            }

            this.hidUrlReferrer.Value = HttpContext.Current.Request.UrlReferrer.ToString();              //当前的请求URL
            tPath = IndexPath;                                                                           //保存当前的信息
            this.HiddenField_Path.Value = IndexPath;
        }
        #endregion

        #region 保存的事件

        /// <summary>
        /// 保存操作
        /// </summary>
        protected void btnSave_Click(object o, EventArgs e)
        {
            this.Save();
        }

        /// <summary>
        /// 保存的方法
        /// </summary>
        private void Save()
        {
            //验证操作权限
            if (base.IsHaveRightByOperCode("New"))
            {
                //添加
                if ("ADD".Equals(Action))
                {
                    string str_Templet = HttpContext.Current.Request.QueryString["path"];                   //目录路径
                    string fileName = this.txtFileName.Text.Trim();                                         //风格文件名称             
                    //验证文件类型是否合法
                    //ValidateFile(fileName);
                    if (fileName.IndexOf('.') != -1)
                    {
                        string ext = fileName.Substring(fileName.LastIndexOf(".")).ToLower();
                        if (ext.Equals(".css") || ext.Equals(".js"))
                        {
                            bool isSave = Utils.AddHtml(fileName, str_Templet, this.FileContent.Text.Trim());
                            if (isSave)
                            {
                                //同步文件到默认方案下
                                if (LabelUtils.ValidateSkinIsDefault(SID))                                      //是否默认风格
                                {
                                    //目标的目录路径
                                    string destination = LabelUtils.GetTemplateProjectPath(SiteID) + "/Skins";
                                    if (!str_Templet.Trim().Equals(ltlRootPath.Text.Trim()))
                                    {
                                        string strPath = str_Templet.Replace(ltlRootPath.Text.Trim(), "");
                                        destination += strPath;
                                    }
                                    //源目录路径
                                    string fromDir = Server.MapPath(str_Templet);
                                    //复制创建的文件到当前默认方案
                                    LabelUtils.CopyFile(fromDir, Server.MapPath(destination), fileName);
                                }
                                WriteLog(GetLogValue(fileName, Action, "SkinFile", true), "", 2);               //写日志
                                Utils.RunJavaScript(this, "alert({msg:'添加文件成功！',title:'提示信息'})");
                                Response.Redirect(hidUrlReferrer.Value);                                        //跳转到列表页面
                            }
                            else
                            {
                                WriteLog(GetLogValue(fileName, Action, "SkinFile", false), "", 3);              //写日志
                                Utils.RunJavaScript(this, "alert({msg:'添加文件失败！',title:'提示信息'})");
                            }
                        }
                        else
                        {
                            WriteLog(GetLogValue(txtFileName.Text.Trim(), Action, "SkinFile", false), "", 3);   //写日志
                            Utils.RunJavaScript(this, "alert({msg:'文件类型不正确！',title:'提示信息'})");
                        }
                    }
                    else
                    {
                        WriteLog(GetLogValue(txtFileName.Text.Trim(), Action, "SkinFile", false), "", 3);       //写日志
                        Utils.RunJavaScript(this, "alert({msg:'请输入完整的文件名！',title:'提示信息'})");
                    }
                }
                //修改
                else if ("EDIT".Equals(Action))
                {
                    string filepath = this.HiddenField_Path.Value.ToString().Trim();                        //获取路径
                    bool result = Utils.saveHtml(filepath, this.FileContent.Text.ToString().Trim());        //保存文件

                    if (result)
                    {
                        //同步文件到默认方案下
                        if (LabelUtils.ValidateSkinIsDefault(SID))                                      //是否默认风格
                        {
                            //目标的目录路径
                            string destination = LabelUtils.GetTemplateProjectPath(SiteID) + "/Skins";
                            string rootPath = ltlRootPath.Text.Trim();                                  //风格根目录
                            if (!filepath.Trim().Equals(rootPath))
                            {
                                string strPath = ConvertUrl(Path.GetDirectoryName(filepath));
                                destination += strPath.Replace(rootPath, "");
                            }
                            //源目录路径
                            string fromDir = string.Empty;
                            if (filepath.IndexOf(":") != -1)
                            {
                                fromDir = Path.GetDirectoryName(filepath);
                            }
                            else
                            {
                                fromDir = Server.MapPath(Path.GetDirectoryName(filepath));
                            }
                            //复制创建的文件到当前默认方案
                            LabelUtils.CopyFile(fromDir, destination, this.lblFileName.Text.Trim());
                        }
                        WriteLog(GetLogValue(lblFileName.Text, Action, "SkinFile", true), "", 2);   //写日志
                        Utils.RunJavaScript(this, "alert({msg:'修改文件成功！',title:'提示信息'})");
                        Response.Redirect(hidUrlReferrer.Value);                                                   //跳转到原来的页面
                    }
                    else
                    {
                        WriteLog(GetLogValue(lblFileName.Text, Action, "SkinFile", false), "", 3);   //写日志
                        Utils.RunJavaScript(this, "alert({msg:'修改文件失败！',title:'提示信息'})");
                    }
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有操作权限！',title:'提示信息'})");
            }
        }

        /// <summary>
        /// 验证文件名是否输入正确
        /// </summary>
        /// <param name="file">文件名全称</param>
        /// <returns></returns>
        private void ValidateFile(string file)
        {
            if (file.IndexOf('.') != -1)
            {
                string ext = file.Substring(file.LastIndexOf(".")).ToLower();
                if (!ext.Equals(".css") || !ext.Equals(".js"))
                {
                    WriteLog(GetLogValue(txtFileName.Text.Trim(), Action, "SkinFile", false), "", 3);   //写日志
                    Utils.RunJavaScript(this, "alert({msg:'文件类型不正确！',title:'提示信息'})");
                    return;
                }
            }
            else
            {
                WriteLog(GetLogValue(txtFileName.Text.Trim(), Action, "SkinFile", false), "", 3);   //写日志
                Utils.RunJavaScript(this, "alert({msg:'请输入完整的文件名！',title:'提示信息'})");
                return;
            }
        }

        //本地路径转换成URL相对路径
        private string ConvertUrl(string urlPath)
        {
            string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
            string strPath = urlPath.Replace(tmpRootDir.ToLower(), ""); //转换成相对路径
            strPath = strPath.Replace(@"\", @"/");
            if (!"/".Equals(strPath.Substring(0, 1)))
            {
                strPath = "/" + strPath;
            }
            return strPath;
        }
        #endregion
    }
}
