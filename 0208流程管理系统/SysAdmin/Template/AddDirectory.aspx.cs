using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Web.Admin;
using AllPower.Common;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月8日    功能描述： 风格/模板目录添加/修改 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class AddDirectory : AdminPage
    {
        #region 属性
        public string tPath = "";  //当前的路径
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
            if (!Page.IsPostBack)
            {
                string path = Request.QueryString["path"];
                if (!"".Equals(path) && path.Length > 0)                        //判断路径是否为空
                {
                    tPath = path;
                    hidUrlReferrer.Value = Request.UrlReferrer.AbsolutePath;   //当前站点和页面名
                    hidDirectoryPath.Value = path;
                }
            }
        }
        #endregion

        #region 保存的事件
        /// <summary>
        /// 保存的事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.Save();
        }

        /// <summary>
        /// 新建目录
        /// </summary>
        protected void Save()
        {
            string dirName = Utils.cutBadStr(txtDirectoryName.Text);                           //目录名
            string fromDir = this.hidDirectoryPath.Value.Trim();                               //当前目录完整路径
            fromDir = Utils.cutBadStr(fromDir);                                                //过滤非法字符
            string skinDir = LabelUtils.GetSkinIsDefault();                                    //当前默认的风格目录名
            string desDir = fromDir.Substring(fromDir.LastIndexOf(skinDir) + skinDir.Length);  //当前目录名
            if (desDir.Length > 0)
            {
                if (desDir.Substring(0, 1) != "/")
                {
                    desDir = "/" + desDir;
                }
            }
            else
            {
                desDir = "/";
            }

            if (base.IsHaveRightByOperCode("New"))
            {
                try
                {
                    if ("ADDTEMPDIR".Equals(Action))                                   //新建模板目录
                    {
                        CreateDir();
                    }
                    else if ("ADDSKINDIR".Equals(Action))                             //新建风格文件目录
                    {
                        if (!LabelUtils.ValidateSkinIsDefault(SID))                   //是否默认风格
                        {
                            CreateDir();
                        }
                        else
                        {
                            CreateDir();                                                     //创建后并同步到当前方案
                            //目标的目录路径
                            string destination = Server.MapPath(LabelUtils.GetTemplateProjectPath(SiteID) + "/Skins" + desDir);
                            if (destination.LastIndexOf("/") + 1 < destination.Length)
                            {
                                destination += "/";
                            }
                            if (!Directory.Exists(destination + dirName))
                            {
                                Directory.CreateDirectory(destination + dirName);
                            }
                        }
                    }
                    Utils.RunJavaScript(this, "alert({msg:'新建目录成功！',title:'提示信息'})");
                }
                catch (Exception ex)
                {
                    WriteLog(GetLogValue(txtDirectoryName.Text, Action, "FileDir", false), ex.Message, 3);   //写日志

                    Utils.RunJavaScript(this, "alert({msg:'新建目录失败，请通知管理员！',title:'提示信息'})");
                }
                string urlMsg = this.hidUrlReferrer.Value.Trim();                                                   //当前站点和页面名
                Response.Redirect(urlMsg + "?Path=" + fromDir + "&Action=ALL&NodeCode=" + NodeCode);                //跳转到原来的页面
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有创建权限！',title:'提示信息'})");
            }
        }

        /// <summary>
        /// 创建 
        /// </summary>
        private void CreateDir()
        {
            string directoryName = txtDirectoryName.Text.Trim();                //目录名
            directoryName = Utils.cutBadStr(directoryName);                     //过滤非法字符
            string directoryPath = this.hidDirectoryPath.Value.Trim();          //当前的路径

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
        }
        #endregion
    }
}
