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

public partial class fabuhuodong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_fb_Onclick(object sender, EventArgs e)
    {
        new Class1().hsgexucute("insert into huodong(biaoti,neirong,riqi,maxrenshu,jifen) values ('" + this.txtTitle.Text + "','" + this.txtContent.Text + "','" + this.txtDate.Value + "','" + this.txtMaxRenShu.Text.Trim() + "','" + this.txtJfen.Text.Trim() + "')");
        string js = "";
        js = "<script language='javascript'>alert('{0}');window.location.replace('{1}')</script>";
        HttpContext.Current.Response.Write(string.Format(js, "发布成功!", "fabuhuodong.aspx"));
    }
}
