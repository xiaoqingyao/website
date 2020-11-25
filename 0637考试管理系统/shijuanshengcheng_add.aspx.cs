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

public partial class shijuanshengcheng_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
        {
            zhangjie.Items.Add("所有");
            zhangjie.Items.Add("语文");
            zhangjie.Items.Add("数学");
            zhangjie.Items.Add("计算机");
			
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql,nxuanzeti,nzhangjie,npanduanti,ntiankongti;
        nxuanzeti = "";
        npanduanti = "";
        ntiankongti = "";
        nzhangjie = zhangjie.Text.ToString().Trim();
        int nxuanzetishu = int.Parse(xuanzetishu.Text.ToString().Trim());
        int npanduantishu = int.Parse(panduantishu.Text.ToString().Trim());
        int ntiankongtishu = int.Parse(tiankongtishu.Text.ToString().Trim());
        int i = 0;
        sql = "select top " + nxuanzetishu + " id from xuanzeti where 1=1";
        if (nzhangjie != "所有")
        {
            sql = sql + " and zhangjie='"+nzhangjie+"'";
        }
        sql=sql+" order by newid()";
        DataSet result2 = new DataSet();
        result2 = new Class1().hsggetdata(sql);
        if (result2 != null)
        {
            for (i = 0; i < nxuanzetishu; i++)
            {
                nxuanzeti = nxuanzeti + result2.Tables[0].Rows[i][0].ToString().Trim() + ",";
            }
            nxuanzeti = nxuanzeti.Substring(0, nxuanzeti.Length - 1);
        }

        sql = "select top " + npanduantishu + " id from panduanti where 1=1";
        if (nzhangjie != "所有")
        {
            sql = sql + " and zhangjie='" + nzhangjie + "'";
        }
        sql = sql + "  order by newid()";
        result2 = new Class1().hsggetdata(sql);
        if (result2 != null)
        {
            for (i = 0; i < npanduantishu; i++)
            {
                npanduanti = npanduanti + result2.Tables[0].Rows[i][0].ToString().Trim() + ",";
            }
            npanduanti = npanduanti.Substring(0, npanduanti.Length - 1);
        }

        sql = "select top " + ntiankongtishu + " id from tiankongti where 1=1";
        if (nzhangjie != "所有")
        {
            sql = sql + " and zhangjie='" + nzhangjie + "'";
        }
        sql = sql + "  order by newid()";
        result2 = new Class1().hsggetdata(sql);
        if (result2 != null)
        {
            for (i = 0; i < ntiankongtishu; i++)
            {
                ntiankongti = ntiankongti + result2.Tables[0].Rows[i][0].ToString().Trim() + ",";
            }
            ntiankongti = ntiankongti.Substring(0, ntiankongti.Length - 1);
        }


        sql = "insert into shijuanshengcheng(shijuanbianhao,zhangjie,xuanzetishu,xuanzetifenzhi,panduantishu,panduantifenzhi,tiankongtishu,tiankongtifenzhi,xuanzeti,panduanti,tiankongti) values('" + shijuanbianhao.Text.ToString().Trim() + "','" + zhangjie.Text.ToString().Trim() + "','" + xuanzetishu.Text.ToString().Trim() + "','" + xuanzetifenzhi.Text.ToString().Trim() + "','" + panduantishu.Text.ToString().Trim() + "','" + panduantifenzhi.Text.ToString().Trim() + "','" + tiankongtishu.Text.ToString().Trim() + "','" + tiankongtifenzhi.Text.ToString().Trim() + "','" + nxuanzeti + "','"+npanduanti+"','"+ntiankongti+"') ";
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
	
}

