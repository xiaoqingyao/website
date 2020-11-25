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

public partial class jipiaoxinxi_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            string sql;
            sql = "select * from jipiaoxinxi where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                banjibianhao.Text = result.Tables[0].Rows[0]["banjibianhao"].ToString().Trim();chufachengshi.Text = result.Tables[0].Rows[0]["chufachengshi"].ToString().Trim();daodachengshi.Text = result.Tables[0].Rows[0]["daodachengshi"].ToString().Trim();chufashijian.Text = result.Tables[0].Rows[0]["chufashijian"].ToString().Trim();daodashijian.Text = result.Tables[0].Rows[0]["daodashijian"].ToString().Trim();jiage.Text = result.Tables[0].Rows[0]["jiage"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update jipiaoxinxi set banjibianhao='" + banjibianhao.Text.ToString().Trim() + "',chufachengshi='" + chufachengshi.Text.ToString().Trim() + "',daodachengshi='" + daodachengshi.Text.ToString().Trim() + "',chufashijian='" + chufashijian.Text.ToString().Trim() + "',daodashijian='" + daodashijian.Text.ToString().Trim() + "',jiage='" + jiage.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

