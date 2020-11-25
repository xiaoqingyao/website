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

public partial class users_myphoto : System.Web.UI.Page
{
    DxxBlog.BLL.B_Img dal = new DxxBlog.BLL.B_Img();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uid = Request.QueryString["uid"].ToString();
            if (!String.IsNullOrEmpty(uid))
            {
                DataTable dt = dal.GetList("StrUser=" + uid).Tables[0]; ;
                rptList.DataSource = dt;
                rptList.DataBind();
            }
        }
        catch (Exception)
        {

        }
    }
    public string reftitlepic(object o, int num)
    {
        if (o.ToString().Length >= num)
            return o.ToString().Substring(0, num) + "...";
        else
            return o.ToString();
    }
}
