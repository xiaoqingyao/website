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

public partial class WuYeMoney : System.Web.UI.Page {
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
		if (Session["UserName"] == null || Session["UserCode"]== null) {
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
        //string sql = "select a.*, b.户主 from 物业费 a, 住户 b where 1=1";
        // 在此处放置用户代码以初始化页面
        string sql = "select * from 物业费明细 t where t.住户代码=" + Session["UserCode"].ToString();
        
		//string username = Txt_Name.Text.Trim();
		//if (username != "") {
		//    sql += "and b.户主 like '%" + username + "%'";//" and 住户代码=(select 住户代码 from 住户 where 户主='" + username + "')";
		//}
        //Response.Write(sql);
        DataTable dt = SQL.GetTable(sql);
        double aa = 0;
        double bb = 0;
        foreach (DataRow item in dt.Rows)
        {
            if (item["是否缴费"].ToString() == "0")
            {
                aa += Convert.ToDouble(item["总金额"].ToString());
            }
            if (item["是否缴费"].ToString() == "1")
            {
                bb += Convert.ToDouble(item["总金额"].ToString());
            }
        }
        Label2.Text = bb.ToString();
        Label3.Text = aa.ToString();
        GridView1.DataSource = dt;
        GridView1.DataBind();
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
