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

public partial class xuanzeti_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
            nanyichengdu.Items.Add("易");
            nanyichengdu.Items.Add("中");
            nanyichengdu.Items.Add("难");
            zhangjie.Items.Add("语文");
            zhangjie.Items.Add("数学");
            zhangjie.Items.Add("计算机");
            daan.Items.Add("A");
            daan.Items.Add("B");
            daan.Items.Add("C");
            daan.Items.Add("D");
            string sql;
            sql = "select * from xuanzeti where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                timu.Text = result.Tables[0].Rows[0]["timu"].ToString().Trim();nanyichengdu.Text = result.Tables[0].Rows[0]["nanyichengdu"].ToString().Trim();zhangjie.Text = result.Tables[0].Rows[0]["zhangjie"].ToString().Trim();xuanxiangA.Text = result.Tables[0].Rows[0]["xuanxiangA"].ToString().Trim();xuanxiangB.Text = result.Tables[0].Rows[0]["xuanxiangB"].ToString().Trim();xuanxiangC.Text = result.Tables[0].Rows[0]["xuanxiangC"].ToString().Trim();xuanxiangD.Text = result.Tables[0].Rows[0]["xuanxiangD"].ToString().Trim();daan.Text = result.Tables[0].Rows[0]["daan"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update xuanzeti set timu='" + timu.Text.ToString().Trim() + "',nanyichengdu='" + nanyichengdu.Text.ToString().Trim() + "',zhangjie='" + zhangjie.Text.ToString().Trim() + "',xuanxiangA='" + xuanxiangA.Text.ToString().Trim() + "',xuanxiangB='" + xuanxiangB.Text.ToString().Trim() + "',xuanxiangC='" + xuanxiangC.Text.ToString().Trim() + "',xuanxiangD='" + xuanxiangD.Text.ToString().Trim() + "',daan='" + daan.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

