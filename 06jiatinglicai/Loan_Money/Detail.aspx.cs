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

public partial class Loan_Money_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "查看借(贷)款";
            ShowInfo();
        }
    }

    //初始化
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //设置查询Sql
            string sql="select a.*,b.family_Name from Loan_Money a left join family b on a.family_Id=b.family_Id where lm_Id="+ Request.QueryString["id"];

            //根据编号得到相应的记录
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblim_Time1.Text = DateTime.Parse(sdr["im_time1"].ToString()).ToString("yyyy-MM-dd");
                lblim_Time2.Text = DateTime.Parse(sdr["im_time2"].ToString()).ToString("yyyy-MM-dd");
                lblfamily_Id.Text = sdr["family_Name"].ToString();
                lblim_Name.Text = sdr["im_Name"].ToString();
                lblim_Money.Text = sdr["im_Money"].ToString();
                lblim_Bz.Text = sdr["im_Bz"].ToString();
            }
  
        }
    }
}
