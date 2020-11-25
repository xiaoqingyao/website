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

public partial class family_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "�޸ļ�ͥ��Ա";
            ShowInfo();
        }
    }

       // ��ʼ��
    protected void ShowInfo()
    {

        //���ò�ѯSql
        string sql = "select * from family where family_Id=" + Request.QueryString["id"] ;

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_family_Lname.Text = sdr["family_Lname"].ToString();
            txt_family_Pass.Text = sdr["family_Pass"].ToString();
            txt_family_Name.Text = sdr["family_Name"].ToString();
            txt_family_Bz.Text = sdr["family_Bz"].ToString();
        }
    }

    // ����
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //��֤����
        string err = "";

        if (txt_family_Lname.Text == "")
        {
            err += "��½������Ϊ�գ�\\n";
        }
        if (txt_family_Pass.Text == "")
        {
            err += "��½���벻��Ϊ�գ�\\n";
        }
        if (txt_family_Name.Text == "")
        {
            err += "��������Ϊ�գ�\\n";
        }
       
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //����   
        strSql.Append("update family set ");
        strSql.Append("family_Lname = @family_Lname,");
        strSql.Append("family_Pass = @family_Pass,");
        strSql.Append("family_Name = @family_Name,");
        strSql.Append("family_Bz = @family_Bz ");
        strSql.Append("  where family_Id=@family_Id");
        int family_Id = int.Parse(Request.QueryString["id"]);

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@family_Lname", SqlDbType.VarChar,50),
                    new SqlParameter("@family_Pass", SqlDbType.VarChar,50),
                    new SqlParameter("@family_Name", SqlDbType.VarChar,50),
                    new SqlParameter("@family_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value =family_Id;
        parameters[1].Value = txt_family_Lname.Text;
        parameters[2].Value = txt_family_Pass.Text;
        parameters[3].Value = txt_family_Name.Text;
        parameters[4].Value = txt_family_Bz.Text;

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Manage.aspx';</script>");
    }

}
