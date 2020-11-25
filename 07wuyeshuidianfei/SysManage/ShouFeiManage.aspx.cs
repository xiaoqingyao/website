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

public partial class SysManage_ShouFeiManage : System.Web.UI.Page
{
    //列表SQL
    string sqltxt = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqltxt = "select * from ShouFei where {0} order by ShouFeiId desc";
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
         sqltxt = string.Format(sqltxt, "1=1"); 
        
        this.rptList.DataSource = DB.getDataTable(sqltxt);
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
            if (DB.ExecuteSql("delete from ShouFei where ShouFeiId=" + e.CommandArgument.ToString()) >= 0)
            {
                Get_Data();
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
        sqltxt = "select * from ShouFei where (" + ddltype.SelectedValue + " like '%" + txtKey.Text.Trim() + "%' or TypeName like '%" + txtKey.Text.Trim() + "%') and {0} order by ShouFeiId desc";
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
        sqltxt = "select * from ShouFei where {0} order by ShouFeiId desc";
        Get_Data();
    }
}
