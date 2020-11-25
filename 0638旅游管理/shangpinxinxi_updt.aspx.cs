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

public partial class shangpinxinxi_updt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       
   
        if (!IsPostBack)
        {
            addxiala("alllb", "lb", "kehubianhao");
            string sql;
            sql = "select * from shangpinxinxi where id=" + Request.QueryString["id"].ToString().Trim() ;
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
                bianhao.Text = result.Tables[0].Rows[0]["bianhao"].ToString().Trim();mingcheng.Text = result.Tables[0].Rows[0]["mingcheng"].ToString().Trim();jiage.Text = result.Tables[0].Rows[0]["jiage"].ToString().Trim();leibie.Text = result.Tables[0].Rows[0]["leibie"].ToString().Trim();jianjie.Text = result.Tables[0].Rows[0]["jianjie"].ToString().Trim();tupian.Text = result.Tables[0].Rows[0]["tupian"].ToString().Trim();kucun.Text = result.Tables[0].Rows[0]["kucun"].ToString().Trim();faburen.Text = result.Tables[0].Rows[0]["faburen"].ToString().Trim();
                
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string sql;
        
        sql = "update shangpinxinxi set bianhao='" + bianhao.Text.ToString().Trim() + "',mingcheng='" + mingcheng.Text.ToString().Trim() + "',jiage='" + jiage.Text.ToString().Trim() + "',leibie='" + leibie.Text.ToString().Trim() + "',jianjie='" + jianjie.Text.ToString().Trim() + "',tupian='" + tupian.Text.ToString().Trim() + "',kucun='" + kucun.Text.ToString().Trim() + "',faburen='" + faburen.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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
    private void addxiala(string ntable, string nzd, string nxlk)
    {
        string sql;
        sql = "select " + nzd + " from " + ntable + " order by id desc";
        DataSet result = new DataSet();
        result = new Class1().hsggetdata(sql);
        if (result != null)
        {
            if (result.Tables[0].Rows.Count > 0)
            {
                int i = 0;
                for (i = 0; i < result.Tables[0].Rows.Count; i++)
                {
                    leibie.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
                }
            }
        }
    }
}

