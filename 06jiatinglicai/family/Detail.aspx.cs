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

public partial class family_Detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "�鿴��ͥ��Ա";
            ShowInfo();
        }
    }

    //��ʼ��
    private void ShowInfo()
    {
        if (Request.QueryString["id"] != null)
        {
            //���ò�ѯSql
            string sql="select * from family where family_Id="+ Request.QueryString["id"];

            //���ݱ�ŵõ���Ӧ�ļ�¼
            SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
            if (sdr.Read())
            {
                lblfamily_Lname.Text = sdr["family_Lname"].ToString();
                lblfamily_Pass.Text = sdr["family_Pass"].ToString();
                lblfamily_Name.Text = sdr["family_Name"].ToString();
                lblfamily_Bz.Text = sdr["family_Bz"].ToString();
            }
  
        }
    }
}
