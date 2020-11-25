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

public partial class family_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "��Ӽ�ͥ��Ա��Ϣ";
        
        }
    }
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

        //�������Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Family ( family_Lname,family_Pass,family_Name,family_Bz ) ");
        strSql.Append(@" values (@family_Lname,@family_Pass,@family_Name,@family_Bz)");

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@family_Lname", SqlDbType.VarChar,50),
            new SqlParameter("@family_Pass", SqlDbType.VarChar,50),
            new SqlParameter("@family_Name", SqlDbType.VarChar,50),
            new SqlParameter("@family_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value =txt_family_Lname.Text;
        parameters[1].Value =txt_family_Pass.Text;
        parameters[2].Value =txt_family_Name.Text;
        parameters[3].Value =txt_family_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Add.aspx';</script>");

    }
}
