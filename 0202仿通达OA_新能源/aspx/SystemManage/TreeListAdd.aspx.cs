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
 public partial class TreeListAdd: System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			//设置上传的附件为空
			 FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
             this.Label1.Text = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ValueStr from ERPTreeList order by ID desc");

             foreach (ListItem i in SelClass.Items)
             {
                 i.Value = i.Text;
             }
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
        if (FTD.Unit.PublicMethod.IFExists("ValueStr", "ERPTreeList", 0, this.txtValueStr.Text) == true)
        {
            FTD.BLL.ERPTreeList Model = new FTD.BLL.ERPTreeList();

            Model.TextStr = this.txtTextStr.Text.ToString();
            Model.ImageUrlStr = this.txtImageUrlStr.Text.ToString();
            Model.ValueStr = this.txtValueStr.Text.ToString();
            Model.NavigateUrlStr = this.txtNavigateUrlStr.Text.ToString();
            Model.Target = this.txtTarget.Text.ToString();
            Model.ParentID = int.Parse(this.txtParentID.Text);
            Model.QuanXianList = this.txtQuanXianList.Text.ToString();
            Model.PaiXuStr = int.Parse(this.txtPaiXuStr.Text);
            Model.ParentClass = this.SelClass.SelectedItem.Value;
            Model.Add();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加菜单管理信息(" + this.txtTextStr.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "菜单管理信息添加成功！", "TreeList.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "当前指定的后台数值已经存在，为了保持唯一性，请重新指定！");
        }
	}
}
}