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

public partial class GongGao_GongGaoView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();

            SDLX.BLL.ERPGongGao MyModel = new SDLX.BLL.ERPGongGao();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.TitleStr;
            this.Label2.Text = SDLX.Common.PublicMethod.GetWenJian(MyModel.FuJian, "../UploadFile/");
            this.Label4.Text = MyModel.ContentStr;
            this.Label5.Text = MyModel.TimeStr;
            this.Label3.Text = MyModel.UserName;
        }
    }
}
