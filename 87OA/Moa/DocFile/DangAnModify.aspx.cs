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

public partial class DocFile_DangAnModify : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
			ZWL.BLL.ERPDangAn Model = new ZWL.BLL.ERPDangAn();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtFileName.Text=Model.FileName.ToString();
			this.txtJuanKuName.Text=Model.JuanKuName.ToString();
			this.txtFileSerils.Text=Model.FileSerils.ToString();
			this.txtFileTitle.Text=Model.FileTitle.ToString();
			this.txtFaWenDanWei.Text=Model.FaWenDanWei.ToString();
			this.txtFaWenDate.Text=Model.FaWenDate.ToString();
			this.txtMiJi.Text=Model.MiJi.ToString();
			this.txtJingJi.Text=Model.JingJi.ToString();
			this.txtTypeStr.Text=Model.TypeStr.ToString();
			this.txtGongWenType.Text=Model.GongWenType.ToString();
			this.txtFilePage.Text=Model.FilePage.ToString();
		    ZWL.Common.PublicMethod.SetSessionValue("WenJianList", Model.FuJianList);
		    ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
			this.txtBackInfo.Text=Model.BackInfo.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		}
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPDangAn Model = new ZWL.BLL.ERPDangAn();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.FileName=this.txtFileName.Text.ToString();
		Model.JuanKuName=this.txtJuanKuName.Text.ToString();
		Model.FileSerils=this.txtFileSerils.Text.ToString();
		Model.FileTitle=this.txtFileTitle.Text.ToString();
		Model.FaWenDanWei=this.txtFaWenDanWei.Text.ToString();
		Model.FaWenDate=this.txtFaWenDate.Text.ToString();
		Model.MiJi=this.txtMiJi.Text.ToString();
		Model.JingJi=this.txtJingJi.Text.ToString();
		Model.TypeStr=this.txtTypeStr.Text.ToString();
		Model.GongWenType=this.txtGongWenType.Text.ToString();
		Model.FilePage=this.txtFilePage.Text.ToString();
		Model.FuJianList=ZWL.Common.PublicMethod.GetSessionValue("WenJianList");
		Model.BackInfo=this.txtBackInfo.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		
		Model.Update();
		
		//写系统日志
		ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
		MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改档案文件信息(" + this.txtFileName.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "档案文件信息修改成功！", "DangAn.aspx?JuanKuName=" + Request.QueryString["JuanKuName"].ToString());
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
                    ZWL.Common.PublicMethod.SetSessionValue("WenJianList", ZWL.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Text, "").Replace("||", "|"));
                }
            }
            ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }

    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/ReadFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/EditFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Text + "');</script>");
            }
        }
        catch
        { }
    }
}
