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

public partial class SysManage_suitypeManage : System.Web.UI.Page
{
    //列表SQL
    string sqltxt = string.Empty;
    protected string parentid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        parentid = Request.QueryString["parentid"];
        sqltxt = "select * from suitype where parentid={0} order by suitypeId desc";
        if (!IsPostBack)
        {
            Get_Data();
        }
    }

    /// <summary>
    /// 绑定数据
    /// </summary>
    void Get_Data()
    {
        this.rptList.DataSource = DB.getDataTable(string.Format(sqltxt, parentid));
        this.rptList.DataBind();
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
            if (DB.ExecuteSql("delete from suitype where suitypeId=" + e.CommandArgument.ToString()) >= 0)
            {
                Common.ShowMessage(Page, "删除成功！", "", Request.Url.AbsoluteUri);
            }
            else
            {
                Common.ShowMessage(Page, "删除失败！", "", Request.Url.AbsoluteUri);
            }
        }
    }

    /// <summary>
    /// 搜索事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        sqltxt = "select * from suitype where (suitypename like '%" + txtKey.Text.Trim() + "%') and parentid={0} order by suitypeId desc";
        Get_Data();
    }

    /// <summary>
    /// 全显事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtKey.Text = "";
        sqltxt = "select * from suitype where parentid={0} order by suitypeId desc";
        Get_Data();
    }
}
