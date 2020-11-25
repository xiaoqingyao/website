using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;
using BLL;
using Model;
public partial class message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["_userid"] == null)
        {
            Common.MessageAlert.AlertLocation(Page, "alert('对不起，您没有登陆！');location.href='Login.aspx'");
        }
        else
        {
            if (!IsPostBack)
            {
                BLLmessage bllmessage = new BLLmessage();
                int result = bllmessage.message_state();
                AspNetPager1.RecordCount = result;
                AspNetPager1.PageSize = 5;
                binddata();
            }
        }
    }



    public void binddata()
    {
        BLLmessage bllmessage = new BLLmessage();
        DataSet ds = bllmessage.select(AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, "message");
        DataList1.DataSource = ds;
        DataList1.DataBind();

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
    
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txt_title.Text = "";
        txt_content.Text = "";
    }
    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        binddata();
    }
}
