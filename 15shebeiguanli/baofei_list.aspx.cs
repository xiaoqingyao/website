using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class baofei_list : System.Web.UI.Page
{
    SqlCommand sqlcom;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
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
        string sqlstr = "select * from baoxiu ";
        SqlDataAdapter ada = new SqlDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "baoxiu");

        if (ds.Tables["baoxiu"].Rows.Count > 0)
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       //删除数据处理，然后绑定
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "delete from baoxiu where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";

        sqlcom = new SqlCommand(sqlstr, conn);

        sqlcom.ExecuteNonQuery();
        conn.Close();
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //编辑处理，修改，取消等，然后绑定数据
        GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //主要是修改处理事件
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "update baoxiu set s_yuanyin='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim() + "' where id='"
            + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new SqlCommand(sqlstr, conn);
        sqlcom.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //主要是点击取消时用的事件
        GridView1.EditIndex = -1;
        Bind();
    }
}
