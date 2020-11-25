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

public partial class bank_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加银行账号信息";
        
        }
    }
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

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Bank ( bank_No,bank_Type,bank_Name,bank_Money1,bank_Money2,bank_Time1 ) ");
        strSql.Append(@" values (@bank_No,@bank_Type,@bank_Name,@bank_Money1,@bank_Money2,@bank_Time1)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@bank_No", SqlDbType.VarChar,50),
            new SqlParameter("@bank_Type", SqlDbType.VarChar,50),
            new SqlParameter("@bank_Name", SqlDbType.VarChar,50),
            new SqlParameter("@bank_Money1", SqlDbType.Decimal,9),
            new SqlParameter("@bank_Money2", SqlDbType.Decimal,9),
            new SqlParameter("@bank_Time1", SqlDbType.DateTime,8)        };

        parameters[0].Value =txt_bank_No.Text;
        parameters[1].Value =ddlbank_Type.SelectedValue;
        parameters[2].Value =txt_bank_Name.Text;
        parameters[3].Value =decimal.Parse (txt_bank_Money1.Text);
        parameters[4].Value =decimal.Parse (txt_bank_Money2.Text);
        parameters[5].Value =DateTime.Parse (txt_bank_Time1.Text);
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Add.aspx';</script>");

    }
}
