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

public partial class xueshengxinxi_updt2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			 xingbie.Items.Add("male"); 
			 xingbie.Items.Add("female");
            string sql;
            sql = "select * from xueshengxinxi where xuehao='" + Session["username"].ToString().Trim() + "'";
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
                xuehao.Text = result.Tables[0].Rows[0]["xuehao"].ToString().Trim();mima.Text = result.Tables[0].Rows[0]["mima"].ToString().Trim();xingming.Text = result.Tables[0].Rows[0]["xingming"].ToString().Trim();banji.Text = result.Tables[0].Rows[0]["banji"].ToString().Trim();xingbie.Text = result.Tables[0].Rows[0]["xingbie"].ToString().Trim();dianhua.Text = result.Tables[0].Rows[0]["dianhua"].ToString().Trim();shenfenzheng.Text = result.Tables[0].Rows[0]["shenfenzheng"].ToString().Trim();zhaopian.Text = result.Tables[0].Rows[0]["zhaopian"].ToString().Trim();chushengnianyue.Text = DateTime.Parse(result.Tables[0].Rows[0]["chushengnianyue"].ToString().Trim()).ToShortDateString();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update xueshengxinxi set xuehao='" + xuehao.Text.ToString().Trim() + "',mima='" + mima.Text.ToString().Trim() + "',xingming='" + xingming.Text.ToString().Trim() + "',banji='" + banji.Text.ToString().Trim() + "',xingbie='" + xingbie.Text.ToString().Trim() + "',dianhua='" + dianhua.Text.ToString().Trim() + "',shenfenzheng='" + shenfenzheng.Text.ToString().Trim() + "',zhaopian='" + zhaopian.Text.ToString().Trim() + "',chushengnianyue='" + chushengnianyue.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where xuehao='" + Session["username"].ToString().Trim() + "'";
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

