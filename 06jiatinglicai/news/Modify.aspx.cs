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

public partial class news_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "修改投资资讯";
            ShowInfo();
        }
    }

    // 初始化
    protected void ShowInfo()
    {

        //设置查询Sql
        string sql = "select * from news where nid=" + Request.QueryString["id"];

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_title.Text = sdr["title"].ToString();
            Textarea1.Value = sdr["memo"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (txt_title.Text == "")
        {
            err += "资讯主题不能为空！\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update news set ");
        strSql.Append("title = @title,");
        strSql.Append("memo = @memo ");
        strSql.Append("  where nid=@nid");
        int nid = int.Parse(Request.QueryString["id"]);

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@nid", SqlDbType.Int,4),
                    new SqlParameter("@title", SqlDbType.VarChar,100),
                    new SqlParameter("@memo", SqlDbType.NText,50000)  };
        parameters[0].Value = nid;
        parameters[1].Value = txt_title.Text;
        parameters[2].Value = Textarea1.Value;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('保存成功！');location.href='Manage.aspx';</script>");
    }

}
