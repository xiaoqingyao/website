using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Data.SqlClient;

public partial class account_Detail1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "审核";
            ShowInfo();
        }
    }

    //初始化
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //设置查询Sql
            string sql="select * from account a left join family b on a.family_Id=b.family_Id left join bank c on a.bank_id=c.bank_Id where account_Id="+ Request.QueryString["id"];

            //根据编号得到相应的记录
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblbank_Id.Text = sdr["bank_No"].ToString();
                lblaccount_Time.Text = sdr["account_Time"].ToString();
                lblfamily_Id.Text = sdr["family_Name"].ToString();
                lblaccount_Type.Text = sdr["account_Type"].ToString();
                lblaccount_Money.Text = sdr["account_Money"].ToString();
                lblaccount_Bz.Text = sdr["account_Bz"].ToString();
            }
  
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlHelper.ExecuteNonQuery("update account set zt='" + RadioButtonList1.SelectedValue + "' where account_Id=" + Request.QueryString["id"]);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }
}
