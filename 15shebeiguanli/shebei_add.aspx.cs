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

public partial class shebei_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected SqlConnection GetConnection()
    {
        string conn = ConfigurationManager.AppSettings["ConnectionString"].ToString();
        SqlConnection myConn = new SqlConnection(conn);
        return myConn;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         SqlConnection conn = GetConnection();
        conn.Open();

        string s_no1 = s_no.Text.Trim();
        string s_name1 = s_name.Text.Trim();
        string s_xinghao1 = s_xinghao.Text.Trim();
        string s_zhizaoshang1 = s_zhizaoshang.Text.Trim();

        string s_guobie1 = s_guobie.Text.Trim();
        string s_danjia1 = s_danjia.Text.Trim();

        string s_shuliang1 = s_shuliang.Text.Trim();
        string s_goumaitime1 = s_goumaitime.Text.Trim();
        string s_baofeitime1 = s_baofeitime.Text.Trim();


        if (s_no.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('设备编号不能为空!');</script>");
        }
        string strsql = "insert into shebei(s_no,s_name,s_xinghao,s_zhizaoshang,s_guobie,s_danjia,s_shuliang,s_goumaitime,s_baofeitime,s_shijian) values(N'" + s_no1 + "',N'" + s_name1 + "',N'" + s_xinghao1 + "',N'" + s_zhizaoshang1 + "',N'" + s_guobie1 + "',N'" + s_danjia1 + "',N'" + s_shuliang1 + "',N'" + s_goumaitime1 + "',N'" + s_baofeitime1 + "','" + DateTime.Now.ToShortDateString() + "') ";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.ExecuteNonQuery();
        Response.Write("<script language=javascript>alert('设备成功!');location='shebei_add.aspx'</script>");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        s_no.Text = "";
        s_name.Text = "";
        s_xinghao.Text = "";
        s_zhizaoshang.Text = "";
        s_guobie.Text = "";
        s_danjia.Text = "";
        s_shuliang.Text = "";
        s_goumaitime.Text = "";
        s_baofeitime.Text = "";
    }
}
