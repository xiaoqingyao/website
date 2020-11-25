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

public partial class DocFile_TiKuView : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPTiKu Model = new ZWL.BLL.ERPTiKu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.lblTitleStr.Text=Model.TitleStr.ToString();
			this.lblItemsA.Text=Model.ItemsA.ToString();
			this.lblItemsB.Text=Model.ItemsB.ToString();
			this.lblItemsC.Text=Model.ItemsC.ToString();
			this.lblItemsD.Text=Model.ItemsD.ToString();
			this.lblItemsE.Text=Model.ItemsE.ToString();
			this.lblItemsF.Text=Model.ItemsF.ToString();
			this.lblItemsG.Text=Model.ItemsG.ToString();
			this.lblItemsH.Text=Model.ItemsH.ToString();
			this.lblAnswerStr.Text=Model.AnswerStr.ToString();

            //�ж���Ŀ���ͣ�Ȼ������Panel����ʾ���
            if (Request.QueryString["FenLeiStr"].ToString() == "�ж���")
            {
                this.Panel2.Visible = false;
                this.Panel1.Visible = true;
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "�����")
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = false;
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "�����")
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = false;
            }
			
			//дϵͳ��־
			ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
			MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
			MyRiZhi.DoSomething = "�û��鿴��������Ϣ(" + this.lblTitleStr.Text + ")";
			MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
			MyRiZhi.Add();
			
		}
	}
}
