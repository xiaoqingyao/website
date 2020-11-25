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

public partial class users_myarinfos : System.Web.UI.Page
{
    DxxBlog.BLL.B_Article dala = new DxxBlog.BLL.B_Article();
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Comments dalc = new DxxBlog.BLL.B_Comments();
    DxxBlog.Model.B_Comments modelc = new DxxBlog.Model.B_Comments();
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    public string title = null, date = null, type = null,cnt=null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();
            DataTable dt = dala.GetList(" Id="+id).Tables[0];
            if (dt.Rows.Count>0)
            {
                title = dt.Rows[0]["StrTitle"].ToString();
                date = dt.Rows[0]["ReleaseDate"].ToString();
                type = GetTyName(dt.Rows[0]["StrType"].ToString());
                cnt = dt.Rows[0]["StrContent"].ToString();

                DataTable dtc = dalc.GetList(" ParentId=" + dt.Rows[0]["Id"].ToString()).Tables[0];
                repInfo.DataSource = dtc;
                repInfo.DataBind();

            }
        }
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
    public string GetUserName(string id)
    {
        string str = null;
        DataTable dt = dalu.GetList("Id=" + id).Tables[0];
        if (dt.Rows.Count > 0)
        {
            str = dt.Rows[0]["UserName"].ToString();
        }
        return str;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string fangwenid = null;
        try
        {
            fangwenid = Session["userid"].ToString();

            if (!String.IsNullOrEmpty(fangwenid))
            {
                modelc.ParentId = Request.QueryString["id"].ToString();
                modelc.CommentType = "1";
                modelc.StrContent = TextBox1.Text;
                modelc.CommentUser = fangwenid;
                modelc.CommentDate = System.DateTime.Now.ToString();
                dalc.Add(modelc);
                Response.Write("<script>window.location.href='myarinfos.aspx?id=" + Request.QueryString["id"].ToString() + "';</script>");
                
            }
        }
        catch (Exception)
        {
            Response.Write("<script>alert('请先登录'); window.location.href='../index.aspx'</script>");
            return;
        }
    }
}
