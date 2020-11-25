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

public partial class UserPicManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                string memberid = Server.UrlDecode(Request.Cookies["memberinfo"]["MemberId"]);
                DataTable dt = DB.getDataTable("select * from pic where memberid='" + memberid + "' order by picid desc");
                rptList.DataSource = dt;
                rptList.DataBind();


            }
            else
            {
                JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
                return;
            }
        }
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
            if (DB.ExecuteSql("delete from [Pic] where PicId=" + e.CommandArgument.ToString()) >= 0)
            {
                Common.ShowMessage(Page, "删除成功！", "", Request.Url.AbsoluteUri);
            }
            else
            {
                Common.ShowMessage(Page, "删除失败！", "", Request.Url.AbsoluteUri);
            }
        }
    }


}
