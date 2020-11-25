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

public partial class in_Type_Modify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           (Master.FindControl("Label1") as Label).Text = "修改收支类型";
            ShowInfo();
        }
    }

       // 初始化
    protected void ShowInfo()
    {

        //设置查询Sql
        string sql = "select * from in_Type where inId=" + Request.QueryString["id"] ;

        //根据编号得到相应的记录
        SqlDataReader sdr = SqlHelper.ExecuteReader(sql);
        if (sdr.Read())
        {
            txt_inTitle.Text = sdr["inTitle"].ToString();
        }
    }

    // 保存
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //验证输入
        string err = "";

        if (txt_inTitle.Text == "")
        {
            err += "收支类型名称不能为空！\\n";
        }
        if (err != "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('" + err + "');</script>");
            return;
        }

        StringBuilder strSql = new StringBuilder();

        //更新   
        strSql.Append("update in_Type set ");
        strSql.Append("inTitle = @inTitle ");
        strSql.Append("  where inId=@inId");
        int inId = int.Parse(Request.QueryString["id"]);

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@inId", SqlDbType.Int,4),
                    new SqlParameter("@inTitle", SqlDbType.VarChar,50)  };
        parameters[0].Value =inId;
        parameters[1].Value = txt_inTitle.Text;

        //提交到数据库
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Manage.aspx';</script>");
    }

}
