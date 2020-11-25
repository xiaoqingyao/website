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

public partial class shijuanshengcheng_updt2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // xingbie.Items.Add("male"); 
            // xingbie.Items.Add("female");
            string sql;
            sql = "select * from shijuanshengcheng where id=" + Request.QueryString["id"].ToString().Trim();
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
                xuanzeti.Text = result.Tables[0].Rows[0]["xuanzeti"].ToString().Trim();
                tiankongti.Text = result.Tables[0].Rows[0]["tiankongti"].ToString().Trim();
                panduanti.Text = result.Tables[0].Rows[0]["panduanti"].ToString().Trim();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string sql;

        sql = "update shijuanshengcheng set xuanzeti='" + xuanzeti.Text.ToString().Trim() + "',tiankongti='" + tiankongti.Text.ToString().Trim() + "',panduanti='" + panduanti.Text.ToString().Trim() + "' where id=" + Request.QueryString["id"].ToString().Trim();
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

