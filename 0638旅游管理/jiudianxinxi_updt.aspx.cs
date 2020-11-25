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

public partial class jiudianxinxi_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
            xingji.Items.Add("一");
            xingji.Items.Add("二");
            xingji.Items.Add("三");
            xingji.Items.Add("四");
            xingji.Items.Add("五");
            string sql;
            sql = "select * from jiudianxinxi where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                bianhao.Text = result.Tables[0].Rows[0]["bianhao"].ToString().Trim();mingcheng.Text = result.Tables[0].Rows[0]["mingcheng"].ToString().Trim();xingji.Text = result.Tables[0].Rows[0]["xingji"].ToString().Trim();dizhi.Text = result.Tables[0].Rows[0]["dizhi"].ToString().Trim();dianhua.Text = result.Tables[0].Rows[0]["dianhua"].ToString().Trim();zhaopian.Text = result.Tables[0].Rows[0]["zhaopian"].ToString().Trim();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update jiudianxinxi set bianhao='" + bianhao.Text.ToString().Trim() + "',mingcheng='" + mingcheng.Text.ToString().Trim() + "',xingji='" + xingji.Text.ToString().Trim() + "',dizhi='" + dizhi.Text.ToString().Trim() + "',dianhua='" + dianhua.Text.ToString().Trim() + "',zhaopian='" + zhaopian.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

