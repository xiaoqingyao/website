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

public partial class admin_Part_part : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dal = new DxxBlog.BLL.B_Part();
    DxxBlog.Model.B_Part model = new DxxBlog.Model.B_Part();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData("");
        }
    }
    private void LoadData(string where)
    {        
        DataTable dt = null;
        dt = dal.GetList(String.IsNullOrEmpty(where) ? "" : where).Tables[0];

        rptClassList.DataSource = dt;
        rptClassList.DataBind();

    }
    protected void myPager_PageChanged(object sender, EventArgs e)
    {
        LoadData("");
    }
    protected void lbtnDel_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < rptClassList.Items.Count; i++)
        {
            int id = Convert.ToInt32(((Label)rptClassList.Items[i].FindControl("lb_id")).Text);
            CheckBox cb = (CheckBox)rptClassList.Items[i].FindControl("cb_id");
            if (cb.Checked)
            {
                dal.Delete(id);
            }
        }
        Response.Write("<script>alert('删除成功');window.location.href='part.aspx'</script>");
    }

    public string GetType(string id)
    {
        string str = null;
        switch (id)
        {
            case "1":
                str = "文章类"; break;
            case "2":
                str = "相册类"; break;
            case "3":
                str = "新闻类"; break;
        }
        return str;
    }
    protected void ddlClassId_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.ddlClassId.SelectedValue.ToString() == "-1")
        {
            LoadData("");
        }
        else
        {
            LoadData("StrType=" + this.ddlClassId.SelectedValue.ToString());
        }
    }
}
