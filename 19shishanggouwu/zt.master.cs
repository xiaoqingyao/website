
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Common;
using BLL;
using Model;
public partial class zt : System.Web.UI.MasterPage
{
    public DataTable dt;
     
    protected void Page_Load(object sender, EventArgs e)
    {
        load();
    }

    public void load()
    {

        string sql = "select top 9 * from news  ";
        dt = DbHelperSQL.Query(sql).Tables[0];
        if (Session["_username"] != null)
        {
            string aa = " ,欢迎您光临Fashion Mall！！";
            btnzhuxiao.Visible = true;
            welcome.Text = Session["_username"].ToString() + aa.ToString() + " ";
        }
        else {
            btnzhuxiao.Visible = false;
            welcome.Text = "";
        }
        string str = "select top 7 * from news order by _id desc  ";
        DataSet ds = DB.dataSet(str);
        Repeater1.DataSource = ds.Tables[0];
        Repeater1.DataBind();

        int id = 27;
        BLLhelp bllhelp = new BLLhelp();
        DataSet ds1 = bllhelp.cj_ds(id);
        Repeater2.DataSource = ds1;
        Repeater2.DataBind();

        int id1 = 26;
        DataSet ds2 = bllhelp._selectAll(id1);
        Re_xs.DataSource = ds2;
        Re_xs.DataBind();

        int id2 = 19;
        DataSet ds3 = bllhelp._selectAll(id2);
        Re_ps.DataSource = ds3;
        Re_ps.DataBind();

    }

    protected void btnzhuxiao_Click(object sender, EventArgs e)
    {
        Session["_userid"] = null;
        Session.Remove("_userid");
        Session["_username"] = null;
        Session.Remove("_username");
        
        Response.Redirect("Login.aspx");
        
    }
}
