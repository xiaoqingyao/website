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

public partial class account_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "修改账户";
            ShowInfo();
        }
    }

       // 初始化
    protected void ShowInfo()
    {
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

        //设置查询Sql
        string sql = "select * from account where account_Id=" + Request.QueryString["id"] ;

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
           ddlkh.SelectedValue= sdr["bank_Id"].ToString();
           txt_account_Time.Text = DateTime.Parse(sdr["account_Time"].ToString()).ToString("yyyy-MM-dd");
            ddlfamily_Id.SelectedValue = sdr["family_Id"].ToString();
            rblType.SelectedValue = sdr["account_Type"].ToString();
            txt_account_Money.Text = sdr["account_Money"].ToString();
            txt_account_Bz.Text = sdr["account_Bz"].ToString();
            ViewState["money"] = txt_account_Money.Text;
        }
    }

    // 保存
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

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update account set ");
        strSql.Append("bank_Id = @bank_Id,");
        strSql.Append("account_Time = @account_Time,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("account_Type = @account_Type,");
        strSql.Append("account_Money = @account_Money,");
        strSql.Append("account_Bz = @account_Bz ");
        strSql.Append("  where account_Id=@account_Id");
        string account_Id = Request.QueryString["id"];

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@account_Id", SqlDbType.Int,4),
                    new SqlParameter("@bank_Id", SqlDbType.Int,4),
                    new SqlParameter("@account_Time", SqlDbType.DateTime,8),
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@account_Type", SqlDbType.VarChar,10),
                    new SqlParameter("@account_Money", SqlDbType.Decimal,9),
                    new SqlParameter("@account_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value =account_Id;
        parameters[1].Value = ddlkh.SelectedValue;
        parameters[2].Value = txt_account_Time.Text;
        parameters[3].Value = ddlfamily_Id.SelectedValue;
        parameters[4].Value = rblType.SelectedValue;
        parameters[5].Value = txt_account_Money.Text;
        parameters[6].Value = txt_account_Bz.Text;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        if (rblType.SelectedValue == "存款")
        {
            SqlHelper.ExecuteNonQuery("update bank set bank_Money2=bank_Money2+" + txt_account_Money.Text+"-"+ViewState["money"].ToString() + " where bank_Id='" + ddlkh.SelectedValue + "'");
        }
        else
        {
            SqlHelper.ExecuteNonQuery("update bank set bank_Money2=bank_Money2-" + txt_account_Money.Text + "+" + ViewState["money"].ToString() + " where bank_Id='" +ddlkh.SelectedValue+ "'");
        }


        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");

    }

}
