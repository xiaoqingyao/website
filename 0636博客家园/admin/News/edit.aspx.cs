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

public partial class admin_News_edit : System.Web.UI.Page
{
    string reid = null;
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_News dal = new DxxBlog.BLL.B_News();
    DxxBlog.Model.B_News model = new DxxBlog.Model.B_News();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TreeBind();
            try
            {
                reid = Request.QueryString["id"].ToString();
            }
            catch (Exception ex) {
                Response.Redirect("list.aspx");
            }
            if (!String.IsNullOrEmpty(reid))
            {
                DataTable dt = dal.GetList("Id=" + reid).Tables[0];
                if (dt.Rows.Count>0)
                {
                    this.txtTitle.Text = dt.Rows[0]["StrTitle"].ToString();
                    this.txtAuthor.Text = dt.Rows[0]["StrAuthor"].ToString();
                    this.txtDate.Text = Convert.ToDateTime(dt.Rows[0]["ReleaseDate"].ToString()).ToShortDateString();
                    FCKeditor.Value = dt.Rows[0]["StrContent"].ToString();
                    for (int i = 0; i < ddlClassId.Items.Count; i++)
                    {
                        if (ddlClassId.Items[i].Value.ToString()==dt.Rows[0]["StrType"].ToString())
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
        DataTable dt = dalt.GetList("StrType=3").Tables[0];

        this.ddlClassId.Items.Clear();
        this.ddlClassId.Items.Insert(0, new ListItem("请选择所属类别...", "-1"));
        
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
            Response.Write("<script>alert('获取数据失败，请稍候重试.');window.location.href='list.aspx'</script>");
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
        model.StrAuthor = this.txtAuthor.Text;
        if (this.ddlClassId.SelectedValue.ToString() == "-1")
        {
            Response.Write("<script>alert('请选择所属栏目');</script>");
            return;
        }
        model.StrType = this.ddlClassId.SelectedValue.ToString();
        model.StrContent = FCKeditor.Value;
        model.ReleaseDate = System.DateTime.Now.ToString();
        try
        {
            dal.Update(model);
            Response.Write("<script>alert('修改成功');window.location.href='list.aspx'</script>");
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('修改失败');</script>");
        }
    }
}
