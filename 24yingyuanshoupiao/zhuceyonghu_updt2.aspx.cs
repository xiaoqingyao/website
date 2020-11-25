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

public partial class zhuceyonghu_updt2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            xingbie.Items.Add("male");
            xingbie.Items.Add("female");
            string sql;
            sql = "select * from zhuceyonghu where yonghuming='" +Session["username"].ToString().Trim()+"'";
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
                yonghuming.Text = result.Tables[0].Rows[0]["yonghuming"].ToString().Trim(); mima.Text = result.Tables[0].Rows[0]["mima"].ToString().Trim(); xingming.Text = result.Tables[0].Rows[0]["xingming"].ToString().Trim(); dianhua.Text = result.Tables[0].Rows[0]["dianhua"].ToString().Trim(); youxiang.Text = result.Tables[0].Rows[0]["youxiang"].ToString().Trim(); shenfenzheng.Text = result.Tables[0].Rows[0]["shenfenzheng"].ToString().Trim(); xingbie.Text = result.Tables[0].Rows[0]["xingbie"].ToString().Trim(); beizhu.Text = result.Tables[0].Rows[0]["beizhu"].ToString().Trim();

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string sql;

        sql = "update zhuceyonghu set yonghuming='" + yonghuming.Text.ToString().Trim() + "',mima='" + mima.Text.ToString().Trim() + "',xingming='" + xingming.Text.ToString().Trim() + "',dianhua='" + dianhua.Text.ToString().Trim() + "',youxiang='" + youxiang.Text.ToString().Trim() + "',shenfenzheng='" + shenfenzheng.Text.ToString().Trim() + "',xingbie='" + xingbie.Text.ToString().Trim() + "',beizhu='" + beizhu.Text.ToString().Trim() + "' where yonghuming='" + Session["username"].ToString().Trim()+"'";
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

