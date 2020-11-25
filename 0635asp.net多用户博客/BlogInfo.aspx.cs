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
using System.Data.SqlClient;

public partial class BlogInfo : System.Web.UI.Page
{
    string id;
    protected string jieshao, hits;
    protected void Page_Load(object sender, EventArgs e)
    {
        id=Request.QueryString["id"];
        if (!IsPostBack)
        {
            DataTable dt = DB.getDataTable("select * from Blog where BlogId=" + id);
            if (dt.Rows.Count > 0)
            {
                DB.ExecuteSql("update Blog set hits=hits+1 where Blogid=" + id);

                BlogName.Text = dt.Rows[0]["BlogName"].ToString();
                jieshao = DB.ConvertStringToHtml(dt.Rows[0]["jieshao"].ToString());
                hits = dt.Rows[0]["hits"].ToString();
                //username = dt.Rows[0]["username"].ToString();
                ltlusername.Text = dt.Rows[0]["username"].ToString();
                typename.Text = dt.Rows[0]["typename"].ToString();
                addtime.Text = dt.Rows[0]["addtime"].ToString();

                rptList.DataSource = DB.getDataTable("select * from comment where isaudit=1 and blogid=" + id + " order by commentid desc");
                rptList.DataBind();
            }
        }
    }

    /// <summary>
    /// 博客评论
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql2 = string.Empty;
        sql2 = "insert into comment(commentuser,commentcontent,blogid,blogname) ";
        sql2 += "values('" + txtCommentUser.Text + "','" + txtCommentContent.Text + "','" + id + "','" + BlogName.Text + "')";

        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd = new SqlCommand(sql2, cn);
        cmd.ExecuteNonQuery();
        cn.Close();
        cn.Dispose();
        Common.ShowMessage(this.Page, "评论成功。", "", Request.Url.AbsoluteUri);
    }


    /// <summary>
    /// 收藏博客
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["memberinfo"] != null)
        {
            string memberid = Server.UrlDecode(Request.Cookies["memberinfo"]["MemberId"]);
            string content = "";
            if (DB.getDataTable("select * from guanzhu where memberid=" + memberid + " and picid=" + id).Rows.Count > 0)
            {
                Common.ShowMessage(this.Page, "您之前已经收藏过了！", "", Request.Url.AbsoluteUri);
                return;
            }
            else
            {
                content = "<a href=\"bloginfo.aspx?id=" + id + "\" target=\"_blank\">" + BlogName.Text + "</a>";
            }

            DB.ExecuteSql("insert into guanzhu values('" + memberid + "','" + content + "','" + id + "',getdate())");

            Common.ShowMessage(this.Page, "收藏成功！", "", Request.Url.AbsoluteUri);
        }
        else
        {
            JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
            return;
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

            if (DB.getDataTable("select * from haoyou where memberid=" + memberid + " and tousername='" + ltlusername.Text + "'").Rows.Count > 0)
            {
                Common.ShowMessage(this.Page, "您之前已经加过好友了！", "", Request.Url.AbsoluteUri);
                return;
            }

            DB.ExecuteSql("insert into haoyou values('" + memberid + "','" + ltlusername.Text + "')");

            Common.ShowMessage(this.Page, "加好友成功！", "", Request.Url.AbsoluteUri);
        }
        else
        {
            JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
            return;
        }
    }
}
