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

public partial class BaseInfo_noticeList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        if (!IsPostBack)
        {
            BaseClass bc = new BaseClass();
            DataList1.DataSource = bc.GetDataSet("select * from notice","notice");
            DataList1.DataKeyField = "noticeID";
            DataList1.DataBind();
        }
    }
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int str = (int)DataList1.DataKeys[e.Item.ItemIndex];
        BaseClass bc = new BaseClass();
        bool bl;
        bl=bc.ExecSQL("delete from notice where noticeID='" + str + "'");
        DataList1.DataSource = bc.GetDataSet("select * from notice", "notice");
        DataList1.DataKeyField = "noticeID";
        DataList1.DataBind();
    }
}
