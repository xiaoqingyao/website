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

public partial class in_Pay_Detail1 : System.Web.UI.Page
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
            string sql = "select a.*,b.family_Name,inTitle from in_Pay a left join family b on a.family_Id=b.family_Id left join in_Type c on a.inId=c.inId where ip_Id=" + Request.QueryString["id"];

            //根据编号得到相应的记录
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblin_Date.Text = DateTime.Parse(sdr["in_date"].ToString()).ToString("yyyy-MM-dd");
                lblfamily_Id.Text = sdr["family_Name"].ToString();
                lblin_Leixing.Text = sdr["in_Leixing"].ToString();
                lblinId.Text = sdr["inTitle"].ToString();
                lblin_Money.Text = sdr["in_Money"].ToString();
                lblin_Bz.Text = sdr["in_Bz"].ToString();
            }
  
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlHelper.ExecuteNonQuery("update in_Pay set zt='" + RadioButtonList1.SelectedValue + "' where Ip_Id=" + Request.QueryString["id"]);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }
}
