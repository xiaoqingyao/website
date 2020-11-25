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

public partial class account_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加账户信息";

            DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "family_Name";
            ddlfamily_Id.DataValueField = "family_Id";
            ddlfamily_Id.DataBind();

            ds = SqlHelper.ExecuteforDataSet("select bank_id,bank_No from bank");
            ddlkh.DataSource = ds;
            ddlkh.DataTextField = "bank_No";
            ddlkh.DataValueField = "bank_id";
            ddlkh.DataBind();

            ddlfamily_Id.SelectedValue = Session["uno"].ToString();
            ddlfamily_Id.Enabled = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (!PageValidate.IsDateTime(txt_account_Time.Text))
        {
            err += "操作日期不能为空或输入格式有误！\\n";
        }        
      
        if (!PageValidate.IsDecimal(txt_account_Money.Text))
        {
            err += "操作金额不能为空或输入格式有误！\\n";
        }
        
       
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Account ( bank_Id,account_Time,family_Id,account_Type,account_Money,account_Bz ) ");
        strSql.Append(@" values (@bank_Id,@account_Time,@family_Id,@account_Type,@account_Money,@account_Bz)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@bank_Id", SqlDbType.Int,4),
            new SqlParameter("@account_Time", SqlDbType.DateTime,8),
            new SqlParameter("@family_Id", SqlDbType.Int,4),
            new SqlParameter("@account_Type", SqlDbType.VarChar,10),
            new SqlParameter("@account_Money", SqlDbType.Decimal,9),
            new SqlParameter("@account_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value = ddlkh.SelectedValue;
        parameters[1].Value =DateTime.Parse (txt_account_Time.Text);
        parameters[2].Value =int.Parse (ddlfamily_Id.SelectedValue);
        parameters[3].Value = rblType.SelectedValue;
        parameters[4].Value =decimal.Parse (txt_account_Money.Text);
        parameters[5].Value =txt_account_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        if (rblType.SelectedValue == "存款")
        {
            SqlHelper.ExecuteNonQuery("update bank set bank_Money2=bank_Money2+" + txt_account_Money.Text + " where bank_Id='" + ddlkh.SelectedValue + "'");
        }
        else
        {
            SqlHelper.ExecuteNonQuery("update bank set bank_Money2=bank_Money2-" + txt_account_Money.Text + " where bank_Id='" + ddlkh.SelectedValue + "'");
        }

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Add.aspx';</script>");


    }
}
