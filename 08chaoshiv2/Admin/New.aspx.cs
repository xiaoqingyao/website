using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class New : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.TextBox2.Text = Session["username"].ToString();
            if (Request["ID"] != null)
            {
                InitData();
            } 
        } 

    } 
    protected void InitData()
    {
        string id = Request["ID"].ToString();
        try
        {
            string sql = "select * from tb_News where NewsID=" + id;
            DataTable dt = DBHelper.GetDataSet(sql).Tables[0];
            if (dt.Rows.Count > 0)
            {
                this.TextBox1.Text = dt.Rows[0]["NewsTitle"].ToString();
                this.TextBox2.Text = dt.Rows[0]["FaBuRen"].ToString();
                this.WebEditor1.Text = dt.Rows[0]["NewsContent"].ToString();
            } 
        } 
        catch
        {
        } 
    } 

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        if (Request["ID"] != null)
        {
            string id =Request["ID"].ToString();
            sql = "update tb_News set NewsTitle='" + TextBox1.Text +"',FaBuRen='"+this.TextBox2.Text+"',NewsContent='"+this.WebEditor1.Text+ "' where NewsID=" + id;
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');window.location.href='New_List.aspx'</script>");
            } 
            else
            {
                Response.Write("<script>javascript:alert('系统错误，您没有设置好数据库的连接！或您输入了一些非法字符！');</script>");
            } 
        } 
        else
        {
            sql = "insert into tb_News(NewsTitle,FaBuRen,NewsContent) values('" + this.TextBox1.Text.Trim() + "','" + this.TextBox2.Text + "','" + this.WebEditor1.Text + "')";
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');window.location.href='New_List.aspx'</script>");
            } 
            else
            {
                Response.Write("<script>javascript:alert('系统错误，您没有设置好数据库的连接！');</script>");
            } 
        } 
    } 
    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.TextBox2.Text="";
        this.WebEditor1.Text = "";

    } 
} 