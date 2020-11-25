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

public partial class invest_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "���Ͷ����Ϣ";
            DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "family_Name";
            ddlfamily_Id.DataValueField = "family_Id";
            ddlfamily_Id.DataBind();

            ddlfamily_Id.SelectedValue = Session["uno"].ToString();
            ddlfamily_Id.Enabled = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //��֤����
        string err = "";

        if (!PageValidate.IsDateTime(this.txt_invest_Time.Text))
        {
            err += "Ͷ��ʱ�䲻��Ϊ�ջ������ʽ����\\n";
        }
        if (txt_invest_Title.Text == "")
        {
            err += "Ͷ����Ŀ����Ϊ�գ�\\n";
        }
        if (!PageValidate.IsDecimal(txt_invest_Money.Text))
        {
            err += "Ͷ�ʽ���Ϊ�ջ������ʽ����\\n";
        }
        

        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        //�������Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Invest ( invest_Title,invest_Time,invest_Money,family_Id,invest_Bz ) ");
        strSql.Append(@" values (@invest_Title,@invest_Time,@invest_Money,@family_Id,@invest_Bz)");

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@invest_Title", SqlDbType.VarChar,50),
            new SqlParameter("@invest_Time", SqlDbType.DateTime,8),
            new SqlParameter("@invest_Money", SqlDbType.Decimal,9),
            new SqlParameter("@family_Id", SqlDbType.Int,4),
            new SqlParameter("@invest_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value = txt_invest_Title.Text;
        parameters[1].Value = DateTime.Parse(txt_invest_Time.Text);
        parameters[2].Value = decimal.Parse(txt_invest_Money.Text);
        parameters[3].Value = ddlfamily_Id.SelectedValue;
        parameters[4].Value = txt_invest_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Add.aspx';</script>");

    }
}
