using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserManger_AddAcount : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        if (name.Text.Trim().Length == 0)
        {
            HttpContext.Current.Response.Write("<script language='javascript'>alert('账户名不能为空');</script>");
            return;
        }
        //查询账户重名的问题
        sql = "select count(*) from account where name='" + name.Text + "' and adduserid='" + Session["UserId"].ToString() + "'";
        SqlDataReader sdr = data.GetDataReader(sql);
        if (sdr.Read() && sdr[0].ToString() != "0")
        {
            HttpContext.Current.Response.Write("<script language='javascript'>alert('您已经存在该账户，请不要重名');</script>");
            return;
        }

        sql = "insert into Account(name,atype,addUserId,bz)values('" + name.Text + "','" + atype.SelectedItem.Text + "','" + Session["UserId"].ToString() + "','" + bz.Text + "')";

        data.RunSql(sql);

        Alert.AlertAndRedirect("添加成功！", "AcountManager.aspx");

    }
}