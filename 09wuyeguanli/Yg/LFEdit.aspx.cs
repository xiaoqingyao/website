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

public partial class Yg_LFEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           
           // TextBox1.Text = DateTime.Now.ToString();
            if (Request.QueryString["ID"] != null)
            {
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 来访信息 where 来访代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    TextBox5.Text = dt.Rows[0]["来访人"].ToString();
                    TextBox1.Text = dt.Rows[0]["来访时间"].ToString();
                    TextBox3.Text = dt.Rows[0]["被访人"].ToString();
                    TextBox4.Text = dt.Rows[0]["离开时间"].ToString();
                    TextBox2.Text = dt.Rows[0]["值班人员"].ToString();
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("LFList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //根据不同的标志  添加或修改 住户报修
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 来访信息 set 来访人='" + TextBox5.Text  + "',来访时间='" + this.TextBox4.Text + "',离开时间='" + TextBox4.Text +"',被访人='"+TextBox3.Text+ "',值班人员='" + TextBox2.Text + "' where 来访代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            SQL.ExecData("insert into 来访信息(来访人,来访时间,离开时间,被访人,值班人员) values('" + TextBox5.Text + "'," + TextBox1.Text + ",'" + TextBox4.Text + "','" + TextBox3.Text + "','" + TextBox2.Text + "')");
        }
        Response.Redirect("LFList.aspx");
    }
}