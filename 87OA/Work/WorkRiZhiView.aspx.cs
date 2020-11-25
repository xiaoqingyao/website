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

public partial class Work_WorkRiZhiView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            //绑定页面数据
            ZWL.BLL.ERPWorkRiZhi Model = new ZWL.BLL.ERPWorkRiZhi();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = Model.TitleStr;
            this.Label3.Text = Model.ContentStr;
            this.Label2.Text = Model.TypeStr;
        }
    }
}
