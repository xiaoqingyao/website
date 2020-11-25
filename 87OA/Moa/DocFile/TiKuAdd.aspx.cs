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

public partial class DocFile_TiKuAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{        
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			//�����ϴ��ĸ���Ϊ��
			 ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");

            //�ж���Ŀ���ͣ�Ȼ������Panel����ʾ���
             if (Request.QueryString["FenLeiStr"].ToString() == "�ж���")
             {
                 this.Panel2.Visible = false;
                 this.Panel1.Visible = true;

                 this.txtItemsA.Text = "��ȷ";
                 this.txtItemsB.Text = "����";
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
                 this.txtAnswerStr.Height = Unit.Parse("60");
                 this.txtAnswerStr.TextMode = TextBoxMode.MultiLine;
             }

		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPTiKu Model = new ZWL.BLL.ERPTiKu();
		
		Model.TitleStr=this.txtTitleStr.Text.ToString();
		Model.ItemsA=this.txtItemsA.Text.ToString();
		Model.ItemsB=this.txtItemsB.Text.ToString();
		Model.ItemsC=this.txtItemsC.Text.ToString();
		Model.ItemsD=this.txtItemsD.Text.ToString();
		Model.ItemsE=this.txtItemsE.Text.ToString();
		Model.ItemsF=this.txtItemsF.Text.ToString();
		Model.ItemsG=this.txtItemsG.Text.ToString();
		Model.ItemsH=this.txtItemsH.Text.ToString();
		Model.AnswerStr=this.txtAnswerStr.Text.ToString();

        Model.TiKuID = int.Parse(Request.QueryString["TiKuID"].ToString());
        Model.FenLeiStr = Request.QueryString["FenLeiStr"].ToString();

		Model.Add();
		
		//дϵͳ��־
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "�û������������Ϣ(" + this.txtTitleStr.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "��������Ϣ��ӳɹ���", "TiKu.aspx?TiKuID="+Request.QueryString["TiKuID"].ToString()+"&FenLeiStr="+Request.QueryString["FenLeiStr"].ToString());
	}
}
