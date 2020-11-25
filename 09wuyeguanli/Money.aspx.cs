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

public partial class Money : System.Web.UI.Page {
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
		string sql = "select * from (select row_number() over(order by 水电气费.住户代码 asc) as rownum,水电气费.* from 水电气费) t where t.rownum >= 0 and t.rownum < 100000 and t.住户代码=" + Session["UserCode"].ToString();
        DataTable dt = SQL.GetTable(sql);
        double aa = 0;
        double bb = 0;
        foreach (DataRow item in dt.Rows)
        {
            if (item["是否缴费"].ToString() == "0")
            {
                aa += Convert.ToDouble(item["水费金额"].ToString()) + Convert.ToDouble(item["电费金额"].ToString()) + Convert.ToDouble(item["气费金额"].ToString());
            }
            if (item["是否缴费"].ToString() == "1")
            {
                bb += Convert.ToDouble(item["水费金额"].ToString()) + Convert.ToDouble(item["电费金额"].ToString()) + Convert.ToDouble(item["气费金额"].ToString());
            }
        }
        Label2.Text = bb.ToString();
        Label3.Text = aa.ToString();
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
