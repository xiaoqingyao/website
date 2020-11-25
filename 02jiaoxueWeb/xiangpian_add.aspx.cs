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

public partial class xiangpian_add : System.Web.UI.Page
{
    //public string fname;
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
        {
			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
            addxiala("xiangce", "mingcheng", "kehubianhao");
            tianjiaren.Text = Session["username"].ToString().Trim();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        
        sql="insert into xiangpian(bianhao,mingcheng,xiangce,wenjian,beizhu,tianjiaren) values('"+bianhao.Text.ToString().Trim()+"','"+mingcheng.Text.ToString().Trim()+"','"+xiangce.Text.ToString().Trim()+"','"+wenjian.Text.ToString().Trim()+"','"+beizhu.Text.ToString().Trim()+"','"+tianjiaren.Text.ToString().Trim()+"') ";
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
                    xiangce.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
                }
            }
        }
    }
   
}

