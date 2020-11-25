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

public partial class dafu_add : System.Web.UI.Page
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
        string strid = Request.QueryString["s_no"];
        string strsql = "select * from message where id='" + strid + "'";
        SqlDataAdapter ada = new SqlDataAdapter(strsql, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "message");
        //ds = dss.ExceDSS(strQuery, "FindEmployerInfo","machine");

        if (ds.Tables["message"].Rows.Count > 0)
        {
            id.Text = ds.Tables[0].Rows[0]["id"].ToString();
        }
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string id1 = id.Text.Trim();
        string message_dafu1 = message_dafu.Text.Trim();

        if (message_dafu.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('答复内容不能为空!');</script>");
        }
        string strsql = "update message set message_dafu='" + message_dafu1 + "',message_state='1',dafu_shijian='" + DateTime.Now.ToShortDateString() + "' where id='" + id1 + "'";
        SqlCommand cmd = new SqlCommand(strsql, conn);

        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('答复成功!');location='message_list.aspx'</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        message_dafu.Text = "";
        Response.Redirect("message_list.aspx");
    }
}
