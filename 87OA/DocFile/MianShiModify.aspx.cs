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

public partial class DocFile_MianShiModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPMianShi Model = new ZWL.BLL.ERPMianShi();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtMSName.Text=Model.MSName.ToString();
			this.txtMSDate.Text=Model.MSDate.ToString();
			this.txtMSSex.Text=Model.MSSex.ToString();
			this.txtMSAge.Text=Model.MSAge.ToString();
			this.txtXueLi.Text=Model.XueLi.ToString();
			this.txtZhuanYe.Text=Model.ZhuanYe.ToString();
			this.txtMSZhiWei.Text=Model.MSZhiWei.ToString();
			this.txtMSJieGuo.Text=Model.MSJieGuo.ToString();
			this.txtBackInfo.Text=Model.BackInfo.ToString();
		ZWL.Common.PublicMethod.SetSessionValue("WenJianList", Model.FuJianStr);
		ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPMianShi Model = new ZWL.BLL.ERPMianShi();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.MSName=this.txtMSName.Text.ToString();
		Model.MSDate=this.txtMSDate.Text.ToString();
		Model.MSSex=this.txtMSSex.Text.ToString();
		Model.MSAge=this.txtMSAge.Text.ToString();
		Model.XueLi=this.txtXueLi.Text.ToString();
		Model.ZhuanYe=this.txtZhuanYe.Text.ToString();
		Model.MSZhiWei=this.txtMSZhiWei.Text.ToString();
		Model.MSJieGuo=this.txtMSJieGuo.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.FuJianStr=ZWL.Common.PublicMethod.GetSessionValue("WenJianList");
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改面试数据信息(" + this.txtMSName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		ZWL.Common.MessageBox.ShowAndRedirect(this, "面试数据信息修改成功！", "MianShi.aspx");
	}
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        string FileNameStr = ZWL.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (ZWL.Common.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", ZWL.Common.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    ZWL.Common.PublicMethod.SetSessionValue("WenJianList", ZWL.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Value, "").Replace("||", "|"));
                }
            }
            ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }  
}
