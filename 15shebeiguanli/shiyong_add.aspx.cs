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

public partial class shiyong_add : System.Web.UI.Page
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
        y_name.Text = Session["userinfo"].ToString();
        string strid = Request.QueryString["s_no"];
        string strsql = "select * from shebei where id='" + strid + "'";
        SqlDataAdapter ada = new SqlDataAdapter(strsql, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "shebei");
        //ds = dss.ExceDSS(strQuery, "FindEmployerInfo","machine");

        if (ds.Tables["shebei"].Rows.Count > 0)
        {
            Session["s_no"] = ds.Tables[0].Rows[0]["s_no"].ToString();
            Session["s_name"] = ds.Tables[0].Rows[0]["s_name"].ToString();

        }
        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("shebei_look.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string y_name1 = y_name.Text.Trim();
        string y_tel1 = y_tel.Text.Trim();
        string y_qingkuang1 = y_qingkuang.Text.Trim();
        string h_shijian1 = h_shijian.Text.Trim();

        if (y_qingkuang.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('机器运作情况不能为空!');</script>");
        }
        string strsql = "insert into shiyong(y_name,s_no,s_name,y_qingkuang,y_tel,y_shijian,h_shijian) values(N'" + y_name1 + "',N'" + Session["s_no"].ToString() + "',N'" + Session["s_name"].ToString() + "',N'" + y_tel1 + "',N'" + y_qingkuang1 + "','" + DateTime.Now.ToShortDateString() + "',N'" + h_shijian1 + "') ";
        SqlCommand cmd = new SqlCommand(strsql, conn);

        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('添加成功!');location='shebei_look.aspx'</script>");
    }
}
