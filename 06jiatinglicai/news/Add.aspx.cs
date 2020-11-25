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

public partial class news_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "���Ͷ����Ѷ";
        
        }
    }
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

        //�������Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into News ( title,memo ) ");
        strSql.Append(@" values (@title,@memo)");

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@title", SqlDbType.VarChar,100),
            new SqlParameter("@memo", SqlDbType.NText,50000)        };

        parameters[0].Value =txt_title.Text;
        parameters[1].Value =Textarea1.Value;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('����ɹ���');location.href='Add.aspx';</script>");
    }
}
