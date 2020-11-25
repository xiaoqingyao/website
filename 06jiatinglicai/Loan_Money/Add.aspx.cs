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

public partial class Loan_Money_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加借(贷)款信息";
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
        //验证输入
        string err = "";
        if (!PageValidate.IsDateTime(this.txt_im_Time1.Text))
        {
            err += "借贷日期不能为空或输入格式有误！\\n";
        }
        if (!PageValidate.IsDateTime(this.txt_im_Time2.Text))
        {
            err += "归还日期不能为空或输入格式有误！\\n";
        }
        if (DateTime.Parse(txt_im_Time1.Text) > DateTime.Parse(txt_im_Time2.Text))
        {
            err += "借贷日期不能大于归还日期！\\n";
        }
        if (txt_im_Name.Text == "")
        {
            err += "借贷人不能为空！\\n";
        }
        if (!PageValidate.IsDecimal(txt_im_Money.Text))
        {
            err += "借贷金额不能为空或输入格式有误！\\n";
        }

        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into Loan_Money ( im_Time1,im_Time2,family_Id,im_Name,im_Money,im_Bz ) ");
        strSql.Append(@" values (@im_Time1,@im_Time2,@family_Id,@im_Name,@im_Money,@im_Bz)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@im_Time1", SqlDbType.DateTime,8),
            new SqlParameter("@im_Time2", SqlDbType.DateTime,8),
            new SqlParameter("@family_Id", SqlDbType.Int,4),
            new SqlParameter("@im_Name", SqlDbType.VarChar,50),
            new SqlParameter("@im_Money", SqlDbType.Decimal,9),
            new SqlParameter("@im_Bz", SqlDbType.VarChar,500)        };

        parameters[0].Value = DateTime.Parse(txt_im_Time1.Text);
        parameters[1].Value = DateTime.Parse(txt_im_Time2.Text);
        parameters[2].Value = ddlfamily_Id.SelectedValue;
        parameters[3].Value = txt_im_Name.Text;
        parameters[4].Value = decimal.Parse(txt_im_Money.Text);
        parameters[5].Value = txt_im_Bz.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Add.aspx';</script>");

    }
}
