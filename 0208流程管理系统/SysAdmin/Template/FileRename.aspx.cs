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

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 文件夹/文件重命名 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class FileRename : AdminPage
    {

        #region 页面加载
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 初始化
        /// </summary>
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
                            objectPath = objectPath.Replace("\\", "/").Replace("//", "/");
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
                hidLogTitle.Value = "文件操作>>重命名";

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

            }
            catch (Exception ex)
            {
                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是" + ex.Message.Replace("\r\n", "<br>").Replace("\'", "\\'") + "',title:'提示信息'})");
            }
        }
        #endregion

        #region 重命名
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

                    //判断是文件还是文件夹
                    if (objectName.IndexOf(".") != -1)
                    {
                        //文件重命名
                        newObjectPath += objectName;
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
                                File.Move(oldObjectPath, newObjectPath);
                            }
                        }
                    }
                    else
                    {
                        //文件夹重命名
                        newObjectPath += objectName.Replace('.', ' ');          //不能包含扩展名
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

                    Response.Redirect(this.hidUrlReferrer.Value.Trim());                    //返回原来页面
                }
            }
            catch (Exception ex)
            {
                WriteLog(GetLogValue(txtObjectName.Text.Trim(), Action, "UploadMsg2", false), ex.Message, 3); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是" + ex.Message.Replace("\r\n", "<br>").Replace("\'", "\\'") + "！',title:'提示信息'})");
            }
        }
        #endregion
    }
}
