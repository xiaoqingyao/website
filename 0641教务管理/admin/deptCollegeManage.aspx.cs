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
using System.Data.OleDb;

public partial class admin_deptCollege : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("../default.aspx");
        }
        else if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        OleDbDataAdapter myda = new OleDbDataAdapter("select * from tb_deptCollege order by deptcollegeId", conn);
        DataSet myds = new DataSet();
        myda.Fill(myds, "collegeinfo");
        GridView1.DataSource = myds;
        GridView1.DataKeyNames = new string[] { "id" };
        GridView1.DataBind();
        conn.Close();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        string strsql = "select * from tb_deptCollege order by deptcollegeID";
        baseClass.BindDG(GridView1, "ID", strsql, "collegeinfo");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sqlstr = "delete from tb_deptCollege where id=" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "";
        baseClass.OperateData(sqlstr);
        bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        OleDbConnection conn = baseClass.GetCon();
        conn.Open();
        string sqlstr = "update tb_deptcollege set deptCollegeId='" + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[0].Controls[0])).Text.ToString().Trim() + "',deptCollegeName='" + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "',deptCollegeTel='" + ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "' where id=" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "";
        OleDbCommand cmd = new OleDbCommand(sqlstr, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        GridView1.EditIndex = -1;
        bind();
    }
}
