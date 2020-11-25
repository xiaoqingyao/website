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

public partial class in_Type_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "�޸���֧����";
            ShowInfo();
        }
    }

       // ��ʼ��
    protected void ShowInfo()
    {

        //���ò�ѯSql
        string sql = "select * from in_Type where inId=" + Request.QueryString["id"] ;

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_inTitle.Text = sdr["inTitle"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //��֤����
        string err = "";

        if (txt_inTitle.Text == "")
        {
            err += "��֧�������Ʋ���Ϊ�գ�\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //����   
        strSql.Append("update in_Type set ");
        strSql.Append("inTitle = @inTitle ");
        strSql.Append("  where inId=@inId");
        int inId = int.Parse(Request.QueryString["id"]);

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@inId", SqlDbType.Int,4),
                    new SqlParameter("@inTitle", SqlDbType.VarChar,50)  };
        parameters[0].Value =inId;
        parameters[1].Value = txt_inTitle.Text;

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Manage.aspx';</script>");
    }

}
