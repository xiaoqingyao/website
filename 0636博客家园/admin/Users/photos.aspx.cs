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

public partial class admin_Users_photos : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Img dal = new DxxBlog.BLL.B_Img();
    DxxBlog.Model.B_Img model = new DxxBlog.Model.B_Img();
    const string vsKey = "searchscbr";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindType();
            LoadData(string.Empty);
        }
    }
    public string reftitlepic(object o, int num)
    {
        if (o.ToString().Length >= num)
            return o.ToString().Substring(0, num) + "...";
        else
            return o.ToString();
    }
    private void LoadData(string where)
    {
        DataTable dt = null;
        StringBuilder sb = new StringBuilder();
        sb.Append("StrUser=" + Request.QueryString["uid"].ToString());
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
    private void BindType()
    {
        DataTable dt = dalt.GetList("StrType=2").Tables[0];
        ddlClassId.DataTextField = "StrName";
        ddlClassId.DataValueField = "Id";
        ddlClassId.DataSource = dt;
        ddlClassId.DataBind();

        ddlClassId.Items.Insert(0, new ListItem("--分类查看--", "-1"));
        ddlClassId.Items[0].Selected = true;
    }
    protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string opid = e.CommandArgument.ToString();
        switch (e.CommandName.ToLower())
        {
            case "btndel":
                dal.Delete(int.Parse(opid));
                Response.Write("<script>alert('删除成功');window.location.href='photos.aspx'</script>");
                break;
        }
    }
    protected void ddlClassId_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sel = this.ddlClassId.SelectedValue.ToString();
        if (sel == "-1")
        {
            ViewState[vsKey] = "";
        }
        else
        {
            ViewState[vsKey] = " StrType=" + sel + " ";
        }

        LoadData(ViewState[vsKey].ToString());
        myPager.CurrentPageIndex = 1;
        myPager.CssClass = "pages";
        myPager.CurrentPageButtonClass = "cpb";
    }
}
