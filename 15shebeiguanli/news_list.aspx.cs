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

public partial class news_list : System.Web.UI.Page
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
        string sqlstr = "select * from info ";
        SqlDataAdapter ada = new SqlDataAdapter(sqlstr, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "info");
        //ds = dss.ExceDSS(strQuery, "FindEmployerInfo","machine");

        if (ds.Tables["info"].Rows.Count > 0)
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
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Bind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "delete from info where id='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";

        sqlcom = new SqlCommand(sqlstr, conn);

        sqlcom.ExecuteNonQuery();
        conn.Close();
        Bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string sqlstr = "update info set news_title='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "',news_content='"
            + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "' where id='"
            + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        sqlcom = new SqlCommand(sqlstr, conn);
        sqlcom.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;
        Bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bind();
    }
}
