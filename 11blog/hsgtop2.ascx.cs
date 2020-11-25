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

public partial class hsgtop2 : System.Web.UI.UserControl
{

    //public string zhuceclass = "";//注册的样式内容
    //public string dengluclass = "";//登录的样式内容
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["huiyuanname"] == null)
        {
            denglu.Visible = true;
            gerenzhongxin.Visible = false;
        }
        else
        {
            denglu.Visible = false;
            gerenzhongxin.Visible = true;
        }
    }
}
