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

namespace OA.aspx.Moa.DocFile{ 
 public partial class JiangChengZhiDuModify: System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			FTD.Unit.PublicMethod.CheckSession();
			FTD.BLL.ERPJiangChengZhiDu Model = new FTD.BLL.ERPJiangChengZhiDu();
			Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
			this.txtTitleStr.Text=Model.TitleStr.ToString();
			this.txtJianJie.Text=Model.JianJie.ToString();
			this.txtUserName.Text=Model.UserName.ToString();
			this.txtTimeStr.Text=Model.TimeStr.ToString();
		FTD.Unit.PublicMethod.SetSessionValue("WenJianList", Model.FuJianStr);
		FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
			this.txtConTentStr.Text=Model.ConTentStr.ToString();
		}
	}
	protected void iButton1_Click(object sender, EventArgs e)
	{
		FTD.BLL.ERPJiangChengZhiDu Model = new FTD.BLL.ERPJiangChengZhiDu();
		
		Model.ID = int.Parse(Request.QueryString["ID"].ToString());
		Model.TitleStr=this.txtTitleStr.Text.ToString();
		Model.JianJie=this.txtJianJie.Text.ToString();
		Model.UserName=this.txtUserName.Text.ToString();
		Model.TimeStr=DateTime.Parse(this.txtTimeStr.Text);
		Model.FuJianStr=FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
		Model.ConTentStr=this.txtConTentStr.Text.ToString();
		
		Model.Update();
		
		//写系统日志
		FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
		MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
		MyRiZhi.DoSomething = "用户修改奖惩制度信息(" + this.txtTitleStr.Text + ")";
		MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
		MyRiZhi.Add();
		
		FTD.Unit.MessageBox.ShowAndRedirect(this, "奖惩制度信息修改成功！", "JiangChengZhiDu.aspx");
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