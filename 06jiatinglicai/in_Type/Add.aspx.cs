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

public partial class in_Type_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            (Master.FindControl("Label1") as Label).Text = "添加收支类型信息";
        
        }
    }
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

        //设置添加Sql
        StringBuilder strSql = new StringBuilder();
        strSql.Append(@"insert into In_Type ( inTitle ) ");
        strSql.Append(@" values (@inTitle)");

        //设置参数
        SqlParameter[] parameters = new SqlParameter[] {
            new SqlParameter("@inTitle", SqlDbType.VarChar,50)        };

        parameters[0].Value =txt_inTitle.Text;
        SqlHelper.ExecuteNonQuery(strSql.ToString(), CommandType.Text, parameters);

        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('操作成功！');location.href='Add.aspx';</script>");   

    }
}
