using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Complaint : System.Web.UI.Page
{
     public string zjl = "";
     public string pagecount = "";
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
        
		string sql = "select * from (select row_number() over(order by 住户投诉.住户代码 asc) as rownum,住户投诉.* from 住户投诉) t where t.rownum >= 0 and t.rownum < 100000 and t.住户代码=" + Session["UserCode"].ToString();

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
            Response.Redirect("ComplaintUpdate.aspx?ID=" + Key);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            //格式化显示日期
            e.Row.Cells[4].Text = e.Row.Cells[4].Text.ToString();
        }
    }
    }
