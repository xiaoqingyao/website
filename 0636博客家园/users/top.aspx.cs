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

public partial class users_top : System.Web.UI.Page
{
    public string uuuu = null,uid=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            uid = Session["userid"].ToString();
            uuuu = Session["logname"].ToString();
        }
        catch (Exception ex)
        {

        }
    }
}
