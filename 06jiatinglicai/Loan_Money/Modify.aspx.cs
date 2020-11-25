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

public partial class Loan_Money_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "修改借(贷)款";
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

        //设置查询Sql
        string sql = "select * from Loan_Money where lm_Id=" + Request.QueryString["id"];

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_im_Time1.Text = DateTime.Parse(sdr["im_time1"].ToString()).ToString("yyyy-MM-dd");
            txt_im_Time2.Text = DateTime.Parse(sdr["im_time2"].ToString()).ToString("yyyy-MM-dd");
            ddlfamily_Id.SelectedValue = sdr["family_Id"].ToString();
            txt_im_Name.Text = sdr["im_Name"].ToString();
            txt_im_Money.Text = sdr["im_Money"].ToString();
            txt_im_Bz.Text = sdr["im_Bz"].ToString();

            ddlfamily_Id.Enabled = false;
        }
    }

    // 保存
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

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update Loan_Money set ");
        strSql.Append("im_Time1 = @im_Time1,");
        strSql.Append("im_Time2 = @im_Time2,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("im_Name = @im_Name,");
        strSql.Append("im_Money = @im_Money,");
        strSql.Append("im_Bz = @im_Bz ");
        strSql.Append("  where lm_Id=@lm_Id");
        int lm_Id = int.Parse(Request.QueryString["id"]);

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@lm_Id", SqlDbType.Int,4),
                    new SqlParameter("@im_Time1", SqlDbType.DateTime,8),
                    new SqlParameter("@im_Time2", SqlDbType.DateTime,8),
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@im_Name", SqlDbType.VarChar,50),
                    new SqlParameter("@im_Money", SqlDbType.Decimal,9),
                    new SqlParameter("@im_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value = lm_Id;
        parameters[1].Value = txt_im_Time1.Text;
        parameters[2].Value = txt_im_Time2.Text;
        parameters[3].Value = ddlfamily_Id.SelectedValue;
        parameters[4].Value = txt_im_Name.Text;
        parameters[5].Value = txt_im_Money.Text;
        parameters[6].Value = txt_im_Bz.Text;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }

}
