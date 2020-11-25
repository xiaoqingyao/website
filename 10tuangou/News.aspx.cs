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

public partial class News : System.Web.UI.Page
{
    CtlNews cn = new CtlNews();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string nid = System.Convert.ToString(Request["nid"]);
            DataTable dt = new DataTable();
            dt = cn.selectByNewsIdnews(nid);
            if (dt.Rows.Count > 0)
            {
                this.Label1.Text = "标题：" + System.Convert.ToString(dt.Rows[0][1]);
                this.Label2.Text = System.Convert.ToString(dt.Rows[0][2]);
                this.Label3.Text = " 发布人：" + System.Convert.ToString(dt.Rows[0][3]) + "&nbsp;&nbsp;" + "发布时间：" + System.Convert.ToString(dt.Rows[0][4]);
                Page.Title = System.Convert.ToString(dt.Rows[0][1]);
            }
        }
    }
}
