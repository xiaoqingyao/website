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

public partial class Order : System.Web.UI.Page
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
                Model.order mooj = new Model.order();
                mooj.userid = Convert.ToInt32(Session["_userid"]);
                BLL.oredr boo = new BLL.oredr();
                int i = boo.count(mooj);
                AspNetPager1.RecordCount = i;
                AspNetPager1.PageSize = 6;
                pp();

            }
        }
    }
    public void pp()
    {
        Model.order moo = new Model.order();
        moo.userid = Convert.ToInt32(Session["_userid"]);
        BLL.oredr bmy = new BLL.oredr();
        DataSet ds = bmy.dspor(AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1), AspNetPager1.PageSize, moo);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();

    }
  
 
    protected void ImageButton1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Model.order moor = new Model.order();
            moor.id = id;
            moor.userid = Convert.ToInt32(Session["_userid"]);
            BLL.oredr bllu = new BLL.oredr();
            int i = bllu.deor(moor);
            if (i > 0)
            {
                Common.MessageAlert.Alert(Page, "删除成功！！");
                pp();
            }
            else
            {
                Common.MessageAlert.Alert(Page, "删除失败！！");
            }
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
   

    protected void AspNetPager1_PageChanging(object src, Wuqi.Webdiyer.PageChangingEventArgs e)
    {
        AspNetPager1.CurrentPageIndex = e.NewPageIndex;
        
            pp();
       
    }
  
}
