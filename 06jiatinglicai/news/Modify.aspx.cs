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

public partial class news_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "�޸�Ͷ����Ѷ";
            ShowInfo();
        }
    }

    // ��ʼ��
    protected void ShowInfo()
    {

        //���ò�ѯSql
        string sql = "select * from news where nid=" + Request.QueryString["id"];

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_title.Text = sdr["title"].ToString();
            Textarea1.Value = sdr["memo"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //��֤����
        string err = "";

        if (txt_title.Text == "")
        {
            err += "��Ѷ���ⲻ��Ϊ�գ�\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //����   
        strSql.Append("update news set ");
        strSql.Append("title = @title,");
        strSql.Append("memo = @memo ");
        strSql.Append("  where nid=@nid");
        int nid = int.Parse(Request.QueryString["id"]);

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@nid", SqlDbType.Int,4),
                    new SqlParameter("@title", SqlDbType.VarChar,100),
                    new SqlParameter("@memo", SqlDbType.NText,50000)  };
        parameters[0].Value = nid;
        parameters[1].Value = txt_title.Text;
        parameters[2].Value = Textarea1.Value;

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('����ɹ���');location.href='Manage.aspx';</script>");
    }

}
