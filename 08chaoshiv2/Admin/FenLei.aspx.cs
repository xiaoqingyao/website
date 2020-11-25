using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_FenLei : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
            string sql = "select * from tb_GoodsType where TypeID=" + id;
            DataSet ds = DBHelper.GetDataSet(sql);
            if (ds.Tables[0].Rows.Count > 0)
            {
                this.TextBox1.Text = ds.Tables[0].Rows[0]["TypeName"].ToString();
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
            sql = "update tb_GoodsType set TypeName='" + TextBox1.Text + "' where TypeID=" + id;
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');</script>");
            } 
            else
            {
                Response.Write("<script>javascript:alert('系统错误，您没有设置好数据库的连接！或您输入了一些非法字符！');</script>");
            } 
        } 
        else
        {
            sql = "insert into tb_GoodsType(TypeName) values('" + this.TextBox1.Text.Trim() + "')";
            bool b = DBHelper.ExecSql(sql);
            if (b)
            {
                Response.Write("<script>javascript:alert('操作成功');</script>");
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
    } 
} 