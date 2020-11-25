using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

using AllPower.Model.FileManage;
using AllPower.BLL.FileManage;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.Common;

namespace AllPower.WEB.SysAdmin.FileManage
{
    public partial class FileEditTxt : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }
        /// <summary>
        /// 加载相关文本文件内容
        /// </summary>
        private void PageInit()
        {
            try
            {
                string objectPath = "";
                if (!string.IsNullOrEmpty(Request.QueryString["ObjectPath"]))
                {
                    objectPath = Request.QueryString["ObjectPath"].ToString();
                    lblObjectPath.Text = objectPath;
                    string urlReferrer = Request.UrlReferrer.ToString();
                    //string urlReferrer=ath=objectPath.Substring(0, oldObjectPath.LastIndexOf("/") + 1) + "&keyword=" + Request.QueryString["keyword"] + "&page=" + Request.QueryString["page"]
                    hidUrlReferrer.Value = urlReferrer;
                    if (objectPath.IndexOf(":") == -1)
                    {
                        objectPath=objectPath.Replace ("\\","/").Replace ("//","/");
                        if (objectPath.Substring(0, 1) != "/")
                        {
                            objectPath = "/" + objectPath;
                        }

                        objectPath = Server.MapPath(objectPath);
                    }

                    if (File.Exists(objectPath))
                    {
                        string content = string.Empty;

                        FileInfo fileInfo = new FileInfo(objectPath);
                        if (fileInfo.Length > 0)
                        {
                            Encoding encoding = GetType(objectPath);

                            StreamReader sr = new StreamReader(objectPath, encoding);
                            if (sr != null)
                            {
                                content = sr.ReadToEnd();
                            }
                            content = content.Replace("\n", "");
                            txtContent.Text = content;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                WriteLog("文件管理-->加载相关文本文件出错", ex.Message, 3); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作失败！',title:'提示信息'})");
            }
        }

        protected void lnkFileManage_Click(object sender, EventArgs e)
        {
            string url = hidUrlReferrer.Value.Trim();
            if (!string.IsNullOrEmpty(url))
            {
                Response.Redirect(url);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string content = txtContent.Text.Trim();
                string objectPath = lblObjectPath.Text.Trim();
                if (objectPath.IndexOf(":") == -1)
                {
                    objectPath = Server.MapPath(objectPath);
                }
                FileStream fs = new FileStream(objectPath, FileMode.OpenOrCreate);
                byte[] objData = new UTF8Encoding().GetBytes(content);
                fs.Write(objData, 0, objData.Length);
                fs.Flush();
                fs.Close();

                Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
            }
            catch (Exception ex)
            {
                WriteLog("文件管理-->编辑文本类文件出错", ex.Message, 3); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作失败,原因是"+ex.Message .Replace ("\r\n","<br>").Replace ("\'","\\'")+"！',title:'提示信息'})");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string url = hidUrlReferrer.Value.Trim();
            if (!string.IsNullOrEmpty(url))
            {
                Response.Redirect(url);
            }
        }

        #region 获取文件编码
        private System.Text.Encoding GetType(string FilePath)
        {
            FileStream fs = new FileStream(FilePath, FileMode.Open, FileAccess.Read);
            System.Text.Encoding r = GetType(fs);
            fs.Close();
            return r;
        } 

        private System.Text.Encoding GetType(FileStream fs)
        {
            /*byte[] Unicode=new byte[]{0xFF,0xFE};  
            byte[] UnicodeBIG=new byte[]{0xFE,0xFF};  
            byte[] UTF8=new byte[]{0xEF,0xBB,0xBF};*/

            BinaryReader r = new BinaryReader(fs, System.Text.Encoding.Default);
            byte[] ss = r.ReadBytes(3);
            r.Close();
            //编码类型 Coding=编码类型.ASCII;   
            if (ss[0] >= 60)
            {
                if (ss[0] == 60 && ss[1] == 33 && ss[2] == 68)
                {
                    return System.Text.Encoding.UTF8;
                }
                else if (ss[0] == 0xFE && ss[1] == 0xFF)
                {
                    return System.Text.Encoding.BigEndianUnicode;
                }
                else if (ss[0] == 0xFF && ss[1] == 0xFE)
                {
                    return System.Text.Encoding.Unicode;
                }
                else
                {
                    return System.Text.Encoding.Default;
                }
            }
            else
            {
                return System.Text.Encoding.Default;
            }
        }
        #endregion
    }
}
