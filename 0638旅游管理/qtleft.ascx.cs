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

public partial class qtleft : System.Web.UI.UserControl
{
    public string ngg;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null && Session["userip"] != null)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
        }
        else
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
        if (!IsPostBack)
        {
            string sql;
            sql = "select top 8 * from youqinglianjie order by id desc";
            getdatayqlj(sql);
            sql = "select content from dx where leibie='系统公告'";
            DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            ngg = result.Tables[0].Rows[0][0].ToString();
        }
        lb.Items.Add("旅游资讯");
    }
    private void getdatayqlj(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                DataGridyqlj.DataSource = result.Tables[0];
                DataGridyqlj.DataBind();
            }
            else
            {
                DataGridyqlj.DataSource = null;
                DataGridyqlj.DataBind();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        //if (cx.Text.ToString().Trim() == "毕业生")
        //{
        sql = "select * from yonghuzhuce where yonghuming='" + TextBox1.Text.ToString().Trim() + "' and mima='" + TextBox2.Text.ToString().Trim() + "' and issh='是' ";
        //}
        //else
        //{
        //    sql = "select * from gongsi where yonghuming='" + TextBox1.Text.ToString().Trim() + "' and mima='" + TextBox2.Text.ToString().Trim() + "' and issh='是' ";
        //}
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text.ToString().Trim();
                Session["cx"] = "注册用户";
                // Session["userxm"] = result.Tables[0].Rows[0]["jiachangxingming"].ToString().Trim();
                //if (cx.Text.ToString().Trim() == "公司")
                //{
                //    Session["gsmc"] = result.Tables[0].Rows[0]["gongsimingcheng"].ToString().Trim();
                //}
                //else
                //{
                //    Session["qtuserxm"] = result.Tables[0].Rows[0]["xingming"].ToString().Trim();
                //}
                Session["userip"] = Page.Request.UserHostAddress;
                Response.Write("<script>javascript:alert('登陆成功!');location.href='default.aspx';</script>");
            }
            else
            {
                Response.Write("<script>javascript:alert('登陆失败，用户名或密码错误，或您的帐号未经审核！');location.href='default.aspx';</script>");
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("userreg.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("news.aspx?lb=1&keyword="+keyword.Text.ToString().Trim());
    }
    protected void Button5_Click1(object sender, EventArgs e)
    {
        Response.Redirect("news.aspx?lb="+lb.Text.ToString().Trim()+"&keyword=" + keyword.Text.ToString().Trim());
    }
}
