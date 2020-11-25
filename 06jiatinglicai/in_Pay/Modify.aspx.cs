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

public partial class in_Pay_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "修改收支";
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


        ds = SqlHelper.ExecuteforDataSet("select inId,inTitle from in_Type");
        ddlinId.DataSource = ds;
        ddlinId.DataTextField = "inTitle";
        ddlinId.DataValueField = "inId";
        ddlinId.DataBind();

        //设置查询Sql
        string sql = "select * from in_Pay where ip_Id=" + Request.QueryString["id"];

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_in_Date.Text = DateTime.Parse(sdr["in_date"].ToString()).ToString("yyyy-MM-dd");
            ddlfamily_Id.SelectedValue = sdr["family_Id"].ToString();
            rdlin_Leixing.SelectedValue = sdr["in_Leixing"].ToString();
            ddlinId.SelectedValue = sdr["inId"].ToString();
            txt_in_Money.Text = sdr["in_Money"].ToString();
            txt_in_Bz.Text = sdr["in_Bz"].ToString();
        }

        ddlfamily_Id.Enabled = false;
    }

    // 保存
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

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update in_Pay set ");
        strSql.Append("in_Date = @in_Date,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("in_Leixing = @in_Leixing,");
        strSql.Append("inId = @inId,");
        strSql.Append("in_Money = @in_Money,");
        strSql.Append("in_Bz = @in_Bz ");
        strSql.Append("  where ip_Id=@ip_Id");
        int ip_Id = int.Parse(Request.QueryString["id"]);

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ip_Id", SqlDbType.Int,4),
                    new SqlParameter("@in_Date", SqlDbType.DateTime,8),
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@in_Leixing", SqlDbType.VarChar,10),
                    new SqlParameter("@inId", SqlDbType.Int,4),
                    new SqlParameter("@in_Money", SqlDbType.Decimal,9),
                    new SqlParameter("@in_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value = ip_Id;
        parameters[1].Value = txt_in_Date.Text;
        parameters[2].Value = ddlfamily_Id.SelectedValue;
        parameters[3].Value = rdlin_Leixing.SelectedValue;
        parameters[4].Value = ddlinId.SelectedValue;
        parameters[5].Value = txt_in_Money.Text;
        parameters[6].Value = txt_in_Bz.Text;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }

}
