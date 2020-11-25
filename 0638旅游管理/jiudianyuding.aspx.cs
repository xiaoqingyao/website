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

public partial class jiudianyuding : System.Web.UI.Page
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
            string sql;
            sql = "select * from kefang where id=" + Request.QueryString["id"].ToString().Trim();
            getdata(sql);
        }
    }

    private void getdata(string sql)
    {
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {

            if (result.Tables[0].Rows.Count > 0)
            {
                jiudianmingcheng.Text = result.Tables[0].Rows[0]["jiudian"].ToString().Trim();
                kefangbianhao.Text = result.Tables[0].Rows[0]["kefangbianhao"].ToString().Trim();
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into jiudianyuding(jiudianmingcheng,yudingshijian,yudingtianshu,nindexingming,nindedianhua,nindeshenfenzheng,beizhu,yonghuming,kefangbianhao) values('" + jiudianmingcheng.Text.ToString().Trim() + "','" + yudingshijian.Text.ToString().Trim() + "','" + yudingtianshu.Text.ToString().Trim() + "','" + nindexingming.Text.ToString().Trim() + "','" + nindedianhua.Text.ToString().Trim() + "','" + nindeshenfenzheng.Text.ToString().Trim() + "','" + beizhu.Text.ToString().Trim() + "','" + Session["username"].ToString().Trim() + "','" + kefangbianhao.Text.ToString().Trim() + "') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('预订成功');location.href='default.aspx';</script>");
            Response.End();
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
        }
    }
}
