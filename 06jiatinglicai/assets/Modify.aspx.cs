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
            (Master.FindControl("Label1") as Label).Text = "修改家庭资产";
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
        string sql = "select * from assets where assets_Id=" + Request.QueryString["id"];

        //根据编号得到相应的记录
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

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (txt_assets_Name.Text == "")
        {
            err += "资产名称不能为空！\\n";
        }
        if (!PageValidate.IsNumber(txt_assets_Sl.Text))
        {
            err += "数量不能为空或输入格式有误！\\n";
        }
        if (!PageValidate.IsDecimal(txt_assets_Price.Text))
        {
            err += "价格不能为空或输入格式有误！\\n";
        }
        if (!PageValidate.IsDateTime(this.txt_assets_Time.Text))
        {
            err += "购入日期不能为空或输入格式有误！\\n";
        }

        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update assets set ");
        strSql.Append("assets_Name = @assets_Name,");
        strSql.Append("assets_Sl = @assets_Sl,");
        strSql.Append("assets_Price = @assets_Price,");
        strSql.Append("assets_Time = @assets_Time,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("assets_Bz = @assets_Bz ");
        strSql.Append("  where assets_Id=@assets_Id");
        int assets_Id = int.Parse(Request.QueryString["id"]);

        //设置参数
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

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }

}
