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

public partial class SystemManage_TreeListAdd : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//�����ϴ��ĸ���Ϊ��
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
             this.Label1.Text = ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ValueStr from ERPTreeList order by ID desc");
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
        if (ZWL.Common.PublicMethod.IFExists("ValueStr", "ERPTreeList", 0, this.txtValueStr.Text) == true)
        {
            ZWL.BLL.ERPTreeList Model = new ZWL.BLL.ERPTreeList();

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

            //дϵͳ��־
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "�û���Ӳ˵�������Ϣ(" + this.txtTextStr.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "�˵�������Ϣ��ӳɹ���", "TreeList.aspx");
        }
        else
        {
            ZWL.Common.MessageBox.Show(this, "��ǰָ���ĺ�̨��ֵ�Ѿ����ڣ�Ϊ�˱���Ψһ�ԣ�������ָ����");
        }
	}
}
