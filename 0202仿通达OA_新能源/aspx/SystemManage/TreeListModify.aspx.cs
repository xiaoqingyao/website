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

namespace OA.aspx.SystemManage{ 
 public partial class TreeListModify: System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPTreeList Model = new FTD.BLL.ERPTreeList();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTextStr.Text=Model.TextStr.ToString();
			this.txtImageUrlStr.Text=Model.ImageUrlStr.ToString();
			this.txtValueStr.Text=Model.ValueStr.ToString();
			this.txtNavigateUrlStr.Text=Model.NavigateUrlStr.ToString();
			this.txtTarget.Text=Model.Target.ToString();
			this.txtParentID.Text=Model.ParentID.ToString();
			this.txtQuanXianList.Text=Model.QuanXianList.ToString();
			this.txtPaiXuStr.Text=Model.PaiXuStr.ToString();

            foreach (ListItem i in SelClass.Items) 
            {
                i.Value = i.Text;
                if (i.Text == Model.ParentClass) 
                {
                    i.Selected = true;
                }
            }
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
    {
        if (FTD.Unit.PublicMethod.IFExists("ValueStr", "ERPTreeList", int.Parse(Request.QueryString["ID"].ToString()), this.txtValueStr.Text) == true)
        {
            FTD.BLL.ERPTreeList Model = new FTD.BLL.ERPTreeList();

            Model.ID = int.Parse(Request.QueryString["ID"].ToString());
            Model.TextStr = this.txtTextStr.Text.ToString();
            Model.ImageUrlStr = this.txtImageUrlStr.Text.ToString();
            Model.ValueStr = this.txtValueStr.Text.ToString();
            Model.NavigateUrlStr = this.txtNavigateUrlStr.Text.ToString();
            Model.Target = this.txtTarget.Text.ToString();
            Model.ParentID = int.Parse(this.txtParentID.Text);
            Model.QuanXianList = this.txtQuanXianList.Text.ToString();
            Model.PaiXuStr = int.Parse(this.txtPaiXuStr.Text);
            Model.ParentClass = this.SelClass.SelectedItem.Text;
            Model.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改菜单管理信息(" + this.txtTextStr.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "菜单管理信息修改成功！", "TreeList.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "当前指定的后台数值已经存在，为了保持唯一性，请重新指定！");
        }
	}
}
}