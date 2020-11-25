using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class LiuYan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["MemberName"] != null)
            {
                this.TextBox1.Text = Session["MemberName"].ToString();
            }
            GetInfo();
        }
    }
    private void GetInfo()
    {
        string Sql = "select * from TB_LiuYan order by MessageTime desc";
        DataSet result = DBHelper.GetDataSet(Sql);
        this.dlTopic.DataSource = result.Tables[0];
        this.dlTopic.DataBind();


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string uname = "";
        if (this.TextBox1.Text != "")
            uname = this.TextBox1.Text;
        else
            uname = "匿名";
        string sql = "insert into TB_LiuYan(MessageUser,MessageContent) values ('" + uname + "','" + this.WebEditor1.Text + "')";
        bool b=DBHelper.ExecSql(sql);
        if (b)
        {
            GetInfo();
            Response.Write("<script language='javascript'>alert('留言成功！');document.location=document.location;</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('留言失败！');document.location=document.location;</script>");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.WebEditor1.Text = "";
    }
}