using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using KingTop.Common;
using KingTop.Web.Admin;
using System.IO;

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class SeoMapCreate : AdminPage
    {
        #region 属性/参数
        string strFreq = "";             //更新的频率
        string strPriority = "1.0";      //网页的优先级  0.0--1.0之间  

        #endregion

        #region 初始化

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion

        #region 生成 google,baidu,yahoo,bing,msn 地图

        #region XML格式
        //生成的事件
        protected void btnXml_Click(object sender, EventArgs e)
        {
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                else
                {
                    if (CreateSiteMap("xml"))       //操作成功
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "CreateSuccess") + "',title:'提示信息'})");
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "CreateError") + "',title:'提示信息'})");
                    }
                }
            }
        }
        #endregion

        #region HTML格式
        //生成的事件
        protected void btnHtml_Click(object sender, EventArgs e)
        {
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                else
                {
                    if (CreateSiteMap("html"))       //操作成功
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "CreateSuccess") + "',title:'提示信息'})");
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "CreateError") + "',title:'提示信息'})");
                    }
                }
            }
        }

        #endregion

        #endregion

        #region 生成

        /// <summary>
        /// 生成地图文件
        /// </summary>
        /// <param name="type">文件的类型</param>
        protected bool CreateSiteMap(string type)
        {
            bool ret = false;                                             //生成的结果
            string realmName = GetSiteDomain();                           //获取当前站的域名
            string strNowTime = DateTime.Now.ToString("yyyy-MM-dd");      //当前的时间

            //判断当前的域名是否为空，否则获取当前的域名
            if (!realmName.Contains("http://"))
            {
                realmName = "http://" + HttpContext.Current.Request.Url.Host + realmName;
            }

            string siteDir = SiteDir;                                     //获取站点的根目录
            string fPath = string.Format("~/{0}/Plus/SeoMap/", SiteDir);  //生成文件的目录
            if (!Directory.Exists(Server.MapPath(fPath)))                                 //不存大就创建一个目录
            {
                Directory.CreateDirectory(Server.MapPath(fPath));
            }

            if (siteDir.Substring(0, 1) != "/")
            {
                siteDir = "/" + siteDir;
            }
            if (siteDir.IndexOf(":") == -1)
            {
                string virPath;
                virPath = System.Web.HttpContext.Current.Request.ApplicationPath;                   //程序相对路径
                siteDir = System.Web.HttpContext.Current.Server.MapPath(virPath + siteDir);         //完整的物理路径
            }
            else
            {
                if (siteDir.Substring(siteDir.Length - 1) != "\\")
                {
                    siteDir += "\\";
                }
            }

            //获取指定路径的文件列表
            DirectoryInfo[] dirList = Utils.GetDirectoryList(siteDir);
            FileReadOrWrite fileRw = new FileReadOrWrite();     //文件读写对象
            StringBuilder xmlSb = new StringBuilder();          //xml文件内容
            StringBuilder htmSb = new StringBuilder();          //html文件内容

            //判断是生成什么类型的文件
            if ("xml".Equals(type))
            {
                try
                {
                    if (dirList != null)                                                    //列表有记录时
                    {
                        //xml开始内容
                        xmlSb.Append("<?xml version='1.0' encoding='UTF-8'?>\r\n<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>\r\n");
                        xmlSb.Append("  <url>\r\n");
                        xmlSb.Append("      <loc>" + realmName + "</loc>\r\n");
                        xmlSb.Append("      <lastmod>" + strNowTime + "</lastmod>\r\n");
                        xmlSb.Append("      <changefreq>" + ddlChangeFreq.SelectedItem.Text + "</changefreq>\r\n");
                        xmlSb.Append("      <priority>1.0</priority>\r\n");
                        xmlSb.Append("  </url>\r\n");

                        //遍历文件夹
                        foreach (DirectoryInfo dirInfo in dirList)
                        {
                            if (dirInfo.Name.Length > 0 && !"Plus".Equals(dirInfo.Name) && !"Skins".Equals(dirInfo.Name))
                            {
                                //遍历文件
                                foreach (FileInfo fileInfo in dirInfo.GetFiles())
                                {
                                    if (fileInfo.Name.Length > 0)                               //判断是否存文件
                                    {
                                        //判断链接是否合法,防止产生死链
                                        if (fileInfo.Extension.ToLower().Equals(".html") || fileInfo.Extension.ToLower().Equals(".htm"))
                                        {
                                            xmlSb.Append("  <url>\r\n");
                                            xmlSb.Append("      <loc>" + realmName + fileInfo.Name + "</loc>\r\n");
                                            xmlSb.Append("      <lastmod>" + strNowTime + "</lastmod>\r\n");
                                            xmlSb.Append("      <changefreq>" + ddlChangeFreq.SelectedItem.Text + "</changefreq>\r\n");
                                            xmlSb.Append("      <priority>0.8</priority>\r\n");
                                            xmlSb.Append("  </url>\r\n");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch (Exception)
                {
                    throw;
                }
                xmlSb.Append("</urlset>");
                if (fileRw.FileWrite(xmlSb.ToString(), fPath + "sitemap.xml"))                  //写入文件到相应的目录
                {
                    ret = true;
                }
            }
            else
            {
                //html开始内容
                htmSb.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
                htmSb.Append("<html xmlns='http://www.w3.org/1999/xhtml'>\r\n");
                htmSb.Append("<head>\r\n");
                htmSb.Append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />\r\n");
                htmSb.Append("<title>Seo站点地图</title>\r\n");
                htmSb.Append("<link href=\"../Common/style/sitemap.css\" rel='stylesheet' type='text/css' media='screen' />");
                htmSb.Append("</head>\r\n");
                htmSb.Append("<body>\r\n");
                htmSb.Append("  <div class='header'>\r\n");
                htmSb.Append("      <div class='top w960 center'>\r\n");
                htmSb.Append("          <div class='title'>\r\n");
                htmSb.Append("              <h1><a href='/' title='我的网站'><img src=\"../Common/images/logo.png\" alt='华强北'/></a> </h1>\r\n");
                htmSb.Append("          </div>\r\n");
                htmSb.Append("      </div>\r\n");
                htmSb.Append("  </div>\r\n");

                htmSb.Append("  <div class='w960 clear center mt1'>\r\n");
                htmSb.Append("      <div class='sp-title'>\r\n");
                htmSb.Append("          <h2>网站地图</h2>\r\n");
                htmSb.Append("      </div>\r\n");
                try
                {
                    if (dirList != null)                                                    //列表有记录时
                    {
                        //加载首页
                        htmSb.Append("      <div class='linkbox'>\r\n");
                        htmSb.Append("          <ul class='f6'>\r\n");
                        htmSb.Append("          <li><a href='" + realmName + "'>index</a></li>\r\n");
                        htmSb.Append("          </ul>\r\n");
                        htmSb.Append("      </div>\r\n");

                        //遍历文件夹
                        foreach (DirectoryInfo dirInfo in dirList)
                        {
                            if (dirInfo.Name.Length > 0 && !"Plus".Equals(dirInfo.Name) && !"Skins".Equals(dirInfo.Name))
                            {
                                //遍历文件
                                foreach (FileInfo fileInfo in dirInfo.GetFiles())
                                {
                                    if (fileInfo.Name.Length > 0)                               //判断是否存文件
                                    {
                                        //判断链接是否合法,防止产生死链
                                        if (fileInfo.Extension.ToLower().Equals(".aspx") || fileInfo.Extension.ToLower().Equals(".html") || fileInfo.Extension.ToLower().Equals(".htm"))
                                        {
                                            htmSb.Append("      <div class='linkbox'>\r\n");
                                            htmSb.Append("          <ul class='f6'>\r\n");
                                            htmSb.Append("          <li><a href='" + realmName + fileInfo.Name + "'>" + fileInfo.Name.Remove(fileInfo.Name.LastIndexOf(".")) + "</a></li>\r\n");
                                            htmSb.Append("          </ul>\r\n");
                                            htmSb.Append("      </div>\r\n");
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
                catch (Exception)
                {
                    throw;
                }
                htmSb.Append("  </div>\r\n");

                htmSb.Append("<!-- //底部 -->\r\n");
                htmSb.Append("<div class='footer w960 center mt1 clear'>\r\n");
                htmSb.Append("  <div class='footer_left'></div>\r\n");
                htmSb.Append("  <div class='footer_body'>\r\n");
                htmSb.Append("      <div class='copyright'>Copyright &copy; 2010 华强北在线 版权所有&nbsp;&nbsp;</div>\r\n");
                htmSb.Append("      </div>\r\n");
                htmSb.Append("  <div class='footer_right'></div>\r\n");
                htmSb.Append("</div>\r\n");
                htmSb.Append("</body>\r\n");
                htmSb.Append("</html>");

                if (fileRw.FileWrite(htmSb.ToString(), fPath + "sitemap.html"))                  //写入文件到相应的目录
                {
                    ret = true;
                }
            }
            return ret;
        }
        #endregion
    }
}
