using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.IO;
using System.Text;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月1日    功能描述： 方案列表 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemplateProjectList : AllPower.Web.Admin.AdminPage
    {

        #region 属性
        AllPower.BLL.TemplateProject bll = new AllPower.BLL.TemplateProject();            //业务操作类
        AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();
        #endregion

        #region 页面加载初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();             //加载数据
            }
        }

        /// <summary>
        /// 加载数据
        /// </summary>
        protected void PageInit()
        {
            this.sp.I1 = SiteID;                                                              //查询方案的条件
            this.rptTemplateProject.DataSource = bll.GetList("ALL", sp);                      //绑定数据源
            this.rptTemplateProject.DataBind();
            this.SetRight(null, rptTemplateProject);
            //把当前url全部参数存入cookie中       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
        }
        #endregion

        #region 按钮事件
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("TemlateProjectEdit.aspx?Action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "无新增权限，请联系管理员！");
            }
        }

        #region 删除,同时也删除方案底下的所有模板和风格信息(备用的删除事件,现采用前台的那种方式删除)
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string sbPath = "~/SysAdmin/Template/";                             //相对路径     
            string[] strValues = GetAllChkId().Split('_');                      //获取相应的ID和目录名
            sbPath += strValues[1];
            Delete(strValues[0]);                                               //删除方案
            DeleteDir(Server.MapPath(sbPath.ToString()));                       // 删除方案目录和目录下的文件夹、文件
        }

        /// <summary>
        /// 删除方案
        /// </summary>
        /// <param name="id">方案ID</param>
        private void Delete(string id)
        {
            if (IsHaveRightByOperCode("Delete"))                                       //验证权限
            {

                bll.TemplateProjectSet("DEL", "", id);                                //执行删除

                WriteLog(GetLogValue(LogTitle, "Del", "TemplateProject", true), "", 2);//写日志

                PageInit();                                                           //重新加载数据 
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
        }

        #region 文件夹的操作(删除)

        /// <summary>
        /// 删除目录和目录下的文件夹、文件(绝对的路径)
        /// </summary>
        /// <param name="dir">目录名称</param>
        private void DeleteFolder(string dir)
        {
            foreach (string d in Directory.GetFileSystemEntries(dir))
            {
                if (File.Exists(d))
                {
                    FileInfo fi = new FileInfo(d);
                    if (fi.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        fi.Attributes = FileAttributes.Normal;
                    File.Delete(d);//直接删除其中的文件   
                }
                else
                {
                    DeleteFolder(d);//递归删除子文件夹   
                }
            }
            Directory.Delete(dir);//删除已空文件夹   
        }

        /// <summary>
        /// 根据路径删除目录和里面的信息
        /// </summary>
        /// <param name="path">目录的路径</param>
        private void DeleteDir(string path)
        {
            if (path.Trim() == "" || !Directory.Exists(path))
                return;
            DirectoryInfo dirInfo = new DirectoryInfo(path);

            FileInfo[] fileInfos = dirInfo.GetFiles();
            if (fileInfos != null && fileInfos.Length > 0)
            {
                foreach (FileInfo fileInfo in fileInfos)
                {
                    File.Delete(fileInfo.FullName); //删除文件
                }
            }

            DirectoryInfo[] dirInfos = dirInfo.GetDirectories();
            if (dirInfos != null && dirInfos.Length > 0)
            {
                foreach (DirectoryInfo childDirInfo in dirInfos)
                {
                    this.DeleteDir(childDirInfo.FullName); //递归
                }
            }
            Directory.Delete(dirInfo.FullName, true); //删除目录
        }

        /// <summary>
        /// 删除文件夹
        /// </summary>
        /// <param name="directoryName">文件夹名称</param>
        /// <param name="IsAll">是否删除非空目录</param>
        /// <param name="dirPath">目录的相对路径</param>
        private void OnDeleteDirectory(string directoryName, bool isAll, string dirPath)
        {
            if (!string.IsNullOrEmpty(directoryName))
            {
                string directoryPath = dirPath;

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
            }
        }
        #endregion


        //获取复选框列表值

        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region 设置默认
        protected void lbtnDefault_Click(object sender, CommandEventArgs e)
        {
            if (!IsHaveRightByOperCode("Default"))                          //验证操作权限
            {
                Utils.AlertMessage(this, "你没有设置默认权限的操作！");
                return;
            }
            string id = e.CommandArgument.ToString();                       //方案的参数名
            if (!string.IsNullOrEmpty(id))                                  //决断参数是否为空
            {
                int res = Convert.ToInt32(bll.TemplateProjectSet("DEFAULT", "", id));
                if (res > 0)
                {
                    WriteLog(GetLogValue(LogTitle, "Default", "TemplateProject", true), "", 2);                   //写日志;
                    PageInit();                                                                               //重新加载数据
                    Utils.AlertMessage(this, "修改成功！");
                }
                else
                {
                    WriteLog(GetLogValue(LogTitle, "Default", "TemplateProject", false), "", 3); //写日志                      
                    Utils.AlertMessage(this, "'设置默认失败,请重试！");
                }
            }
            this.ViewState["path" + SiteID.ToString()] = null;
        }
        #endregion

        #endregion
    }
}
