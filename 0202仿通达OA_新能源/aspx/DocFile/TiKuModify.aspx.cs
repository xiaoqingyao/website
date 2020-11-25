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

namespace OA.aspx.DocFile{ 
 public partial class TiKuModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPTiKu Model = new FTD.BLL.ERPTiKu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTitleStr.Text=Model.TitleStr.ToString();
			this.txtItemsA.Text=Model.ItemsA.ToString();
			this.txtItemsB.Text=Model.ItemsB.ToString();
			this.txtItemsC.Text=Model.ItemsC.ToString();
			this.txtItemsD.Text=Model.ItemsD.ToString();
			this.txtItemsE.Text=Model.ItemsE.ToString();
			this.txtItemsF.Text=Model.ItemsF.ToString();
			this.txtItemsG.Text=Model.ItemsG.ToString();
			this.txtItemsH.Text=Model.ItemsH.ToString();
			this.txtAnswerStr.Text=Model.AnswerStr.ToString();


            //判断题目类型，然后设置Panel的显示与否
            if (Request.QueryString["FenLeiStr"].ToString() == "判断题")
            {
                this.Panel2.Visible = false;
                this.Panel1.Visible = true;
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "填空题")
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = false;
            }
            else if (Request.QueryString["FenLeiStr"].ToString() == "简答题")
            {
                this.Panel1.Visible = false;
                this.Panel2.Visible = false;
                this.txtAnswerStr.Height = Unit.Parse("60");
                this.txtAnswerStr.TextMode = TextBoxMode.MultiLine;
            }
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPTiKu Model = new FTD.BLL.ERPTiKu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
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
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改题库管理信息(" + this.txtTitleStr.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "题库管理信息修改成功！", "TiKu.aspx?TiKuID=" + Request.QueryString["TiKuID"].ToString() + "&FenLeiStr=" + Request.QueryString["FenLeiStr"].ToString());
	}
}
}