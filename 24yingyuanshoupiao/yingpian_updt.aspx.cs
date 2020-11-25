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

public partial class yingpian_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
            yingpianleixing.Items.Add("动作片");
            yingpianleixing.Items.Add("爱情片");
            yingpianleixing.Items.Add("喜剧片");
            yingpianleixing.Items.Add("恐怖片");
            yingpianleixing.Items.Add("科幻片");
            string sql;
            sql = "select * from yingpian where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                bianhao.Text = result.Tables[0].Rows[0]["bianhao"].ToString().Trim();yingpianmingcheng.Text = result.Tables[0].Rows[0]["yingpianmingcheng"].ToString().Trim();shangyingshijian.Text = result.Tables[0].Rows[0]["shangyingshijian"].ToString().Trim();piaoshu.Text = result.Tables[0].Rows[0]["piaoshu"].ToString().Trim();didian.Text = result.Tables[0].Rows[0]["didian"].ToString().Trim();yingpianleixing.Text = result.Tables[0].Rows[0]["yingpianleixing"].ToString().Trim();piaojia.Text = result.Tables[0].Rows[0]["piaojia"].ToString().Trim();tupian.Text = result.Tables[0].Rows[0]["tupian"].ToString().Trim();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update yingpian set bianhao='" + bianhao.Text.ToString().Trim() + "',yingpianmingcheng='" + yingpianmingcheng.Text.ToString().Trim() + "',shangyingshijian='" + shangyingshijian.Text.ToString().Trim() + "',piaoshu='" + piaoshu.Text.ToString().Trim() + "',didian='" + didian.Text.ToString().Trim() + "',yingpianleixing='" + yingpianleixing.Text.ToString().Trim() + "',piaojia='" + piaojia.Text.ToString().Trim() + "',tupian='" + tupian.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('修改成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误');</script>");
        }
    }
}

