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

public partial class users_commentsdetails : System.Web.UI.Page
{
    string reid = null;
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dal = new DxxBlog.BLL.B_Article();
    DxxBlog.Model.B_Article model = new DxxBlog.Model.B_Article();
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();

    DxxBlog.BLL.B_Comments dalc = new DxxBlog.BLL.B_Comments();
    DxxBlog.Model.B_Comments modelc = new DxxBlog.Model.B_Comments();

    DxxBlog.BLL.B_CommReply dalcr = new DxxBlog.BLL.B_CommReply();
    DxxBlog.Model.B_CommReply modelcr = new DxxBlog.Model.B_CommReply();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string abc = null;
            try
            {
                abc = Session["userid"].ToString();
            }
            catch (Exception exc) { }
            if (String.IsNullOrEmpty(abc))
            {
                Response.Redirect("<script>alert('session失效，请重新登录');window.parent.location.href='../index.aspx';</script>");
                return;
            }

            try
            {
                reid = Request.QueryString["id"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("comments.aspx");
            }
            if (!String.IsNullOrEmpty(reid))
            {
                DataTable dt = dal.GetList("Id=" + reid).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    lblTitle.Text = dt.Rows[0]["StrTitle"].ToString();
                    lblAuthor.Text = dalu.GetList("Id=" + dt.Rows[0]["StrAuthor"].ToString()).Tables[0].Rows[0]["UserName"].ToString();
                    lblDate.Text = Convert.ToDateTime(dt.Rows[0]["ReleaseDate"].ToString()).ToShortDateString();
                    lblContent.Text = dt.Rows[0]["StrContent"].ToString();
                    DataTable dt1 = dalt.GetList("StrType=1 and Id=" + dt.Rows[0]["StrType"].ToString()).Tables[0];
                    lblType.Text = dt1.Rows[0]["StrName"].ToString();
                }


                DataTable dtrp = dalc.GetList("ParentId=" + reid).Tables[0];
                repInfo.DataSource = dtrp;
                repInfo.DataBind();
            }
        }
    }

    public string GetUserInfo(string fields, string id)
    {
        string str=null;
        DataTable dt = dalu.GetList("Id=" + id).Tables[0];
        if (dt.Rows.Count>0)
        {
            str = dt.Rows[0][fields].ToString();
        }
        return str;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(hidrepid.Value))
        {
            Response.Write("<script>alert('你还没有选择回复对象哟.');</script>");
            return;
        }
        modelcr.ParentId = hidrepid.Value;
        modelcr.ReplyDate = System.DateTime.Now.ToShortDateString();
        modelcr.ReplyUser = Session["userid"].ToString();
        modelcr.StrContent = fckEditor.Value;
        int i = dalcr.Add(modelcr);
        if (i>0)
        {            
            Response.Write("<script>alert('回复成功');</script>");
            this.fckEditor.Value = "";
            this.hidrepid.Value = "";
        }
    }
    protected void rptMenuList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string opid = e.CommandArgument.ToString();
        switch (e.CommandName.ToLower())
        {
            case "BtnEdit":
                this.hidrepid.Value = opid;
                break;
            case "BtnDel":
                dalcr.Delete("ParentId=" + opid);
                dalc.Delete(int.Parse(opid));
                Response.Write("<script>alert('删除成功');</script>");
                break;
        }

    }
}
