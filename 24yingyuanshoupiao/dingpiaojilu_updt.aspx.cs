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

public partial class dingpiaojilu_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            string sql;
            sql = "select * from dingpiaojilu where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                dingpiaoren.Text = result.Tables[0].Rows[0]["dingpiaoren"].ToString().Trim();yingpianbianhao.Text = result.Tables[0].Rows[0]["yingpianbianhao"].ToString().Trim();yingpianmingcheng.Text = result.Tables[0].Rows[0]["yingpianmingcheng"].ToString().Trim();fangyingshijian.Text = result.Tables[0].Rows[0]["fangyingshijian"].ToString().Trim();fangyingdidian.Text = result.Tables[0].Rows[0]["fangyingdidian"].ToString().Trim();zuowei.Text = result.Tables[0].Rows[0]["zuowei"].ToString().Trim();piaojia.Text = result.Tables[0].Rows[0]["piaojia"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update dingpiaojilu set dingpiaoren='" + dingpiaoren.Text.ToString().Trim() + "',yingpianbianhao='" + yingpianbianhao.Text.ToString().Trim() + "',yingpianmingcheng='" + yingpianmingcheng.Text.ToString().Trim() + "',fangyingshijian='" + fangyingshijian.Text.ToString().Trim() + "',fangyingdidian='" + fangyingdidian.Text.ToString().Trim() + "',zuowei='" + zuowei.Text.ToString().Trim() + "',piaojia='" + piaojia.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

