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

public partial class memberInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = DB.getDataTable("select * from member where memberid=" + Request.QueryString["id"]);
            if (dt.Rows.Count == 1)
            {
                txtUserName.Text = dt.Rows[0]["username"].ToString();
                txtTitle.Text = dt.Rows[0]["membername"].ToString();
                ltlRegTime.Text = Convert.ToDateTime(dt.Rows[0]["addtime"]).ToString("yyyy-MM-dd HH:mm:ss");
                tel.Text = dt.Rows[0]["tel"].ToString();
                ltlblog.Text = DB.getDataTable("select count(0) from blog where memberid=" + Request.QueryString["id"]).Rows[0][0].ToString();
                ltlpic.Text = DB.getDataTable("select count(0) from pic where memberid=" + Request.QueryString["id"]).Rows[0][0].ToString();
            }
        }
    }


    /// <summary>
    /// 加好友
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["memberinfo"] != null)
        {
            string memberid = Server.UrlDecode(Request.Cookies["memberinfo"]["memberid"]);
            string username = Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"]);

            if (DB.getDataTable("select * from haoyou where memberid=" + memberid + " and tousername='" + txtUserName.Text + "'").Rows.Count > 0)
            {
                Common.ShowMessage(this.Page, "您之前已经加过好友了！", "", Request.Url.AbsoluteUri);
                return;
            }

            DB.ExecuteSql("insert into haoyou values('" + memberid + "','" + txtUserName.Text + "')");

            Common.ShowMessage(this.Page, "加好友成功！", "", Request.Url.AbsoluteUri);
        }
        else
        {
            JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
            return;
        }
    }

}
