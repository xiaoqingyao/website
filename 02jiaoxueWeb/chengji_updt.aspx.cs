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

public partial class chengji_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            string sql;
            sql = "select * from chengji where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                xuehao.Text = result.Tables[0].Rows[0]["xuehao"].ToString().Trim();xingming.Text = result.Tables[0].Rows[0]["xingming"].ToString().Trim();kemu.Text = result.Tables[0].Rows[0]["kemu"].ToString().Trim();xuenian.Text = result.Tables[0].Rows[0]["xuenian"].ToString().Trim();xueqi.Text = result.Tables[0].Rows[0]["xueqi"].ToString().Trim();chengji.Text = result.Tables[0].Rows[0]["chengji"].ToString().Trim();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update chengji set xuehao='" + xuehao.Text.ToString().Trim() + "',xingming='" + xingming.Text.ToString().Trim() + "',kemu='" + kemu.Text.ToString().Trim() + "',xuenian='" + xuenian.Text.ToString().Trim() + "',xueqi='" + xueqi.Text.ToString().Trim() + "',chengji='" + chengji.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('�޸ĳɹ�');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('ϵͳ����');</script>");
        }
    }
}

