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

public partial class baoxiu_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //初始界面绑定数据
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
        string strsql = "select * from shebei where id='" + strid + "'";
        SqlDataAdapter ada = new SqlDataAdapter(strsql, conn);
        DataSet ds = new DataSet();
        ada.Fill(ds, "shebei");

        if (ds.Tables["shebei"].Rows.Count > 0)
        {
            //保存变量
            s_no.Text = ds.Tables[0].Rows[0]["s_no"].ToString();
            Session["s_name"] = ds.Tables[0].Rows[0]["s_name"].ToString();
            Session["s_danjia"] = ds.Tables[0].Rows[0]["s_danjia"].ToString();
        }
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConnection();
        conn.Open();
        string s_no1 = s_no.Text.Trim();
        string s_yuanyin1 = s_yuanyin.Text.Trim();

        if (s_yuanyin.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('报修缘由不能为空!');</script>");
        }
        string strsql = "insert into baoxiu(s_no,s_name,s_danjia,s_yuanyin,s_shijian) values(N'" + s_no1 + "',N'" + Session["s_name"].ToString() + "',N'" + Session["s_danjia"].ToString() + "',N'" + s_yuanyin1 + "','" + DateTime.Now.ToShortDateString() + "') ";
        SqlCommand cmd = new SqlCommand(strsql, conn);

        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('报修成功!');location='shebei_look.aspx'</script>");
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        s_yuanyin.Text = "";
        Response.Redirect("shebei_look.aspx");
    }
}
