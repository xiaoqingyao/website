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
using System.Data.SqlClient;

public partial class SysManage_CommentManage : System.Web.UI.Page
{
    //列表SQL
    public string sqltxt = "select * from [Comment] order by CommentId desc";
    //总数SQL
    public string cmdtxt2 = "select count(0) from [Comment]";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sqltxt = "select * from [Comment] order by CommentId desc";
            cmdtxt2 = "select count(0) from [Comment]";
            Get_Pager_Data();
        }
    }

    /// <summary>
    /// 获取记录总数
    /// </summary>
    void Get_Pager_Data()
    {
        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd0 = new SqlCommand(cmdtxt2, cn);
        AspNetPager1.AlwaysShow = true;
        AspNetPager1.PageSize = 18;
        AspNetPager1.RecordCount = (int)cmd0.ExecuteScalar();
        DB.DisposeConnection(cn);
        Get_Data();
    }

    /// <summary>
    /// 绑定数据
    /// </summary>
    void Get_Data()
    {
        SqlConnection cn = DB.OpenConnection();
        SqlCommand cmd = new SqlCommand(sqltxt, cn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "[Comment]");
        DataView dv = ds.Tables["[Comment]"].DefaultView;
        this.rptList.DataSource = dv;
        this.rptList.DataBind();
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="src"></param>
    /// <param name="e"></param>
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        Get_Data();
    }

    /// <summary>
    /// 列表绑定事件
    /// </summary>
    /// <param name="source"></param>
    /// <param name="e"></param>
    protected void rptList_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            if (DB.ExecuteSql("delete from [Comment] where CommentId=" + e.CommandArgument.ToString()) >= 0)
            {
                Get_Pager_Data();
                Common.ShowMessage(Page, "删除成功！", "", Request.Url.AbsoluteUri);
            }
            else
            {
                Common.ShowMessage(Page, "删除失败！", "", Request.Url.AbsoluteUri);
            }
        }
    }

    /// <summary>
    /// 全选事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        //if (CheckBox1.Checked)
        //{
        //    for (int i = 0; i < rptList.Items.Count; i++)
        //    {
        //        CheckBox chk = (CheckBox)rptList.Items[i].FindControl("CheckBox2");
        //        if (chk != null)
        //        {
        //            chk.Checked = true;
        //        }
        //    }
        //}
        //else
        //{
        //    for (int i = 0; i < rptList.Items.Count; i++)
        //    {
        //        CheckBox chk = (CheckBox)rptList.Items[i].FindControl("CheckBox2");
        //        if (chk != null)
        //        {
        //            chk.Checked = false;
        //        }
        //    }
        //}
    }

    /// <summary>
    /// 批量删除事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnBatchDel_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < rptList.Items.Count; i++)
        {
            Label lblid = (Label)rptList.Items[i].FindControl("lblId");
            CheckBox chk = (CheckBox)rptList.Items[i].FindControl("CheckBox2");
            if (chk != null)
            {
                if (chk.Checked)
                {
                    DB.ExecuteSql("delete from [Comment] where CommentId=" + lblid.Text.Trim());

                }
            }
        }
        Get_Pager_Data();
    }

    /// <summary>
    /// 搜索事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        sqltxt = "select * from [Comment] where (CommentContent like '%" + txtKey.Text.Trim() + "%') order by CommentId desc";
        cmdtxt2 = "select count(0) from [Comment] where (CommentContent like '%" + txtKey.Text.Trim() + "%')";
        Get_Pager_Data();
    }

    /// <summary>
    /// 全显事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtKey.Text = "";
        sqltxt = "select * from [Comment] order by CommentId desc";
        cmdtxt2 = "select count(0) from [Comment]";
        Get_Pager_Data();
    }

}
