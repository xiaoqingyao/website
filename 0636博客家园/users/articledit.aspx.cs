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

public partial class users_articledit : System.Web.UI.Page
{
    string reid = null;
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dal = new DxxBlog.BLL.B_Article();
    DxxBlog.Model.B_Article model = new DxxBlog.Model.B_Article();
    DxxBlog.BLL.B_Users dalu = new DxxBlog.BLL.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TreeBind();
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
                Response.Redirect("article.aspx");
            }
            if (!String.IsNullOrEmpty(reid))
            {
                DataTable dt = dal.GetList("Id=" + reid).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    this.txtTitle.Text = dt.Rows[0]["StrTitle"].ToString();
                    this.txtAuthor.Text = dalu.GetList("Id=" + dt.Rows[0]["StrAuthor"].ToString()).Tables[0].Rows[0]["UserName"].ToString();
                    this.txtDate.Text = Convert.ToDateTime(dt.Rows[0]["ReleaseDate"].ToString()).ToShortDateString();
                    FCKeditor.Value = dt.Rows[0]["StrContent"].ToString();
                    for (int i = 0; i < ddlClassId.Items.Count; i++)
                    {
                        if (ddlClassId.Items[i].Value.ToString() == dt.Rows[0]["StrType"].ToString())
                        {
                            this.ddlClassId.Items[i].Selected = true;
                        }
                        else
                        {
                            this.ddlClassId.Items[i].Selected = false;
                        }
                    }
                }
            }
        }
    }


    private void TreeBind()
    {
        DataTable dt = dalt.GetList("StrType=1").Tables[0];

        this.ddlClassId.Items.Clear();
        this.ddlClassId.Items.Insert(0, new ListItem("请选择所属类别...", "-1"));
        this.ddlClassId.Items[0].Selected = true;
        foreach (DataRow dr in dt.Rows)
        {
            string Id = dr["Id"].ToString();
            string Title = dr["StrName"].ToString().Trim();

            this.ddlClassId.Items.Add(new ListItem(Title, Id));
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(Request.QueryString["id"].ToString()))
        {
            Response.Write("<script>alert('获取数据失败，请稍候重试.');window.location.href='article.aspx'</script>");
            return;
        }
        else
        {
            model.Id = int.Parse(Request.QueryString["id"].ToString());
        }

        if (String.IsNullOrEmpty(this.txtTitle.Text.Trim()))
        {
            Response.Write("<script>alert('标题不能空');</script>");
            return;
        }
        model.StrTitle = this.txtTitle.Text;
        model.StrAuthor = Session["userid"].ToString();
        if (this.ddlClassId.SelectedValue.ToString() == "-1")
        {
            Response.Write("<script>alert('请选择所属栏目');</script>");
            return;
        }
        model.StrType = this.ddlClassId.SelectedValue.ToString();
        model.StrContent = FCKeditor.Value;
        model.ReleaseDate = System.DateTime.Now.ToString();
        model.StrAuthorType = "1";
        try
        {
            dal.Update(model);
            Response.Write("<script>alert('修改成功');window.location.href='article.aspx'</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('修改失败');</script>");
        }
    }
}
