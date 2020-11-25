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
           (Master.FindControl("Label1") as Label).Text = "修改银行账号";
            ShowInfo();
        }
    }

       // 初始化
    protected void ShowInfo()
    {

        //设置查询Sql
        string sql = "select * from bank where bank_Id=" + Request.QueryString["id"] ;

        //根据编号得到相应的记录
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

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
//验证输入
        string err = "";

        if (txt_bank_No.Text == "")
        {
            err += "卡号不能为空！\\n";
        }
        if (txt_bank_Name.Text == "")
        {
            err += "户主姓名不能为空！\\n";
        }
        if (!PageValidate.IsDecimal(txt_bank_Money1.Text))
        {
            err += "初始金额不能为空或输入格式有误！\\n";
        }
        if (!PageValidate.IsDecimal(txt_bank_Money2.Text))
        {
            err += "余额不能为空或输入格式有误！\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update bank set ");
        strSql.Append("bank_No = @bank_No,");
        strSql.Append("bank_Type = @bank_Type,");
        strSql.Append("bank_Name = @bank_Name,");
        strSql.Append("bank_Money1 = @bank_Money1,");
        strSql.Append("bank_Money2 = @bank_Money2,");
        strSql.Append("bank_Time1 = @bank_Time1 ");
        strSql.Append("  where bank_Id=@bank_Id");
        int bank_Id = int.Parse(Request.QueryString["id"]);

        //设置参数
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

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }

}
