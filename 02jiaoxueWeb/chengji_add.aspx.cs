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

public partial class chengji_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
        {
            kemu.Items.Add("语文");
            kemu.Items.Add("数学");
            kemu.Items.Add("英语");
            kemu.Items.Add("法律");
            kemu.Items.Add("计算机");

            int i = 0;
            for (i = DateTime.Now.Year; i > 2005; i--)
            {
                xuenian.Items.Add(i.ToString().Trim());
            }

            xueqi.Items.Add("1");
            xueqi.Items.Add("2");

			// xingbie.Items.Add("male"); 
			// xingbie.Items.Add("female");
			// addxiala("kehuxinxi","bianhao","kehubianhao");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql="insert into chengji(xuehao,xingming,kemu,xuenian,xueqi,chengji,beizhu) values('"+xuehao.Text.ToString().Trim()+"','"+xingming.Text.ToString().Trim()+"','"+kemu.Text.ToString().Trim()+"','"+xuenian.Text.ToString().Trim()+"','"+xueqi.Text.ToString().Trim()+"','"+chengji.Text.ToString().Trim()+"','"+beizhu.Text.ToString().Trim()+"') ";
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
	//private void addxiala(string ntable, string nzd, string nxlk)
    //{
    //    string sql;
    //    sql = "select "+nzd+" from "+ntable+" order by id desc";
    //    DataSet result = new DataSet();
    //    result = new Class1().hsggetdata(sql);
    //    if (result != null)
    //    {
    //        if (result.Tables[0].Rows.Count > 0)
    //       {
    //            int i = 0;
    //            for (i = 0; i < result.Tables[0].Rows.Count; i++)
    //            {
    //                kehubianhao.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
    //            }
    //        }
    //    }
    //}
}

