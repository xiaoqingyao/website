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
using System.Data.SqlClient;
public partial class MoneyManger_FuKuanChk : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id =int.Parse( Request.QueryString["id"].ToString());
        string sql = "update  JinHuo set IsMoney='是',CardNum='" + TextBox2.Text + "',CardUsername='" + TextBox1.Text + "',CardName='"+TextBox3.Text+"' where id="+id;
        data.RunSql(sql);

        SqlDataReader dr=data.GetDataReader("select * from  JinHuo where id="+id);
        dr.Read();

        string sql1 = "update  SumMoney set SumMoney=SumMoney-" + dr["SumMoeny"].ToString();
        data.RunSql(sql1);
        Alert.AlertAndRedirect("付款成功", "AddFuKuan.aspx");
    }
}
