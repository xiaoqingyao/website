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
    protected void btLogin_Click(object sender, ImageClickEventArgs e)
    {
       
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox2.Text.ToString().Trim() == "" || TextBox1.Text.ToString().Trim() == "")
        {
            Response.Write("<script>javascript:alert('请输入完整');history.back();</script>");
            Response.End();
        }
        string sql;
       
            sql = "select * from allusers where username='" + TextBox2.Text.ToString().Trim() + "' and pwd='" + TextBox1.Text.ToString().Trim() + "'";
       
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        // result = new TestOnline.Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                Session["username"] = TextBox2.Text.ToString().Trim();

                
                    Session["role"] = result.Tables[0].Rows[0]["cx"].ToString().Trim();
                

                Response.Redirect("default.htm");
            }
            else
            {
                Response.Write("<script>javascript:alert('对不起，用户名或密码不正确!');</script>");
            }
        }
        else
        {
            Response.Write("<script>javascript:alert('对不起，系统错误，请不要越权操作!');</script>");
        }
    }
}
