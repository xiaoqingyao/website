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

public partial class assets_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "�޸ļ�ͥ�ʲ�";
            ShowInfo();
        }
    }

    // ��ʼ��
    protected void ShowInfo()
    {
        DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
        ddlfamily_Id.DataSource = ds;
        ddlfamily_Id.DataTextField = "family_Name";
        ddlfamily_Id.DataValueField = "family_Id";
        ddlfamily_Id.DataBind();

        //���ò�ѯSql
        string sql = "select * from assets where assets_Id=" + Request.QueryString["id"];

        //���ݱ�ŵõ���Ӧ�ļ�¼
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_assets_Name.Text = sdr["assets_Name"].ToString();
            txt_assets_Sl.Text = sdr["assets_Sl"].ToString();
            txt_assets_Price.Text = sdr["assets_Price"].ToString();
            txt_assets_Time.Text = DateTime.Parse(sdr["assets_time"].ToString()).ToString("yyyy-MM-dd");
            ddlfamily_Id.SelectedValue = sdr["family_Id"].ToString();
            txt_assets_Bz.Text = sdr["assets_Bz"].ToString();
        }
    }

    // ����
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

        StringBuilder strSql = new StringBuilder();

        //����   
        strSql.Append("update assets set ");
        strSql.Append("assets_Name = @assets_Name,");
        strSql.Append("assets_Sl = @assets_Sl,");
        strSql.Append("assets_Price = @assets_Price,");
        strSql.Append("assets_Time = @assets_Time,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("assets_Bz = @assets_Bz ");
        strSql.Append("  where assets_Id=@assets_Id");
        int assets_Id = int.Parse(Request.QueryString["id"]);

        //���ò���
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@assets_Id", SqlDbType.Int,4),
                    new SqlParameter("@assets_Name", SqlDbType.VarChar,50),
                    new SqlParameter("@assets_Sl", SqlDbType.Int,4),
                    new SqlParameter("@assets_Price", SqlDbType.Decimal,9),
                    new SqlParameter("@assets_Time", SqlDbType.DateTime,8),
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@assets_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value = assets_Id;
        parameters[1].Value = txt_assets_Name.Text;
        parameters[2].Value = txt_assets_Sl.Text;
        parameters[3].Value = txt_assets_Price.Text;
        parameters[4].Value = txt_assets_Time.Text;
        parameters[5].Value = ddlfamily_Id.SelectedValue;
        parameters[6].Value = txt_assets_Bz.Text;

        //�ύ�����ݿ�
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('�����ɹ���');location.href='Manage.aspx';</script>");
    }

}
