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

public partial class jipiaoyuding_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            string sql;
            sql = "select * from jipiaoyuding where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                banjibianhao.Text = result.Tables[0].Rows[0]["banjibianhao"].ToString().Trim();chufachengshi.Text = result.Tables[0].Rows[0]["chufachengshi"].ToString().Trim();daodachengshi.Text = result.Tables[0].Rows[0]["daodachengshi"].ToString().Trim();yudingshijian.Text = result.Tables[0].Rows[0]["yudingshijian"].ToString().Trim();yudingpiaoshu.Text = result.Tables[0].Rows[0]["yudingpiaoshu"].ToString().Trim();nindexingming.Text = result.Tables[0].Rows[0]["nindexingming"].ToString().Trim();nindedianhua.Text = result.Tables[0].Rows[0]["nindedianhua"].ToString().Trim();nindeshenfenzheng.Text = result.Tables[0].Rows[0]["nindeshenfenzheng"].ToString().Trim();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update jipiaoyuding set banjibianhao='" + banjibianhao.Text.ToString().Trim() + "',chufachengshi='" + chufachengshi.Text.ToString().Trim() + "',daodachengshi='" + daodachengshi.Text.ToString().Trim() + "',yudingshijian='" + yudingshijian.Text.ToString().Trim() + "',yudingpiaoshu='" + yudingpiaoshu.Text.ToString().Trim() + "',nindexingming='" + nindexingming.Text.ToString().Trim() + "',nindedianhua='" + nindedianhua.Text.ToString().Trim() + "',nindeshenfenzheng='" + nindeshenfenzheng.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

