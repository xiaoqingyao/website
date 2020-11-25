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

public partial class admin_Part_edit : System.Web.UI.Page
{
    string reid = null;
    DxxBlog.BLL.B_Part dal = new DxxBlog.BLL.B_Part();
    DxxBlog.Model.B_Part model = new DxxBlog.Model.B_Part();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                reid = Request.QueryString["Id"].ToString();
            }
            catch (Exception ex)
            {
                Response.Redirect("part.aspx");
            }
            if (!String.IsNullOrEmpty(reid))
            {
                DataTable dt = dal.GetList("Id=" + reid).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    this.txtTitle.Text = dt.Rows[0]["StrName"].ToString();
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(Request.QueryString["Id"].ToString()))
        {
            Response.Write("<script>alert('获取数据失败，请稍候重试.');window.location.href='part.aspx'</script>");
            return;
        }
        else
        {
            model.Id = int.Parse(Request.QueryString["Id"].ToString());
        }
        if (String.IsNullOrEmpty(this.txtTitle.Text.Trim()))
        {
            Response.Write("<script>alert('栏目名称不能空');</script>");
            return;
        }
        string ty = ddlClassId.SelectedValue.ToString();
        if (ty == "-1")
        {
            Response.Write("<script>alert('请选择所属类型');</script>");
            return;
        }
        model.StrType = ty;
        model.StrName = this.txtTitle.Text.Trim();
        try
        {
            dal.Update(model);
            Response.Write("<script>alert('修改成功');window.location.href='part.aspx'</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('修改失败');</script>");
        }
    }
}
