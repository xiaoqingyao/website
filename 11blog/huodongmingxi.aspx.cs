using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class huodongmingxi : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request["huodongid"];
         DataSet ds = new Class1().hsggetdata("select * from huodong where listid='" + id + "'");
         if (ds != null && ds.Tables.Count > 0)
         {
             this.txtContent.Text = ds.Tables[0].Rows[0]["neirong"].ToString();
             this.txtDate.Value = ds.Tables[0].Rows[0]["riqi"].ToString();
             this.txtJfen.Text = ds.Tables[0].Rows[0]["jifen"].ToString();
             this.txtMaxRenShu.Text = ds.Tables[0].Rows[0]["maxrenshu"].ToString();
             this.txtTitle.Text = ds.Tables[0].Rows[0]["biaoti"].ToString();
         }
    }
}
