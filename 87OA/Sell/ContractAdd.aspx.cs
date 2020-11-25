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

public partial class Sell_ContractAdd : System.Web.UI.Page
{


	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			ZWL.Common.PublicMethod.CheckSession();
            //设置上传的附件为空
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
            this.txtQianYueKeHu.Attributes.Add("readonly", "true");
            ZWL.BLL.ERPContract Model = new ZWL.BLL.ERPContract();
            txtHeTongSerils.Text = Model.GetSerils();
        }
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		ZWL.BLL.ERPContract Model = new ZWL.BLL.ERPContract();
        if (ZWL.Common.PublicMethod.IFExists("HeTongName", "ERPContract", 0, this.txtHeTongName.Text) == true)
        {
            Model.HeTongName = this.txtHeTongName.Text.ToString();
            Model.HeTongSerils = this.txtHeTongSerils.Text.ToString();
            Model.HeTongLeiXing = this.txtHeTongLeiXing.Text.ToString();
            Model.QianYueKeHu = this.txtQianYueKeHu.Text.ToString();
            Model.HeTongMiaoShu = this.txtHeTongMiaoShu.Text.ToString();
            Model.HeTongTiaoKuan = this.txtHeTongTiaoKuan.Text.ToString();
            Model.HeTongContent = this.txtHeTongContent.Text.ToString();
            Model.ShengXiaoDate = DateTime.Parse(this.txtShengXiaoDate.Text);
            Model.ZhongZhiDate = DateTime.Parse(this.txtZhongZhiDate.Text);
            Model.TiXingDate = DateTime.Parse(this.txtTiXingDate.Text);
            Model.QianYueRenBuy = this.txtQianYueRenBuy.Text.ToString();
            Model.QianYueRenSell = this.txtQianYueRenSell.Text.ToString();
            Model.CreateTime = DateTime.Now;
            Model.CreateUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            Model.FuJianList = ZWL.Common.PublicMethod.GetSessionValue("WenJianList");
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.NowState = "等待审核";

            Model.Add();


            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加销售订单信息(" + this.txtHeTongName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "销售订单信息添加成功！", "ContractDengJi.aspx");
        }
        else
        {
            ZWL.Common.MessageBox.Show(this, "该订单名称已经存在，请更改其他订单名称！");
        }
		
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
