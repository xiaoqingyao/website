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

public partial class WorkFlow_WorkView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            SDLX.BLL.ERPWorkToDo MyModel = new SDLX.BLL.ERPWorkToDo();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.WorkName;
            this.Label2.Text = MyModel.JieDianName;
            this.Label3.Text = MyModel.FormContent;
            this.Label4.Text = SDLX.Common.PublicMethod.GetWenJian(MyModel.FuJianList, "../UploadFile/");
            this.Label5.Text = MyModel.ShenPiYiJian;
            this.HyperLink1.NavigateUrl = "JustShowWorkFlow.aspx?ID=" + MyModel.WorkFlowID.ToString();
        }
    }
}
