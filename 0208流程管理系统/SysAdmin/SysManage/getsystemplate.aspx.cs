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
using System.Text;
using System.IO;
using ICSharpCode.SharpZipLib.Zip;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class getsystemplate : AllPower.Web.Admin.AdminPage
    {
        public string templatePath = string.Empty;
        ZipOutputStream zos = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                MovePlusToTemplateDir();
                GetSiteMenuDir();
                dlZipDir("CMS模板文件");
                Response.Write("OK");
            }
        }

        //复制plus文件夹和search.aspx到模板文件夹中
        private void MovePlusToTemplateDir()
        {
            templatePath=Server.MapPath(AllPower.Template.LabelUtils.GetTemplateProjectPath(SiteID));
            string plusPath = Server.MapPath("/" + SiteDir );
            DirectoryInfo templatePath1 = new DirectoryInfo(Path.Combine(templatePath,"plus"));
            DirectoryInfo plusPath1 = new DirectoryInfo(Path.Combine(plusPath,"plus"));
            CopyDir(plusPath1, templatePath1);

            templatePath1 = new DirectoryInfo(Path.Combine(templatePath, "includefile"));
            plusPath1 = new DirectoryInfo(Path.Combine(plusPath, "includefile"));
            CopyDir(plusPath1, templatePath1);

            File.Copy(plusPath + "/search.aspx", templatePath + "/search.aspx", true);
        }
        private void CopyDir(DirectoryInfo fromDir, DirectoryInfo toDir)
        {
            if (!toDir.Exists)
            {
                toDir.Create(); //目标目录若不存在就创建
            }
            FileInfo[] files = fromDir.GetFiles();
            foreach (FileInfo file in files)
            {
                file.CopyTo(Path.Combine(toDir.FullName, file.Name),true); //复制目录中所有文件
            }
            DirectoryInfo[] dirs = fromDir.GetDirectories();
            foreach (DirectoryInfo dir in dirs)
            {
                string destinationDir = Path.Combine(toDir.FullName, dir.Name);
                CopyDir(dir, new DirectoryInfo(destinationDir)); //复制子目录
            }
        }

        //获得站点栏目目录
        private void GetSiteMenuDir()
        {
            AllPower.BLL.SysManage.ModuleNode mnObj = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = mnObj.GetList("SITEWEB",AllPower.Common.Utils.getOneParams(SiteID.ToString ()));
            DataRow[] dr = dt.Select("IsWeb=1");

            //首页模板
            if (!File.Exists(Path.Combine(templatePath, "index.html")))
            {
                Utils.WriteFile(Path.Combine(templatePath, "index.html"), GetTemplateContent());
            }
            for (int i = 0; i < dr.Length; i++)
            {
                if (dr[i]["NodeCode"].ToString().Length == 6)  //一级栏目
                {
                    string nodeDir = dr[i]["NodeDir"].ToString();
                    if (!Directory.Exists(Path.Combine(templatePath, nodeDir)))
                    {
                        Directory.CreateDirectory(Path.Combine(templatePath, nodeDir));
                    }
                    int dirNum = 0;
                    CreateSubMenuDir(dt, dr[i]["NodeCode"].ToString(), nodeDir,ref dirNum);
                    switch (dirNum)
                    {
                        case 1:
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\single.html"));
                            break;
                        case 2:
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\list.html"));
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\content.html"));
                            break;
                        case 3:
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\list.html"));
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\content.html"));
                            CreateTemplate(Path.Combine(templatePath, nodeDir + "\\single.html"));
                            break;
                    }
                    if(!string.IsNullOrEmpty(dr[i]["defaulttemplate"].ToString ()))
                    {
                        CreateTemplate(Path.Combine(templatePath, nodeDir + "\\index.html"));
                    }
                }
            }
        }

        private void CreateTemplate(string path)
        {
            if (!File.Exists(path))
            {
                Utils.WriteFile(path, GetTemplateContent());
            }
        }
        //typeNum 0=不在顶级目录下创建文件，1=创建single.html,2=创建list.html和content.html,3=创建single.html、list.html和content.html
        private void CreateSubMenuDir(DataTable dt, string nodeCode, string parentDir, ref int typeNum)
        {
            int hasSingle=0;
            int hasList=0;

            DataRow[] dr = dt.Select("ParentNode='" + nodeCode + "'");
            
                for (int i = 0; i < dr.Length; i++)
                {
                    if (dr[i]["NodeType"].ToString() == "0" && dr[i]["ColumnType"].ToString() == "2")
                    {
                        hasSingle = 1;
                        if (!string.IsNullOrEmpty(dr[i]["defaulttemplate"].ToString()))
                        {
                            CreateTemplate(Path.Combine(templatePath,  dr[i]["defaulttemplate"].ToString()));
                        }
                    }
                    else if (dr[i]["NodeType"].ToString() == "0" && dr[i]["ColumnType"].ToString() == "1")
                    {
                        hasList = 2;
                        if (!string.IsNullOrEmpty(dr[i]["defaulttemplate"].ToString()))
                        {
                            CreateTemplate(Path.Combine(templatePath,  dr[i]["defaulttemplate"].ToString()));
                        }
                        if (!string.IsNullOrEmpty(dr[i]["ListPageTemplate"].ToString()))
                        {
                            CreateTemplate(Path.Combine(templatePath,  dr[i]["ListPageTemplate"].ToString()));
                        }
                        if (!string.IsNullOrEmpty(dr[i]["ContentTemplate"].ToString()))
                        {
                            CreateTemplate(Path.Combine(templatePath,  dr[i]["ContentTemplate"].ToString()));
                        }
                    }
                    
                }
                if (typeNum == 0)
                {
                    typeNum = hasSingle + hasList;
                }
                else if ((typeNum == 1 && hasList == 2) || (typeNum == 2 && hasSingle == 1))
                {
                    typeNum = 3;
                }

            for (int i = 0; i < dr.Length; i++)
            {
                if (dr[i]["NodeType"].ToString() == "1")
                {
                    if (!Directory.Exists(Path.Combine(templatePath, parentDir+"\\"+dr[i]["NodeDir"].ToString ())))
                    {
                        Directory.CreateDirectory(Path.Combine(templatePath, parentDir+"\\"+dr[i]["NodeDir"].ToString ()));
                    }
                    if (!string.IsNullOrEmpty(dr[i]["defaulttemplate"].ToString()))
                    {
                        CreateTemplate(Path.Combine(templatePath, parentDir + "\\" + dr[i]["NodeDir"].ToString() + "\\index.html"));
                    }
                }
                CreateSubMenuDir(dt, dr[i]["NodeCode"].ToString(), parentDir + "\\" + dr[i]["NodeDir"].ToString(), ref typeNum);
            }
            
        }

        private string GetTemplateContent()
        {
            StringBuilder sb=new StringBuilder ();

            sb.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
            sb.Append("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
            sb.Append("<head>\r\n");
            sb.Append("    <title>{$MetaTitle}</title>\r\n");
            sb.Append("    <meta name=\"description\" content=\"{$MetaDescription}\" />\r\n");
            sb.Append("    <meta name=\"keywords\" content=\"{$MetaKeyword}\" />\r\n");
            sb.Append("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
            sb.Append("</head>\r\n");
            sb.Append("<body>\r\n");
            sb.Append("</body>\r\n");
            sb.Append("</html>\r\n");
            return sb.ToString();
        }

        //zip压缩
        private void dlZipDir(string strFileName)
        {
            MemoryStream ms = null;
            Response.ContentType = "application/octet-stream";
            strFileName = HttpUtility.UrlEncode(strFileName).Replace('+', ' ');
            Response.AddHeader("Content-Disposition", "attachment;   filename=" + strFileName + ".zip");
            ms = new MemoryStream();
            zos = new ZipOutputStream(ms);
            addZipEntry(templatePath);
            zos.Finish();
            zos.Close();
            Response.Clear();
            Response.BinaryWrite(ms.ToArray());
            Response.End();
        }

        private void addZipEntry(string zipPath)
        {
            DirectoryInfo di = new DirectoryInfo(zipPath);
            foreach (DirectoryInfo item in di.GetDirectories())
            {
                addZipEntry(item.FullName);
            }
            foreach (FileInfo item in di.GetFiles())
            {
                FileStream fs = File.OpenRead(item.FullName);
                byte[] buffer = new byte[fs.Length];
                fs.Read(buffer, 0, buffer.Length);
                string strEntryName = item.FullName.Replace(templatePath, "");
                ZipEntry entry = new ZipEntry(strEntryName);
                zos.PutNextEntry(entry);
                zos.Write(buffer, 0, buffer.Length);
                fs.Close();
            }
        }
    }
}
