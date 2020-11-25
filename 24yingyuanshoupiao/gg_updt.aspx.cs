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

public partial class gg_updt : System.Web.UI.Page
{
    public string sql, dID;

    protected void Page_Load(object sender, EventArgs e)
    {
        dID = Request.QueryString["id"].ToString().Trim();
        if (!IsPostBack)
        {

            sql = "select * from allgonggao where id=" + dID;
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
                title.Text = result.Tables[0].Rows[0]["title"].ToString().Trim();
                WebEditor1.Text = result.Tables[0].Rows[0]["content"].ToString().Trim();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sql = "update allgonggao set title='" + title.Text.ToString().Trim() + "',content='" + WebEditor1.Text + "' where id=" + dID;
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
