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

public partial class WorkFlow_FormView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();            
            SDLX.BLL.ERPForm MyModel = new SDLX.BLL.ERPForm();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.FormName;
            this.Label2.Text = MyModel.FormType;
            this.Label3.Text = MyModel.ShiYongUserList;
            this.Label4.Text = MyModel.TiaoJianList;
            this.Label5.Text = MyModel.UserName;
            this.Label6.Text = MyModel.TimeStr.ToString();
            this.Label7.Text = MyModel.ContentStr;
        }
    }
}
