using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AllPower.Common;
using AllPower.Model.SysManage;
using System.Data;
namespace AllPower.WEB.SysAdmin
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Label1.Text = SecurityHelper.MD5("super");
        }
    }
}