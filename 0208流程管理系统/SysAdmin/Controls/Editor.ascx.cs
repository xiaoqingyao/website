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

// 更新日期        更新人      更新原因/内容
// 2010-9-7        胡志瑶      修改属性Width，由int型改为string型
namespace AllPower.Web.Admin.Controls
{
    public partial class Editor : UserControl
    {
        AllPower.Config.SiteParamConfig pci;
        AllPower.Web.Admin.AdminPage ap=new AdminPage ();
        private string _width;
        private int _height;
        //private string _content;
        public string strEditor = string.Empty;
        public int _editorType = 0;

        public string width
        {
            set { _width = value; }
            get { return _width; }
        }
        public int height
        {
            set { _height = value; }
            get { return _height; }
        }
        public string Content
        {
            set { txtEditorContent.Text = value; }
            get { return txtEditorContent.Text; }
        }

        public int EditorType
        {
            set { _editorType = value; }
            get { return _editorType; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            pci = AllPower.Config.SiteParam.GetConfig(ap.GetSiteParamPath);
            if (pci.EditControl == "eWebEditor")
            {
                txtEditorContent.Attributes.Add("style", "display:none");
            }
        }

        public string GetEditor()
        {
            
            StringBuilder sbEditor = new StringBuilder("");
            AllPower.Config.UploadConfig objUpload = AllPower.Config.Upload.GetConfig(ap.GetUploadImgPath);
            switch (pci.EditControl)
            {
                case "CKEditor":
                    sbEditor.Append("<script type=\"text/javascript\" src=\"../Editor/ckeditor/ckeditor.js\"></script><link href=\"../Editor/ckeditor/content.css\" rel=\"stylesheet\" type=\"text/css\" />");
                    if (EditorType == 0)
                    {
                        sbEditor.Append("<script type=\"text/javascript\">var " + this.ID + "$txtEditorContent");
                        sbEditor.Append("$$ckeditor$$obj = CKEDITOR.replace('" + this.ID + "$txtEditorContent', { linkUploadAllowedExtensions: '" + objUpload.UploadFilesType + "|pdf'");
                        sbEditor.Append(", nodeId: 1,language:'zh-cn', watermark: false, height: '" + height + "px', toolbar: 'ContentFull', modelId: 1, ");
                        sbEditor.Append("flashUploadAllowedExtensions: '" + objUpload.UploadMediaType + "', width: '" + width + "', imageUploadAllowedExtensions: '" + objUpload.UploadImageType + "'");
                        sbEditor.Append("  , skin: 'blue', thumbnail: false, fileRecord: true, fieldName: 'Content', wordPic: false, flashUpload: true, imageUpload: true, ");
                        sbEditor.Append("linkUpload: true, foreground: false, moduleName: '' }); </script>");
                    }
                    else
                    {
                        sbEditor.Append("<script type=\"text/javascript\">    var " + this.ID + "$txtEditorContent$$ckeditor$$obj = CKEDITOR.replace('" + this.ID + "$txtEditorContent', { language: 'zh-cn', height: '" + height + "px',width:'" + width + "' }); </script>");
                    }
                    break;

                case "eWebEditor":
                    
                    if (EditorType == 0)
                    {
                        sbEditor.Append("<iframe id=\"eWebEditor" + this.ID + "\" src=\"../Editor/eWebEditor/ewebeditor.htm?id=" + this.ID + "$txtEditorContent&amp;style=standard650&amp;skin=blue2\" width=\"" + width + "\" frameborder=\"0\" height=\"" + height + "\" scrolling=\"no\"></iframe>");
                    }
                    else
                    {
                        sbEditor.Append("<iframe id=\"eWebEditor" + this.ID + "\" src=\"../Editor/eWebEditor/ewebeditor.htm?id=" + this.ID + "$txtEditorContent&amp;style=mini500&amp;skin=blue2\" width=\"" + width + "\" frameborder=\"0\" height=\"" + height + "\" scrolling=\"no\"></iframe>");
                    }
                    break;
            }

            return sbEditor.ToString();
        }
    }
}