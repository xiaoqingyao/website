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

public partial class info_up : System.Web.UI.Page
{
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
        string strsql = "select * from reg where users='" + Session["userinfo"].ToString() + "'";
        SqlDataAdapter ada = new SqlDataAdapter(strsql, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "reg");

        if (ds.Tables["reg"].Rows.Count > 0)
        {
            Session["id"] = ds.Tables[0].Rows[0]["id"].ToString();
            users.Text = ds.Tables[0].Rows[0]["users"].ToString();
            //pass.Text = ds.Tables[0].Rows[0]["pass"].ToString();
            sex.Text = ds.Tables[0].Rows[0]["sex"].ToString();
            tel.Text = ds.Tables[0].Rows[0]["tel"].ToString();
            qq.Text = ds.Tables[0].Rows[0]["qq"].ToString();
            email.Text = ds.Tables[0].Rows[0]["email"].ToString();
            beizhu.Text = ds.Tables[0].Rows[0]["beizhu"].ToString();

        }
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string strsql;
        string users1 = users.Text.Trim();
        string pass1 = pass.Text.Trim();
        string sex1 = sex.Text.Trim();
        string tel1 = tel.Text.Trim();
        string qq1 = qq.Text.Trim();
        string email1 = email.Text.Trim();
        string beizhu1 = beizhu.Text.Trim();
        if (users.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空!');location='info_up.aspx'</script>");
        }
        if (pass.Text.Length == 0)
        {
            strsql = "update reg set users='" + users1 + "',sex='" + sex1 + "',tel='" + tel1 + "',qq='" + qq1 + "',email='" + email1 + "',beizhu='" + beizhu1 + "' where id='" + Session["id"] + "'";
        }
        else

        {
            strsql = "update reg set users='" + users1 + "',pass='" + pass1 + "',sex='" + sex1 + "',tel='" + tel1 + "',qq='" + qq1 + "',email='" + email1 + "',beizhu='" + beizhu1 + "' where id='" + Session["id"] + "'";
        }
       
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('更新成功!');location.history(-1);</script>");
        conn.Close();

    }
}
