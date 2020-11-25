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

namespace TOPRAND.WEB.WebManage.FileUpload
{
    public partial class FileShow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showImg();
            }
        }

        private void showImg()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pFile"]))
            {
                string image =  Request.QueryString["pFile"];
                Image1.ImageUrl = image;
            }
        }
    }
}
