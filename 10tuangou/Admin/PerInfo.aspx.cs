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

public partial class Admin_PerInfo : System.Web.UI.Page
{
    DataBase DB = new DataBase();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            String perinfoid = Request["perinfoid"];
            String sql = "select * from PersonalInfo where personalInfoId='" + perinfoid + "'";
            dt = DB.RunDataSet(sql).Tables[0];
            this.lixiren.Text = System.Convert.ToString(dt.Rows[0][4]);
            this.address.Text = System.Convert.ToString(dt.Rows[0][2]);
            this.sex.Text = System.Convert.ToString(dt.Rows[0][6]);
            this.phone.Text = System.Convert.ToString(dt.Rows[0][3]);
            this.mphone.Text = System.Convert.ToString(dt.Rows[0][5]);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!this.IsStartupScriptRegistered("Startup"))
            this.RegisterStartupScript("Startup", "<script language=javascript>window.returnValue=false;window.close();</script>");
    }
}
