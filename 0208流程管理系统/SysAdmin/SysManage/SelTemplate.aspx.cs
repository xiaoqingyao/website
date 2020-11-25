using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using AllPower.Common;
using AllPower.BLL.FileManage;
using AllPower.Model.FileManage;

namespace AllPower.Web.Admin
{
    public partial class SelTemplate : AdminPage
    {
        public string parentPath = "返回上一级目录";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string rootPath = TemplateRootPath().ToLower();
                string directory ;
                if (Request.QueryString["path"] != null)
                {
                    directory = Request.QueryString["path"].ToString().Replace("//", "/").Replace("\\\\", "\\");
                }
                else
                {
                    directory=rootPath;
                }

                directory=directory.Replace ("/","\\");
                if (rootPath != directory.ToLower() && rootPath + "\\" != directory.ToLower ())
                {
                    parentPath = directory.Substring(0, directory.Length - 1);
                    parentPath = "<a href='SelTemplate.aspx?contrName=" + Request.QueryString["contrName"] + "&path=" + parentPath.Substring(0, parentPath.LastIndexOf("\\")) + "'>返回上一级目录</a>";
                }

                int recordCount = 0;
                List<Files> fileList = FilesManage.GetFileList(directory, "", Utils.ParseInt(Request.QueryString["page"], 1), 10000, out recordCount);
                rptFileList.DataSource = fileList;
                rptFileList.DataBind();
            }
        }

        private string TemplateRootPath()
        {
            string re = "";
            if (AppCache.IsExist("TemplateRootPathCache") && AppCache.Get("TemplateRootPathSiteIDCache").ToString() == SiteID.ToString ())
            {
                re = AppCache.Get("TemplateRootPathCache").ToString();
            }
            else
            {
                re = Server.MapPath(AllPower.Template.LabelUtils.GetTemplateProjectPath(SiteID));
                AppCache.AddCache("TemplateRootPathCache", re, 20);
                AppCache.AddCache("TemplateRootPathSiteIDCache", SiteID, 20);
            }

            return re;
        }

        public string GetDirPath(string dirFullPath, string fileName, bool isDir, string extensionPhoto, string fileSize)
        {
            string dirPath = fileName;
            string ext = "";
            if (dirPath.IndexOf(".") > 0)
            {
                string[] arrExt = dirPath.ToLower().Split('.');
                ext = arrExt[arrExt.Length - 1].ToLower();
            }
            string systemPath = Server.MapPath("/");
            if (isDir && !string.IsNullOrEmpty(dirPath) && fileName.ToLower()!="skins")
            {
                dirPath = "<tr><td style='padding-left:20px' colspan=2><img src=\""+extensionPhoto+"\" style=\"vertical-align: middle;\" /> <a href=\"?path=" + dirFullPath + "\\&contrName="+Request.QueryString["contrName"]+"\" id='Title" + fileName + "'>" + fileName + "</a></td></tr>";
            }
            else if (!string.IsNullOrEmpty(dirPath) && (ext == "htm" || ext == "html"))
            {
                dirFullPath = dirFullPath.ToLower().Replace(TemplateRootPath().ToLower()+"\\", "").Replace("\\", "/");
                dirPath = "<tr><td style='padding-left:20px'><img src=\"" + extensionPhoto + "\" style=\"vertical-align: middle;\" /> <a href='javascript:void(0);' ondblclick=\"GetTemplatePath('" + dirFullPath + "')\" id='Title" + fileName + "'>" + fileName + "</a></td>";
                dirPath += "<td style='padding-right:20px' align=right>" + fileSize + "</td></tr>";
            }
            else
            {
                dirPath = "";
            }

            return dirPath;
        }

        public string GetContrName()
        {
            string re = Request.QueryString["contrName"];
            
            return re;
        }
    }
}
