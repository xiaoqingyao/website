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

public partial class rule_editRule : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = bc.GetDataSet("select * from [rule]", "rule");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row) 
            {
                TextBox1.Text= rs["content"].ToString();
            }
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bc.ExecSQL("update [rule] set content='"+TextBox1.Text+"'where id=1");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
    }
}
