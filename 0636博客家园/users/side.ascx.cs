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
using System.Text;

public partial class users_side : System.Web.UI.UserControl
{
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dala = new DxxBlog.BLL.B_Article();
    public string myphoto = null, mynickname = null, mysex = null, uuid=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uid = Request.QueryString["uid"].ToString();
            if (!String.IsNullOrEmpty(uid))
            {
                DataTable dt = dalu.GetList("Id=" + uid).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    uuid = uid;
                    myphoto = dt.Rows[0]["AvatarImg"].ToString();
                    mynickname = dt.Rows[0]["Nickname"].ToString();
                    mysex = dt.Rows[0]["Sex"].ToString();
                }
            }
        }
        catch (Exception)
        {

        }
    }
    public string GetArType()
    {
        StringBuilder sb = new StringBuilder();
        DataTable dt = dalt.GetList("StrType=1 ").Tables[0];
        if (dt.Rows.Count > 0)
        {
            sb.Append("<table border='0' cellpadding='0' cellspacing='0' style='width: 200px; line-height: 30px;'> ");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                sb.Append("<tr>");
                sb.Append("<td style='padding-left: 30px;' align='left'>");
                sb.Append("<a>" + dt.Rows[i]["StrName"].ToString() + "</a>");
                sb.Append("</td></tr>");
            }
            sb.Append("</table>");
        }
        return sb.ToString();
    }
}
