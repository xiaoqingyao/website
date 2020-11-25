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

public partial class bank_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "�޸������˺�";
            ShowInfo();
        }
    }

       // ��ʼ��
    protected void ShowInfo()
    {

        //���ò�ѯSql
        string sql = "select * from bank where bank_Id=" + Request.QueryString["id"] ;

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_bank_No.Text = sdr["bank_No"].ToString();
            ddlbank_Type.SelectedValue=sdr["bank_Type"].ToString();
            txt_bank_Name.Text = sdr["bank_Name"].ToString();
            txt_bank_Money1.Text = sdr["bank_Money1"].ToString();
            txt_bank_Money2.Text = sdr["bank_Money2"].ToString();
            txt_bank_Time1.Text = sdr["bank_Time1"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
//��֤����
        string err = "";

        if (txt_bank_No.Text == "")
        {
            err += "���Ų���Ϊ�գ�\\n";
        }
        if (txt_bank_Name.Text == "")
        {
            err += "������������Ϊ�գ�\\n";
        }
        if (!PageValidate.IsDecimal(txt_bank_Money1.Text))
        {
            err += "��ʼ����Ϊ�ջ������ʽ����\\n";
        }
        if (!PageValidate.IsDecimal(txt_bank_Money2.Text))
        {
            err += "����Ϊ�ջ������ʽ����\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //����   
        strSql.Append("update bank set ");
        strSql.Append("bank_No = @bank_No,");
        strSql.Append("bank_Type = @bank_Type,");
        strSql.Append("bank_Name = @bank_Name,");
        strSql.Append("bank_Money1 = @bank_Money1,");
        strSql.Append("bank_Money2 = @bank_Money2,");
        strSql.Append("bank_Time1 = @bank_Time1 ");
        strSql.Append("  where bank_Id=@bank_Id");
        int bank_Id = int.Parse(Request.QueryString["id"]);

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@bank_Id", SqlDbType.Int,4),
                    new SqlParameter("@bank_No", SqlDbType.VarChar,50),
                    new SqlParameter("@bank_Type", SqlDbType.VarChar,50),
                    new SqlParameter("@bank_Name", SqlDbType.VarChar,50),
                    new SqlParameter("@bank_Money1", SqlDbType.Decimal,9),
                    new SqlParameter("@bank_Money2", SqlDbType.Decimal,9),
                    new SqlParameter("@bank_Time1", SqlDbType.DateTime,8)  };
        parameters[0].Value =bank_Id;
        parameters[1].Value = txt_bank_No.Text;
        parameters[2].Value =ddlbank_Type.SelectedValue;
        parameters[3].Value = txt_bank_Name.Text;
        parameters[4].Value = txt_bank_Money1.Text;
        parameters[5].Value = txt_bank_Money2.Text;
        parameters[6].Value = txt_bank_Time1.Text;

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Manage.aspx';</script>");
    }

}
