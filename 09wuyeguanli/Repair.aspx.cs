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

public partial class Repair : System.Web.UI.Page {
    public string zjl = "";
    //{
    //    get {
    //        return ViewState["zjl"] == null ? "" : (string)ViewState["zjl"];
    //    }
    //    set {
    //        ViewState["zjl"] = value;
    //    }
    //}
    public string pagecount = "";
//{
//        get {
//            return ViewState["pagecount"] == null ? "" : (string)ViewState["pagecount"];
//        }
//        set {
//            ViewState["pagecount"] = value;
//        }
//    }
	public string cruentpage = "";
	public string userinfo = "";


	protected void Page_Load(object sender, EventArgs e) {
		if (Session["UserName"] == null || Session["UserCode"] ==null) {
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
		string sql = "select * from (select row_number() over(order by 住户报修.住户代码 asc) as rownum,住户报修.* from 住户报修) t where t.rownum >= 0 and t.rownum < 100000 and t.住户代码=" + Session["UserCode"].ToString();

        //显示当前操作员的住户报修列表
        this.GridView1.DataSource = SQL.GetTable(sql);
        this.GridView1.DataBind();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string Key = this.GridView1.DataKeys[Convert.ToInt32(e.CommandArgument)].Value.ToString();
        if (e.CommandName == "Mod")
        {
            //传递修改的标志 跳转页面
            Response.Redirect("RepairUpdate.aspx?ID=" + Key);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            //格式化显示日期
            e.Row.Cells[1].Text = Convert.ToDateTime(e.Row.Cells[1].Text).Date.ToShortDateString();
        }
    }
}
