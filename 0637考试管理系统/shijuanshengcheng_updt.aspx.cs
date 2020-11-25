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

public partial class shijuanshengcheng_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            string sql;
            sql = "select * from shijuanshengcheng where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                shijuanbianhao.Text = result.Tables[0].Rows[0]["shijuanbianhao"].ToString().Trim();zhangjie.Text = result.Tables[0].Rows[0]["zhangjie"].ToString().Trim();xuanzetishu.Text = result.Tables[0].Rows[0]["xuanzetishu"].ToString().Trim();xuanzetifenzhi.Text = result.Tables[0].Rows[0]["xuanzetifenzhi"].ToString().Trim();panduantishu.Text = result.Tables[0].Rows[0]["panduantishu"].ToString().Trim();panduantifenzhi.Text = result.Tables[0].Rows[0]["panduantifenzhi"].ToString().Trim();tiankongtishu.Text = result.Tables[0].Rows[0]["tiankongtishu"].ToString().Trim();tiankongtifenzhi.Text = result.Tables[0].Rows[0]["tiankongtifenzhi"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update shijuanshengcheng set shijuanbianhao='" + shijuanbianhao.Text.ToString().Trim() + "',zhangjie='" + zhangjie.Text.ToString().Trim() + "',xuanzetishu='" + xuanzetishu.Text.ToString().Trim() + "',xuanzetifenzhi='" + xuanzetifenzhi.Text.ToString().Trim() + "',panduantishu='" + panduantishu.Text.ToString().Trim() + "',panduantifenzhi='" + panduantifenzhi.Text.ToString().Trim() + "',tiankongtishu='" + tiankongtishu.Text.ToString().Trim() + "',tiankongtifenzhi='" + tiankongtifenzhi.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

