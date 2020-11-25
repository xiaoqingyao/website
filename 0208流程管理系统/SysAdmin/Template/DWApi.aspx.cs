using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;
using System.IO;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年9月26日
    功能描述： 处理DW在线编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class DWApi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string msg = "";
                switch(Request["op"])
                {
                    case "log":
                        msg = Login();
                        break;
                    case "innit":
                        msg = pageInit();
                        break;
                    case "getTemplate":
                        msg = getTemplate();
                        break;
                    case "savetemplate":
                        msg = savetemplate();
                        break;
                }
                Response.Write(msg);
                Response.End();
            }
        }
        #region//登陆验证
        private string Login()
        {
            try
            {
                bool isTrue = checkLogin();

                return (isTrue ? "校验成功" : "校验码错误！");
            }
            catch
            {
                return "配置错误！";
           
            }
        }
        #endregion


        #region //页面初始化
        private string pageInit()
        {
            string dwManges = Utils.XmlRead(Server.MapPath("~/SysAdmin/Configuraion/SiteInfoManage.config"), "/SiteInfoManage/SiteDWMange", "");//获得配置信息
            string[] dws = dwManges.Split('|');
            StringBuilder options = new StringBuilder();  //站点列表
            foreach (string dw in dws)
            {
                options.Append("<option value='" + dw.Split(',')[0] + "'>" + dw.Split(',')[1] + "</option>");
            }
            return options.ToString();
        }
        #endregion



        #region //获得模板
        private string getTemplate()
        {
            string path = Request["path"];
            string loginSite = Request["sitevalue"].Trim();
            bool isTrue = checkLogin();
            if (isTrue)//密码正确
            {
                string rootPath = AllPower.Template.LabelUtils.GetTemplateProjectPath(int.Parse(loginSite));

                DirectoryInfo thisOne = new DirectoryInfo(Server.MapPath(rootPath + "//" + path));
                StringBuilder str = new StringBuilder();

                //指打开文件
                if (path.IndexOf('.') != -1)
                {
                    str.Append(Utils.showFileContet(Server.MapPath(rootPath + "//" + path)));
                }
                else
                {

                    System.IO.DirectoryInfo[] subDirectories = thisOne.GetDirectories();//获得目录 
                    if (path != "")  //不是为根目录
                    {
                        string lastPath = path.Substring(0, path.LastIndexOf("/"));  //上一级
                        str.Append("<div class='ft'><input type='image' src='dir.gif' onclick='getlist(\"" + lastPath + "\")' value='button' /><br/>..</div>");
                    }
                    // 获得目录
                    foreach (DirectoryInfo dirinfo in subDirectories)
                    {
                        str.Append("<div class='ft'><input type='image' src='dir.gif' onclick='getlist(\"" + path + "/" + dirinfo.Name + "\")' value='button' /><br/>" + dirinfo.Name + "</div>");
                    }
                    //获得文件
                    foreach (FileInfo fInfo in thisOne.GetFiles())
                    {

                        str.Append("<div class='ft'><input type='image' src='other.gif' onclick='getemplate(\"" + path + "/" + fInfo.Name + "\")' value='button' /><br/>" + fInfo.Name + "</div>");
                    }
                }
                return str.ToString();
            }
            else
            {
                return "验证码错误";
            }
        }
        #endregion

        #region //保存模板
        private string savetemplate()
        {
            string path = Request["path"];
            string loginSite = Request["sitevalue"].Trim();
            bool isTrue = checkLogin();           
         
        
            string rootPath = AllPower.Template.LabelUtils.GetTemplateProjectPath(int.Parse(loginSite));
            if(isTrue)//密码正确
            {
                FileInfo file = new FileInfo(Server.MapPath(rootPath + "//" + path + ".html"));
                if (file.Exists)
                {
                    StreamWriter sw = new StreamWriter(Server.MapPath(rootPath + "//" + path + ".html"));
                    sw.WriteLine(Request["cont"]);
                    sw.Close();

                    return "文件\"" + path + "\"上传成功";
                }
                else
                {
                    return "文件出错";
                }
               
            }
            else
            {
                return "验证码错误";
            }

        }
        #endregion

        #region //验证登陆信息
        private bool checkLogin()
        {
            string dwManges = Utils.XmlRead(Server.MapPath("~/SysAdmin/Configuraion/SiteInfoManage.config"), "/SiteInfoManage/SiteDWMange", ""); //获得配置信息
            string[] dws = dwManges.Split('|');
            string loginSite = Request["sitevalue"].Trim();  //要登陆的站点
            string loginPwd = Request["pwd"];
            bool flag = false;
            foreach (string dw in dws)
            {
                if (loginSite == dw.Split(',')[0] && loginPwd == dw.Split(',')[2])
                {
                    flag = true;
                    break;
                }
            }
            return flag;
        }
        #endregion
    }
}
