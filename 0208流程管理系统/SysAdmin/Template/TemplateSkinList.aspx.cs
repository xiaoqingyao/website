using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using AllPower.Common;
using System.Web.Hosting;
using System.Data;
using System.Text;
using AllPower.Template;

/*================================================================
    Copyright (C) 2010 华强北在线    作者:      何伟    创建时间： 2010年9月6日    功能描述： 风格列表 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class TemplateSkinList : AllPower.Web.Admin.AdminPage
    {
        #region 属性
        AllPower.BLL.TemplateSkin bll = new AllPower.BLL.TemplateSkin();           //风格业务操作类
        AllPower.BLL.TemplateProject tpBll = new AllPower.BLL.TemplateProject();   //方案操作
        AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();        //参数选择类

        private string proId = "";                                               //当前方案的ID
        public string ProId
        {
            get
            {
                string pId = "";
                sp.I1 = SiteID;
                DataTable dt = tpBll.GetList("ISDEFAULT", sp);               //获取默认的方案信息
                if (dt.Rows.Count > 0)                                       //判断是否存在 
                {
                    pId = dt.Rows[0]["ID"].ToString();                      //查询指定ID方案
                }
                return pId;
            }
            set
            {
                proId = value;
            }
        }
        #endregion

        #region 页面加载初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDllProject();
            }
            PageInitail();          //加载数据        
        }

        /// <summary>
        /// 加载数据
        /// </summary>
        protected void PageInitail()
        {
            this.sp.I1 = SiteID;                                                              //查询方案的条件
            string projectId = this.ddlProjects.SelectedValue;
            if (!projectId.Equals("") && projectId.Length > 0)                                //判断当前是否存在方案信息
            {
                this.sp.S1 = projectId;
            }
            this.rptSkinList.DataSource = bll.GetList("ALL", sp);                             //绑定数据源
            this.rptSkinList.DataBind();

            //把当前url全部参数存入cookie中       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
            //加入权限的验证
            this.SetRight(this.Page, rptSkinList);
        }

        /// <summary>
        /// 绑定方案名
        /// </summary>
        private void BindDllProject()
        {
            sp.I1 = SiteID;                                                                   //站点ID
            DataTable tpDt = tpBll.GetList("ALL", sp);                                       //所有方案信息

            ddlProjects.DataTextField = "Title";                                              //显示字段
            ddlProjects.DataValueField = "ID";                                               //绑定值字段
            ddlProjects.DataSource = tpDt;                                                   //绑定
            this.ddlProjects.DataBind();
            this.ddlProjects.SelectedValue = ProId;                                          //默认选项是当前默认方案
        }

        /// <summary>
        /// 根据ID查询方案名称
        /// </summary>
        /// <param name="id">方案ID</param>
        /// <returns>方案名</returns>
        public string GetProjectNameById(string id)
        {
            string strName = "";
            sp.S1 = id;
            DataTable dt = tpBll.GetList("ONE", sp);                     //获取指定的方案信息
            if (dt.Rows.Count > 0)                                       //判断是否存在 
            {
                strName = dt.Rows[0]["Title"].ToString();                //查询指定ID方案
            }
            return strName;
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
                Response.Redirect("TemplateSkinEdit.aspx?Action=NEW&&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "无新增权限，请联系管理员！");
            }
        }

        #region 删除,同时也删除底下的所有风格信息
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string[] strValues = GetAllChkId().Split('_');           //获取相应的ID和目录名
            string dirName = strValues[1];                           //当前风格目录名
            string virPath = "~/SysAdmin/Template/";                 //当前的相对路径
            string dirPath = "";                                    //物理路径
            dirPath = HttpContext.Current.Server.MapPath(virPath + dirName);

            Delete(strValues[0]);                                 //删除风格
            DeleteDir(dirPath);                                   // 删除风格目录和目录下的文件夹、文件
        }

        /// <summary>
        /// 删除风格
        /// </summary>
        /// <param name="id">风格ID</param>
        private void Delete(string id)
        {
            if (IsHaveRightByOperCode("Delete"))                                         //验证权限
            {

                bll.TemplateSkinSet("DEL", "", id);                                     //执行删除

                WriteLog(GetLogValue(LogTitle, "Del", "TemplateStyle", true), "", 2);  //写日志

                PageInitail();                                                           //重新加载数据 
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
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
            if (!IsHaveRightByOperCode("Default"))                              //验证操作权限
            {
                Utils.AlertMessage(this, "你没有设置默认权限的操作！");
                return;
            }
            string id = e.CommandArgument.ToString();                            //风格的ID
            string fromDir = Convert.ToString(e.CommandName);                    //风格目录名
            sp.I1 = SiteID;                                                      //站点ID
            DataTable dt = tpBll.GetList("ISDEFAULT", sp);                       //获取指定的方案信息
            string toDir = dt.Rows[0]["Directory"].ToString() + "/Skins";        //查询指定ID方案
            if (!string.IsNullOrEmpty(id))                                       //判断参数是否为空
            {
                int res = Convert.ToInt32(bll.TemplateSkinSet("SETDEFAULT", "", id));
                if (res > 0)
                {
                    WriteLog(GetLogValue(LogTitle, "Default", "TemplateStyle", true), "", 2);                //写日志;
                    if (fromDir.Length > 0 && toDir.Length > 0)                                              //目录存在时将此风格下的所有文件夹或文件移动到默认的方案下
                    {
                        string destination = Server.MapPath("~/SysAdmin/Template/" + toDir);                 //默认方案的风格目录
                        DirectoryInfo sourceDir = new DirectoryInfo(Server.MapPath(fromDir));                //默认风格文件目录
                        DirectoryInfo destinationDir = new DirectoryInfo(destination);                       //默认方案下风格目录
                        LabelUtils.DeleteFolder(destination);                                                //先删除以前的风格文件
                        LabelUtils.CopyDirectory(sourceDir, destinationDir);                                 //移动风格文件到默认方案
                    }
                    PageInitail();                                                                           //重新加载数据
                    Utils.AlertMessage(this, "修改成功！");
                }
                else
                {
                    WriteLog(GetLogValue(LogTitle, "Default", "TemplateStyle", false), "", 3);               //写日志                      
                    Utils.AlertMessage(this, "'设置默认失败,请重试！");
                }
            }
        }
        #endregion

        /// <summary>
        /// 切换相应的方案
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProId = this.ddlProjects.SelectedValue;
        }

        #endregion
    }
}
