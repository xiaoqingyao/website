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

public partial class invest_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "�鿴Ͷ��";
            ShowInfo();
        }
    }

    //��ʼ��
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //���ò�ѯSql
            string sql="select a.*,b.family_Name from invest a left join family b on a.family_Id=b.family_Id where invest_Id="+ Request.QueryString["id"];

            //���ݱ�ŵõ���Ӧ�ļ�¼
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblinvest_Title.Text = sdr["invest_Title"].ToString();
                lblinvest_Time.Text = DateTime.Parse(sdr["invest_time"].ToString()).ToString("yyyy-MM-dd");
                lblinvest_Money.Text = sdr["invest_Money"].ToString();
                lblfamily_Id.Text = sdr["family_Name"].ToString();
                lblinvest_Bz.Text = sdr["invest_Bz"].ToString();
            }
  
        }
    }
}