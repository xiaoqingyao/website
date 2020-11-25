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

public partial class in_Pay_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加收支信息";
            DataSet ds = SqlHelper.ExecuteforDataSet("select family_Id,family_Name from family");
            ddlfamily_Id.DataSource = ds;
            ddlfamily_Id.DataTextField = "family_Name";
            ddlfamily_Id.DataValueField = "family_Id";
            ddlfamily_Id.DataBind();

            ds = SqlHelper.ExecuteforDataSet("select inId,inTitle from in_Type");
            ddlinId.DataSource = ds;
            ddlinId.DataTextField = "inTitle";
            ddlinId.DataValueField = "inId";
            ddlinId.DataBind();

            ddlfamily_Id.SelectedValue = Session["uno"].ToString();
            ddlfamily_Id.Enabled = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (!PageValidate.IsDateTime(this.txt_in_Date.Text))
        {
            err += "收支日期不能为空或输入格式有误！\\n";
        }
        if (!PageValidate.IsDecimal(txt_in_Money.Text))
        {
            err += "收支金额不能为空或输入格式有误！\\n";
        }
        if (txt_in_Bz.Text == "")
        {
            err += "收支备注不能为空！\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into In_Pay ( in_Date,family_Id,in_Leixing,inId,in_Money,in_Bz ) ");
        strSql.Append(@" values (@in_Date,@family_Id,@in_Leixing,@inId,@in_Money,@in_Bz)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@in_Date", SqlDbType.DateTime,8),
            new SqlParameter("@family_Id", SqlDbType.Int,4),
            new SqlParameter("@in_Leixing", SqlDbType.VarChar,10),
            new SqlParameter("@inId", SqlDbType.Int,4),
            new SqlParameter("@in_Money", SqlDbType.Decimal,9),
            new SqlParameter("@in_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value = DateTime.Parse(txt_in_Date.Text);
        parameters[1].Value = ddlfamily_Id.SelectedValue;
        parameters[2].Value = rdlin_Leixing.SelectedValue;
        parameters[3].Value = ddlinId.SelectedValue;
        parameters[4].Value = decimal.Parse(txt_in_Money.Text);
        parameters[5].Value = txt_in_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Add.aspx';</script>");

    }
}
