using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Xml;
using System.Text;
using System.IO;
using System.Net;
using BLL;
using COMM;

public partial class gongyingshang : System.Web.UI.Page
{
    SqlCommand sqlcom;
    string strCon = ConfigurationManager.AppSettings["ConnectionString"].ToString();
    protected BLL.User_BLL testbll = new User_BLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string g_no1 = g_no.Text.Trim();
        string g_name1 = g_name.Text.Trim();
        string g_dizhi1 = g_dizhi.Text.Trim();
        string g_tel1 = g_tel.Text.Trim();
        string g_jianjie1 = g_jianjie.Text.Trim();
        if (g_no.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('供应商编号不能为空!');location='gongyingshang.aspx'</script>");
        }
        //插入语句，用来将数据提交到数据库当中的关键代码
        string strsql = "insert into gongyingshang(g_no,g_name,g_dizhi,g_tel,g_jianjie,shijian) values(N'" + g_no1 + "',N'" + g_name1 + "',N'" + g_dizhi1 + "',N'" + g_tel1 + "',N'" + g_jianjie1 + "','" + DateTime.Now.ToShortDateString() + "') ";
        try
        {
            int row = (int)testbll.executeDAO("InsertInfo_BLL2", new object[] { strsql });
            if (row > 0)
            {
                //Session["username"] = username.Text.Trim();
                Response.Write("<script language=javascript>alert('供应商添加成功!');location.href='gongyingshang.aspx';</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('对不起，您的信息添加失败!');</script>");
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

        //清空变量
        g_no.Text = "";
        g_name.Text = "";
        g_dizhi.Text = "";
        g_tel.Text = "";
        g_jianjie.Text = "";
        

    }
    protected SqlConnection GetConnection()
    {
        string conn = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(conn);
        return myConn;

    }
    public void Bind()
    {

        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "select * from gongyingshang ";
        SqlDataAdapter ada = new SqlDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "gongyingshang");

        if (ds.Tables["gongyingshang"].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataKeyNames = new string[] { "id" };//----
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Response.Write("<script lanuage=javascript>alert('没有相关数据！');</script>");
        }
        conn.Close();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //分页处理，然后绑定
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //主要是点击取消时用的事件
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //删除数据处理，然后绑定
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "delete from gongyingshang where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";

        sqlcom = new SqlCommand(sqlstr, conn);

        sqlcom.ExecuteNonQuery();
        
        Bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //主要是修改处理事件
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "update gongyingshang set g_dizhi='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "',g_tel='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "' where id='"
            + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new SqlCommand(sqlstr, conn);
        sqlcom.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //编辑处理，修改，取消等，然后绑定数据
        GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
}
