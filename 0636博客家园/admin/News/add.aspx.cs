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

public partial class admin_News_add : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_News dal = new DxxBlog.BLL.B_News();
    DxxBlog.Model.B_News model = new DxxBlog.Model.B_News();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TreeBind();
        }
    }
    private void TreeBind()
    {
        DataTable dt = dalt.GetList("StrType=3").Tables[0];

        this.ddlClassId.Items.Clear();
        this.ddlClassId.Items.Insert(0,new ListItem("请选择所属类别...", "-1"));
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
        if (String.IsNullOrEmpty(this.txtTitle.Text.Trim()))
        {
            Response.Write("<script>alert('标题不能空');</script>");
            return;
        }
        model.StrTitle = this.txtTitle.Text;
        model.StrAuthor = this.txtAuthor.Text;
        if (this.ddlClassId.SelectedValue.ToString()=="-1")
        {
            Response.Write("<script>alert('请选择所属栏目');</script>");
            return;
        }
        model.StrType = this.ddlClassId.SelectedValue.ToString();
        model.StrContent = FCKeditor.Value;
        model.ReleaseDate = System.DateTime.Now.ToString();
        int i = dal.Add(model);
        if (i>0)
        {
            Response.Write("<script>alert('发布成功');window.location.href='list.aspx'</script>");
        }
    }
}
