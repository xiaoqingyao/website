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

public partial class pro_detail : System.Web.UI.Page
{
    public string nid, npic;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                string sql;

                sql = "select * from allpro where id=" + Request["id"].ToString();
                getdata(sql);
            }
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
                Label1.Text = result.Tables[0].Rows[0]["mc"].ToString().Trim();
                Label2.Text = result.Tables[0].Rows[0]["addtime"].ToString().Trim();
               // Label3.Text = result.Tables[0].Rows[0]["price1"].ToString().Trim();
                Label4.Text = result.Tables[0].Rows[0]["mc"].ToString().Trim();
                Label5.Text = result.Tables[0].Rows[0]["content"].ToString().Trim();
                npic = result.Tables[0].Rows[0]["fn"].ToString().Trim();
                nid = result.Tables[0].Rows[0]["id"].ToString().Trim();
                Label7.Text = result.Tables[0].Rows[0]["lb"].ToString().Trim();
                //Label6.Text = result.Tables[0].Rows[0]["shuliang"].ToString().Trim();
               
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // Response.Redirect("gwc.aspx?id="+Request.QueryString["id"].ToString().Trim()+"&kc="+Label6.Text.ToString().Trim()+"&shuliang="+shuliang.Text.ToString().Trim());
    }
}
