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

public partial class users_article : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dal = new DxxBlog.BLL.B_Article();
    DxxBlog.Model.B_Article model = new DxxBlog.Model.B_Article();
    const string vsKey = "searchscbr";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindType();
            LoadData(string.Empty);
        }
    }
    private void LoadData(string where)
    {
        DataTable dt = null;
        StringBuilder sb = new StringBuilder();
        sb.Append("StrAuthor=" + Session["userid"].ToString());
        if (!String.IsNullOrEmpty(where))
        {
            sb.Append(" and " + where);
        }
        dt = dal.GetList(sb.ToString()).Tables[0];

        myPager.RecordCount = dt.DefaultView.Count;

        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = dt.DefaultView;
        pds.AllowPaging = true;
        pds.CurrentPageIndex = myPager.CurrentPageIndex - 1;
        pds.PageSize = myPager.PageSize;
        rptList.DataSource = pds;
        rptList.DataBind();

    }
    protected void myPager_PageChanged(object sender, EventArgs e)
    {
        LoadData((string)ViewState[vsKey]);
    }
    protected void lbtnDel_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < rptList.Items.Count; i++)
        {
            int id = Convert.ToInt32(((Label)rptList.Items[i].FindControl("lb_id")).Text);
            CheckBox cb = (CheckBox)rptList.Items[i].FindControl("cb_id");
            if (cb.Checked)
            {
                dal.Delete(id);
            }
        }
        Response.Write("<script>alert('删除成功');window.location.href='article.aspx'</script>");
    }
    public string GetType(string id)
    {
        string str = null;
        DataTable dt = dalt.GetList("StrType=1 and Id=" + id).Tables[0];
        if (dt.Rows.Count > 0)
        {
            str = dt.Rows[0]["StrName"].ToString();
        }
        return str;
    }
    private void BindType()
    {
        DataTable dt = dalt.GetList("StrType=1").Tables[0];
        ddlClassId.DataTextField = "StrName";
        ddlClassId.DataValueField = "Id";
        ddlClassId.DataSource = dt;
        ddlClassId.DataBind();

        ddlClassId.Items.Insert(0, new ListItem("--分类查看--", "-1"));
        ddlClassId.Items[0].Selected = true;
    }
    protected void ddlClassId_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sel = this.ddlClassId.SelectedValue.ToString();
        if (sel=="-1")
        {
            ViewState[vsKey] = "";
        }
        else
        {
            ViewState[vsKey] = " StrType='" + sel + "' ";
        }
                
        LoadData(ViewState[vsKey].ToString());
        myPager.CurrentPageIndex = 1;
        myPager.CssClass = "pages";
        myPager.CurrentPageButtonClass = "cpb";
    }
}
