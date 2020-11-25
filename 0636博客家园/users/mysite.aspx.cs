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

public partial class users_mysite : System.Web.UI.Page
{
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dala = new DxxBlog.BLL.B_Article();
    public string myphoto = null, mynickname = null, mysex = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string uid = Request.QueryString["uid"].ToString();
            if (!String.IsNullOrEmpty(uid))
            {
                GetArticle();
            }
        }
        catch (Exception)
        {

        }
    }

    

    public void GetArticle()
    {
        StringBuilder sb = new StringBuilder();
        DataTable dt = dala.GetList(" StrAuthorType=1 and StrAuthor=" + Request.QueryString["uid"].ToString()).Tables[0];
        dt.DefaultView.Sort = "ReleaseDate desc";
        repInfo.DataSource = dt.DefaultView;
        repInfo.DataBind();
    }
    public string GetTyName(string id)
    {
        string str = null;
        DataTable dt = dalt.GetList("Id=" + id).Tables[0];
        if (dt.Rows.Count > 0)
        {
            str = dt.Rows[0]["StrName"].ToString();
        }
        return str;
    }
}
