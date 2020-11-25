using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class farmlandQuery : BasePage
{

    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userCode"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            //承租人
            string sqlchengzu = "select * from tenantry ";
            DataTable dtchengzu = new sqlHelper().GetDataTable(sqlchengzu, null);
            this.tenantry.DataSource = dtchengzu;
            this.tenantry.DataTextField = "name";
            this.tenantry.DataValueField = "code";
            this.tenantry.DataBind();
            this.tenantry.Items.Insert(0, new ListItem() { Text = "全部", Value = "" });

            //绑定页面
            bindGuidView(1);
        }
    }

    private void bindGuidView(int pageindex)
    {
        int totalCount = 0;
        DataTable dt = getData(pageindex, PageSize, out totalCount);
        this.ucPager.RecordCount = totalCount;
        this.ucPager.PageSize = PageSize;
        this.GridView1.DataSource = dt;
        this.GridView1.DataBind();
    }

    protected void ucPager_PageChanged(object sender, EventArgs e)
    {
        bindGuidView(this.ucPager.CurrentPageIndex);
    }
    private DataTable getData(int pageIndex, int pageSize, out int TotalCount)
    {
        string sql = "select *,Row_Number()over(order by createDate desc,code asc) as crow from farmland where 1=1 ";
        string name = this.txtTitle.Text.Trim();
        if (!string.IsNullOrEmpty(name))
        {
            sql += " and name like '%" + name + "%'";
        }
        string status = this.status.SelectedValue;
        if (!string.IsNullOrEmpty(status))
        {
            sql += " and status='" + status + "'";
        }
        string tenatryCode = this.tenantry.SelectedValue;
        if (!string.IsNullOrEmpty(tenatryCode))
        {
            sql += " and tenantryCode='" + tenatryCode + "'";
        }
        sql += " and farmerCode='" + Session["userCode"] + "'";
        string sqlFrame = "select * from ( {0} ) t where t.crow>{1} and t.crow<={2}";
        string sqlCount = "select count(*) from ( {0} ) t ";
        sqlFrame = string.Format(sqlFrame, sql, (pageIndex - 1) * PageSize, pageIndex * PageSize);
        DataTable dt = server.GetDataTable(sqlFrame, null);
        object objcount = server.ExecuteScalar(string.Format(sqlCount, sql));
        TotalCount = int.Parse(objcount.ToString());
        return dt;
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        bindGuidView(1);
    }
}