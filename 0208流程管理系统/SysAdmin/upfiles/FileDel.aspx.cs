using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

namespace TOPRAND.WEB.WebManage.FileUpload
{
    public partial class FileDel : System.Web.UI.Page
    {
        private string pFile;
        private string fileName;
        private string formName;
        private string elementName;
        private string selectIndex;
        private string controlType;
        protected void Page_Load(object sender, EventArgs e)
        {
            pFile = Request.QueryString["pFile"].ToString();
            formName = Request.QueryString["FormName"];
            elementName = Request.QueryString["ElementName"];
            selectIndex = Request.QueryString["SelectIndex"];
            controlType = Request.QueryString["ControlType"];
            
            if (!Page.IsPostBack)
            {
                string pass = Request.QueryString["pass"];
                if (pass == "" || pass == null)
                {
                    Response.Write("<script language=\"javascript\">if(confirm('È·¶¨É¾³ý£¿'))location.href='FileDel.aspx?pass=True&pFile=" + pFile + "&FormName=" + formName + "&ElementName=" + elementName + "&SelectIndex=" + selectIndex + "&ControlType=" + controlType + "';else window.close();</script>");
                }
                else if (pass == "True")
                {
                    DelUploadFile();
                }
            }
        }

        private void DelUploadFile()
        {

            if (controlType == "0")
            {
                string[] arrFile = pFile.Split(',');
                for (int i = 0; i < arrFile.Length; i++)
                {
                    if (arrFile[i].Trim() != "")
                    {
                        if (arrFile[i].IndexOf(":") != -1)
                        {
                            DelFile(arrFile[i]);
                        }
                        else
                        {
                            DelFile(Server.MapPath(arrFile[i]));
                        }
                    }
                }

                string options = null;
                for (int i = selectIndex.Split(',').Length - 1; i >= 0; i--)
                {
                    options += "window.opener.document.all." + elementName + ".options.remove('" + selectIndex.Split(',')[i] + "');";
                }
                string writeOut = "<script language='javascript'>" + options + "  tmp=eval(\"opener." + formName + "." + elementName + "_Look\");self.close();</script>";
                Response.Write(writeOut);
            }
            else if (!string.IsNullOrEmpty(pFile))
            {
                if (pFile.IndexOf(":") != -1)
                {
                    DelFile(pFile);
                }
                else
                {
                    DelFile(Server.MapPath(pFile));
                }
                string writeOut = "<script language='javascript'>tmp=eval(\"opener." + formName + "." + elementName + "\");tmp.value='';tmp=eval(\"opener." + formName + "." + elementName + "_Del\");if(tmp){tmp.disabled=true;}tmp=eval(\"opener." + formName + "." + elementName + "_Look\");if(tmp){tmp.disabled=true;}self.close();</script>";
                Response.Write(writeOut);
            }
        }

        void DelFile(string path)
        {
            if (File.Exists(path))
            {
                try
                {
                    File.Delete(path);
                }
                catch
                {
                }
            }
        }
    }
}
