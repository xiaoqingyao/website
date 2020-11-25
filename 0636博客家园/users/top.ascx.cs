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

public partial class users_top : System.Web.UI.UserControl
{
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    DxxBlog.BLL.B_RoomInfo dal = new DxxBlog.BLL.B_RoomInfo();
    public string info = null, descrp = null,uuid=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uid = Request.QueryString["uid"].ToString();
            if (!String.IsNullOrEmpty(uid))
            {
                    uuid = uid;
                DataTable dt = dal.GetList("UserId=" + uid).Tables[0];
                if (dt.Rows.Count>0)
                {
                    info = dt.Rows[0]["StrTitle"].ToString();
                    descrp = dt.Rows[0]["StrDescription"].ToString();
                }
            }
        }
        catch (Exception)
        {
            
        }
        
    }
}
