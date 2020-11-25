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

public partial class users_myinfos : System.Web.UI.Page
{
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uid = Request.QueryString["uid"].ToString();
            if (!String.IsNullOrEmpty(uid))
            {
                DataTable dt = dalu.GetList("Id=" + uid).Tables[0];
                if (dt.Rows.Count>0)
                {
                    lblusername.Text = dt.Rows[0]["UserName"].ToString();
                    lbllogname.Text = dt.Rows[0]["LogName"].ToString();
                    lblnicheng.Text = dt.Rows[0]["Nickname"].ToString();
                    lblsex.Text = dt.Rows[0]["Sex"].ToString();
                    lbltel.Text = dt.Rows[0]["Tel"].ToString();
                    lblmobile.Text = dt.Rows[0]["Mobile"].ToString();
                    lblbirthday.Text = dt.Rows[0]["Birthday"].ToString();
                    lblemail.Text = dt.Rows[0]["Email"].ToString();
                    lblzhiye.Text = dt.Rows[0]["Professional"].ToString();
                    lblregisdate.Text = dt.Rows[0]["RegisDate"].ToString();
                    lbladss.Text = dt.Rows[0]["Address"].ToString();
                    lbljianjie.Text = dt.Rows[0]["Profile"].ToString();
                    Photos.Src = "../UpFile/Photos/" + dt.Rows[0]["AvatarImg"].ToString();
                }
            }
        }
        catch (Exception)
        {

        }
    }
}
