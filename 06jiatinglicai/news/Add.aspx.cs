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

public partial class news_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加投资资讯";
        
        }
    }
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

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into News ( title,memo ) ");
        strSql.Append(@" values (@title,@memo)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@title", SqlDbType.VarChar,100),
            new SqlParameter("@memo", SqlDbType.NText,50000)        };

        parameters[0].Value =txt_title.Text;
        parameters[1].Value =Textarea1.Value;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('保存成功！');location.href='Add.aspx';</script>");
    }
}
