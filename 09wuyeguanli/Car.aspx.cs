using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;

public partial class Car : System.Web.UI.Page {
    public string zjl = "";
    public string pagecount = "";
	public string cruentpage = "";
	public string userinfo = "";



	protected void Page_Load(object sender, EventArgs e) {
		if (Session["UserName"] == null || Session["UserCode"] == null) {
			Response.Write("<script>window.alert('对不起，无权限浏览，请您登录后再试！');window.location.href='main.aspx'</script>");
			return;
		}
		if (!IsPostBack) {
			userinfo = Session["UserName"].ToString();
			Binds();
		} else {
			Label1.Text = "";
		}
	}

    private void Binds() {
        //GridView1.PageIndex = 0
        //string sql = "select a.*, b.户主 from 车位管理 a, 住户 b where 1=1";
		string sql = "select * from (select row_number() over(order by 车位管理.住户代码 asc) as rownum,车位管理.* from 车位管理) t where t.rownum >= 0 and t.rownum < 100000 and t.住户代码=" + Session["UserCode"].ToString();
        
		//string username = Txt_Name.Text.Trim();
		//if (username != "") {
		//    sql += "and b.户主 like '%" + username + "%'";//" and 住户代码=(select 住户代码 from 住户 where 户主='" + username + "')";
		//}
        //Response.Write(sql);
        DataTable dt = SQL.GetTable(sql);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        pagecount = GridView1.PageCount.ToString();
        cruentpage = (GridView1.CurrentPageIndex + 1).ToString();
        zjl = dt.Rows.Count.ToString();
        if (pagecount == "1") {
            lbtfirst.Enabled = false;
            lbtprev.Enabled = false;
            lbtnext.Enabled = false;
            lbtlast.Enabled = false;
        } else {
            if (cruentpage == "1") {
                lbtfirst.Enabled = false;
                lbtprev.Enabled = false;
                lbtnext.Enabled = true;
                lbtlast.Enabled = true;
            }
            if (GridView1.CurrentPageIndex + 1 == GridView1.PageCount) {
                lbtfirst.Enabled = true;
                lbtprev.Enabled = true;
                lbtnext.Enabled = false;
                lbtlast.Enabled = false;
            }
        }
    }
    //首页
    protected void lbtfirst_Click(object sender, EventArgs e) {
        GridView1.CurrentPageIndex = 0;
        Binds();
    }
    //上一页
    protected void lbtprev_Click(object sender, EventArgs e) {
        GridView1.CurrentPageIndex--;
        Binds();
    }
    //下一页
    protected void lbtnext_Click(object sender, EventArgs e) {
        GridView1.CurrentPageIndex++;
        Binds();
    }
    //末页
    protected void lbtlast_Click(object sender, EventArgs e) {
        GridView1.CurrentPageIndex = GridView1.PageCount - 1;
        Binds();
    }
    protected void Button4_Click(object sender, EventArgs e) {
        Response.Redirect("room.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e) {
        Response.Redirect("room.aspx");
    }
    /// <summary>
    /// 查询
    /// </summary>
    protected void BtnQuery_Click(object sender, EventArgs e) {
        Binds();
    }
}
