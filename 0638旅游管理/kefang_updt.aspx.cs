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

public partial class kefang_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            leixing.Items.Add("经济型");
            leixing.Items.Add("舒适型");
            leixing.Items.Add("商务型");
            leixing.Items.Add("总统型");
            daxiao.Items.Add("单人间");
            daxiao.Items.Add("双人间");
            daxiao.Items.Add("三人间");
            daxiao.Items.Add("多人间");
            string sql;
            sql = "select * from kefang where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                jiudian.Text = result.Tables[0].Rows[0]["jiudian"].ToString().Trim();kefangbianhao.Text = result.Tables[0].Rows[0]["kefangbianhao"].ToString().Trim();leixing.Text = result.Tables[0].Rows[0]["leixing"].ToString().Trim();daxiao.Text = result.Tables[0].Rows[0]["daxiao"].ToString().Trim();jiage.Text = result.Tables[0].Rows[0]["jiage"].ToString().Trim();beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update kefang set jiudian='" + jiudian.Text.ToString().Trim() + "',kefangbianhao='" + kefangbianhao.Text.ToString().Trim() + "',leixing='" + leixing.Text.ToString().Trim() + "',daxiao='" + daxiao.Text.ToString().Trim() + "',jiage='" + jiage.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

