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

public partial class admin_Article_list : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Article dal = new DxxBlog.BLL.B_Article();
    DxxBlog.Model.B_Article model = new DxxBlog.Model.B_Article();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    private void LoadData()
    {
        DataTable dt = null;
        dt = dal.GetList("").Tables[0];

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
        LoadData();
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
        Response.Write("<script>alert('删除成功');window.location.href='list.aspx'</script>");
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
}
