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

public partial class assets_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "��Ӽ�ͥ�ʲ���Ϣ";
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

        if (txt_assets_Name.Text == "")
        {
            err += "�ʲ����Ʋ���Ϊ�գ�\\n";
        }
        if (!PageValidate.IsNumber(txt_assets_Sl.Text))
        {
            err += "��������Ϊ�ջ������ʽ����\\n";
        }
        if (!PageValidate.IsDecimal(txt_assets_Price.Text))
        {
            err += "�۸���Ϊ�ջ������ʽ����\\n";
        }

        if (!PageValidate.IsDateTime(this.txt_assets_Time.Text))
        {
            err += "�������ڲ���Ϊ�ջ������ʽ����\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        //�������Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Assets ( assets_Name,assets_Sl,assets_Price,assets_Time,family_Id,assets_Bz ) ");
        strSql.Append(@" values (@assets_Name,@assets_Sl,@assets_Price,@assets_Time,@family_Id,@assets_Bz)");

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@assets_Name", SqlDbType.VarChar,50),
            new SqlParameter("@assets_Sl", SqlDbType.Int,4),
            new SqlParameter("@assets_Price", SqlDbType.Decimal,9),
            new SqlParameter("@assets_Time", SqlDbType.DateTime,8),
            new SqlParameter("@family_Id", SqlDbType.Int,4),
            new SqlParameter("@assets_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value = txt_assets_Name.Text;
        parameters[1].Value = int.Parse(txt_assets_Sl.Text);
        parameters[2].Value = decimal.Parse(txt_assets_Price.Text);
        parameters[3].Value = DateTime.Parse(txt_assets_Time.Text);
        parameters[4].Value = ddlfamily_Id.SelectedValue;
        parameters[5].Value = txt_assets_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Add.aspx';</script>");

    }
}
