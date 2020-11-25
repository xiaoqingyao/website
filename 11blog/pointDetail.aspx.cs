using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class pointDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uid = Request["uid"];
        this.GridView1.DataSource = new Class1().hsggetdata("select bm.listid,bm.huodongname,bmdate,(select jifen from huodong where listid=bm.huodongid) as jifen from dbo.huodong_baoming bm,dbo.huiyuan hy where bm.uid=hy.id and uid='" + uid + "'");
        this.GridView1.DataBind();
    }
}
