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
using AllPower.Common;
using AllPower.Config;

namespace AllPower.WEB.SysAdmin.upfiles
{
    public partial class upfile : AllPower.Web.Admin.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AllPower.Config.UploadConfig upload = AllPower.Config.Upload.GetConfig(GetUploadImgPath);
            //Response.Write(upload.UploadControl + "?" + Request.ServerVariables["QUERY_STRING"]);
            Response.Redirect(upload.UploadControl + "?" + Request.ServerVariables["QUERY_STRING"]);
        }
    }
}
