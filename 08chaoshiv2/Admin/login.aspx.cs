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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text.ToString().Trim() == "" || TextBox1.Text.ToString().Trim() == "")
        {
            Response.Write("<script>javascript:alert('请输入完整');history.back();</script>");
            Response.End();
        }
        string sql;

        
         
            sql = "select * from TB_Admin where UserName='" + TextBox1.Text.ToString().Trim() + "' and PassWord='" + TextBox2.Text.ToString().Trim() + "'";
            DataSet result = DBHelper.GetDataSet(sql);
            if (result != null)
            {
                if (result.Tables[0].Rows.Count > 0)
                {
                    Session["username"] = TextBox1.Text.ToString().Trim();
                    Session["PWD"] = TextBox2.Text.ToString().Trim();
                    Session["cx"] = "管理员";
                    Response.Redirect("main.aspx");
                }
                else
                {
                    Response.Write("<script>javascript:alert('对不起，用户名或密码不正确!');history.back();</script>");
                }
            }
            else
            {
                Response.Write("<script>javascript:alert('对不起，系统错误，请不要越权操作!');</script>");
            }

         
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.TextBox1.Text = "";
        this.TextBox2.Text = "";
    }
   
}
