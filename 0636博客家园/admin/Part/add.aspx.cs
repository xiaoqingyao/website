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

public partial class admin_Part_add : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dal = new DxxBlog.BLL.B_Part();
    DxxBlog.Model.B_Part model = new DxxBlog.Model.B_Part();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(this.txtTitle.Text.Trim()))
        {
            Response.Write("<script>alert('栏目名称不能空');</script>");
            return;
        }
        string ty = ddlClassId.SelectedValue.ToString();
        if (ty=="-1")
        {
            Response.Write("<script>alert('请选择所属类型');</script>");
            return;
        }
        model.StrType = ty;
        model.StrName = this.txtTitle.Text.Trim(); ;
        int i = dal.Add(model);
        if (i > 0)
        {
            Response.Write("<script>alert('发布成功');window.location.href='part.aspx'</script>");
        }
    }
}
