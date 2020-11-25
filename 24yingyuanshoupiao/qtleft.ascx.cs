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
            cx.Items.Add("注册用户");
            
        }
        string sql;
        sql = "select top 8 * from youqinglianjie order by id desc";
        getdata4(sql);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        if (cx.Text.ToString().Trim() == "注册用户")
        {
            sql = "select * from zhuceyonghu where yonghuming='" + TextBox1.Text.ToString().Trim() + "' and mima='" + TextBox2.Text.ToString().Trim() + "' and issh='是' ";
        }
        else
        {
            sql = "select * from gongsi where yonghuming='" + TextBox1.Text.ToString().Trim() + "' and mima='" + TextBox2.Text.ToString().Trim() + "' and issh='是' ";
        }
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                Session["username"] = TextBox1.Text.ToString().Trim();
                Session["cx"] = cx.Text.ToString().Trim();
                
                Session["userip"] = Page.Request.UserHostAddress;
                Response.Write("<script>javascript:alert('登陆成功!');location.href='index.aspx';</script>");
            }
            else
            {
                Response.Write("<script>javascript:alert('登陆失败，用户名或密码错误，或您的帐号未经审核！');location.href='index.aspx';</script>");
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (cx.Text.ToString().Trim() == "注册用户")
        {
            Response.Redirect("userreg.aspx");
        }
        else
        {
            Response.Redirect("gsreg.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("logout.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }
    private void getdata4(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                DataGrid4.DataSource = result.Tables[0];
                DataGrid4.DataBind();
            }
            else
            {
                DataGrid4.DataSource = null;
                DataGrid4.DataBind();
            }
        }
    }
}
