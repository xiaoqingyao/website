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

public partial class invest_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "修改投资";
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
        string sql = "select * from invest where invest_Id=" + Request.QueryString["id"] ;

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_invest_Title.Text = sdr["invest_Title"].ToString();
            txt_invest_Time.Text = DateTime.Parse(sdr["invest_time"].ToString()).ToString("yyyy-MM-dd");
            txt_invest_Money.Text = sdr["invest_Money"].ToString();
            ddlfamily_Id.SelectedValue=sdr["family_Id"].ToString();
            txt_invest_Bz.Text = sdr["invest_Bz"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (!PageValidate.IsDateTime(this.txt_invest_Time.Text))
        {
            err += "投资时间不能为空或输入格式有误！\\n";
        }
        if (txt_invest_Title.Text == "")
        {
            err += "投资项目不能为空！\\n";
        }
        if (!PageValidate.IsDecimal(txt_invest_Money.Text))
        {
            err += "投资金额不能为空或输入格式有误！\\n";
        }
      

        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update invest set ");
        strSql.Append("invest_Title = @invest_Title,");
        strSql.Append("invest_Time = @invest_Time,");
        strSql.Append("invest_Money = @invest_Money,");
        strSql.Append("family_Id = @family_Id,");
        strSql.Append("invest_Bz = @invest_Bz ");
        strSql.Append("  where invest_Id=@invest_Id");
        int invest_Id = int.Parse(Request.QueryString["id"]);

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@invest_Id", SqlDbType.Int,4),
                    new SqlParameter("@invest_Title", SqlDbType.VarChar,50),
                    new SqlParameter("@invest_Time", SqlDbType.DateTime,8),
                    new SqlParameter("@invest_Money", SqlDbType.Decimal,9),
                    new SqlParameter("@family_Id", SqlDbType.Int,4),
                    new SqlParameter("@invest_Bz", SqlDbType.VarChar,500)  };
        parameters[0].Value =invest_Id;
        parameters[1].Value = txt_invest_Title.Text;
        parameters[2].Value = txt_invest_Time.Text;
        parameters[3].Value = txt_invest_Money.Text;
        parameters[4].Value =ddlfamily_Id.SelectedValue;
        parameters[5].Value = txt_invest_Bz.Text;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
        
    }

}
