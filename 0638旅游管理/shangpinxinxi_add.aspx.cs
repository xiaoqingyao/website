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

public partial class shangpinxinxi_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
        {
            faburen.Text = Session["username"].ToString().Trim();
			 addxiala("alllb","lb","kehubianhao");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql="insert into shangpinxinxi(bianhao,mingcheng,jiage,leibie,jianjie,tupian,kucun,faburen) values('"+bianhao.Text.ToString().Trim()+"','"+mingcheng.Text.ToString().Trim()+"','"+jiage.Text.ToString().Trim()+"','"+leibie.Text.ToString().Trim()+"','"+jianjie.Text.ToString().Trim()+"','"+tupian.Text.ToString().Trim()+"','"+kucun.Text.ToString().Trim()+"','"+faburen.Text.ToString().Trim()+"') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
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

