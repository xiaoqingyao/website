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
 public partial class MianShiAdd: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			//设置上传的附件为空
			 FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPMianShi Model = new FTD.BLL.ERPMianShi();
		
		Model.MSName=this.txtMSName.Text.ToString();
		Model.MSDate=this.txtMSDate.Text.ToString();
		Model.MSSex=this.txtMSSex.Text.ToString();
		Model.MSAge=this.txtMSAge.Text.ToString();
		Model.XueLi=this.txtXueLi.Text.ToString();
		Model.ZhuanYe=this.txtZhuanYe.Text.ToString();
		Model.MSZhiWei=this.txtMSZhiWei.Text.ToString();
		Model.MSJieGuo=this.txtMSJieGuo.Text.ToString();
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.FuJianStr=FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
		Model.UserName=FTD.Unit.PublicMethod.GetSessionValue("UserName");
		Model.TimeStr=DateTime.Now;
		
		Model.Add();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户添加面试数据信息(" + this.txtMSName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "面试数据信息添加成功！", "MianShi.aspx");
	}
    protected void iButton2_Click(object sender, EventArgs e)
    {
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Trim() == "")
        {
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FileNameStr);
        }
        else
        {
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "|" + FileNameStr);
        }
        FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Value, "").Replace("||", "|"));
                }
            }
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }  
}
}