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

public partial class index : System.Web.UI.Page
{
    public string strpics = "";
    public string strlinks = "";
    public string strtexts = "";
    DxxBlog.BLL.B_News daln = new DxxBlog.BLL.B_News();
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        strpics = "images/1.jpg|images/2.jpg|images/3.jpg";
        strlinks = "#|#|#";
        strtexts = "#|#|#";

        if (!IsPostBack)
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
    public string BindNews()
    {
        DataTable dt1 = daln.GetList(20, "", "ReleaseDate desc").Tables[0];
        string Str_ing = "<table width='680' border=0 cellspacing='0' cellpadding='0' style='line-height: 30px;'>";
        if (dt1 != null)
        {
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    Str_ing += "<tr><td class='divfontsystem divList' width='600'>&nbsp;&nbsp;&nbsp;&nbsp;<img src='images/5.jpg'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  href='#' title='" + dt1.Rows[i]["StrTitle"].ToString() + "'>" + reftitlepic(dt1.Rows[i]["StrTitle"].ToString(), 60) + "</a></td><td class='divList' width='80' style='color:#848484'>[" + DateTime.Parse(dt1.Rows[i]["ReleaseDate"].ToString()).ToString("yyyy-MM-dd") + "]</td></tr>";
                }
            }
            else
            {
                Str_ing += "<tr><td></td></tr>";
            }
        }
        else
        {
            Str_ing += "<tr><td></td></tr>";
        }
        return Str_ing + "</table>";
    }
    public string BindUser()
    {
        DataTable dt1 = dalu.GetList(8, "AvatarImg !=''", "RegisDate desc").Tables[0];
        string Str_ing = "<table width='230' border=0 cellspacing='0' cellpadding='0' style='line-height: 80px;'>";
        if (dt1 != null)
        {
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    Str_ing += "<tr><td class='divfontsystem divList' width='150' align='center'><a  href='users/mysite.aspx?uid=" + dt1.Rows[i]["Id"].ToString() + "' target='_blank' title='去看看TA吧'><img src='UpFile/Photos/" + dt1.Rows[i]["AvatarImg"].ToString() + "' style='width: 70px; height: 70px;'></a></td><td class='divList' width='80' style='color:#848484'>" + dt1.Rows[i]["Nickname"].ToString() + "</td></tr>";
                }
            }
            else
            {
                Str_ing += "<tr><td></td></tr>";
            }
        }
        else
        {
            Str_ing += "<tr><td></td></tr>";
        }
        return Str_ing + "</table>";
    }
}
