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

public partial class jipiaoyuding : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null && Session["userip"] != null)
        {

        }
        else
        {
            Response.Write("<script>javascript:alert('对不起，请您先登陆！');location.href='default.aspx';</script>");
            Response.End();
        }
        if (!IsPostBack)
        {
            banjibianhao.Text = Request.QueryString["banjibianhao"].ToString().Trim();
            chufachengshi.Text = Request.QueryString["chufachengshi"].ToString().Trim();
            daodachengshi.Text = Request.QueryString["daodachengshi"].ToString().Trim();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into jipiaoyuding(banjibianhao,chufachengshi,daodachengshi,yudingshijian,yudingpiaoshu,nindexingming,nindedianhua,nindeshenfenzheng,beizhu,yonghuming) values('" + banjibianhao.Text.ToString().Trim() + "','" + chufachengshi.Text.ToString().Trim() + "','" + daodachengshi.Text.ToString().Trim() + "','" + yudingshijian.Text.ToString().Trim() + "','" + yudingpiaoshu.Text.ToString().Trim() + "','" + nindexingming.Text.ToString().Trim() + "','" + nindedianhua.Text.ToString().Trim() + "','" + nindeshenfenzheng.Text.ToString().Trim() + "','" + beizhu.Text.ToString().Trim() + "','" + Session["username"].ToString().Trim() + "') ";

        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }

}

