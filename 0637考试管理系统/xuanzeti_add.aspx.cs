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

public partial class xuanzeti_add : System.Web.UI.Page
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
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql="insert into xuanzeti(timu,nanyichengdu,zhangjie,xuanxiangA,xuanxiangB,xuanxiangC,xuanxiangD,daan) values('"+timu.Text.ToString().Trim()+"','"+nanyichengdu.Text.ToString().Trim()+"','"+zhangjie.Text.ToString().Trim()+"','"+xuanxiangA.Text.ToString().Trim()+"','"+xuanxiangB.Text.ToString().Trim()+"','"+xuanxiangC.Text.ToString().Trim()+"','"+xuanxiangD.Text.ToString().Trim()+"','"+daan.Text.ToString().Trim()+"') ";
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

