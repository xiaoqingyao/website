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

public partial class Financial_ReimburseModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPReimburse Model = new ZWL.BLL.ERPReimburse();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtHeTongName.Text = Model.HeTongName.ToString();
            this.txtUserName.Text = Model.UserName.ToString();
            this.txtQianYueKeHu.Text = Model.QianYueKeHu.ToString();
            this.txtReimburseContent.Text = Model.ReimburseContent.ToString();
            this.txtApplyTime.Text = Model.ApplyTime.ToString();
            this.txtMemo.Text = Model.Memo.ToString();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPReimburse Model = new ZWL.BLL.ERPReimburse();
        //Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.UserName = this.txtUserName.Text.ToString();
        Model.HeTongName = this.txtHeTongName.Text.ToString();
        Model.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
        Model.ReimburseContent = this.txtReimburseContent.Text.ToString();
        Model.ApplyTime = this.txtApplyTime.Text.ToString();
        Model.Memo = this.txtMemo.Text.ToString();

        Model.Update();

        //дϵͳ��־
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "�û��޸ı�������Ϣ(" + this.txtReimburseContent.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "��������Ϣ�޸ĳɹ���", "Reimburse.aspx");
    }
    
}
