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

public partial class zuoyefabu_detail : System.Web.UI.Page
{
    public string nbianhao, nzuoyemingcheng, nkecheng, nfujian, nneirong, nfaburen;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
            Response.End();
        }
        if (!IsPostBack)
        {
            string sql;
            sql = "select * from zuoyefabu where id=" + Request.QueryString["id"].ToString().Trim();
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
                nbianhao = result.Tables[0].Rows[0]["bianhao"].ToString().Trim();
                nzuoyemingcheng = result.Tables[0].Rows[0]["zuoyemingcheng"].ToString().Trim();
                nkecheng = result.Tables[0].Rows[0]["kecheng"].ToString().Trim();
                nfujian = result.Tables[0].Rows[0]["fujian"].ToString().Trim();
                nneirong = result.Tables[0].Rows[0]["neirong"].ToString().Trim();
                nfaburen = result.Tables[0].Rows[0]["faburen"].ToString().Trim();
            }
        }
    }

}

