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

public partial class assets_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "查看家庭资产";
            ShowInfo();
        }
    }

    //初始化
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //设置查询Sql
            string sql="select a.*,b.family_Name from assets a left join family b on a.family_Id=b.family_Id where assets_Id="+ Request.QueryString["id"];

            //根据编号得到相应的记录
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblassets_Name.Text = sdr["assets_Name"].ToString();
                lblassets_Sl.Text = sdr["assets_Sl"].ToString();
                lblassets_Price.Text = sdr["assets_Price"].ToString();
                lblassets_Time.Text = DateTime.Parse(sdr["assets_time"].ToString()).ToString("yyyy-MM-dd");
                lblfamily_Id.Text = sdr["family_Name"].ToString();
                lblassets_Bz.Text = sdr["assets_Bz"].ToString();
            }
  
        }
    }
}
