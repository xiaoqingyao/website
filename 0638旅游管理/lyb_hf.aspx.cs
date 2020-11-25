using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class lyb_hf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sql;
            sql = "select rebody from book where id="+Request.QueryString["id"].ToString().Trim();
            DataSet result = new DataSet();
            result = new Class1().hsggetdata(sql);
            if (result != null)
            {

                if (result.Tables[0].Rows.Count > 0)
                {
                    TextBox1.Text = result.Tables[0].Rows[0][0].ToString().Trim();
                }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "update book set rebody='"+TextBox1.Text.ToString().Trim()+"' where id=" + Request.QueryString["id"].ToString().Trim();
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('回复成功');location.href='lyb_gl.aspx';</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }
}
