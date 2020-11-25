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

namespace OA.aspx.Sell{ 
 public partial class ContractModify: System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            this.txtQianYueKeHu.Attributes.Add("readonly", "true");
            FTD.BLL.ERPContract Model = new FTD.BLL.ERPContract();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtHeTongName.Text = Model.HeTongName.ToString();
            this.txtHeTongSerils.Text = Model.HeTongSerils.ToString();
            this.txtHeTongLeiXing.Text = Model.HeTongLeiXing.ToString();
            this.txtQianYueKeHu.Text = Model.QianYueKeHu.ToString();
            this.txtHeTongMiaoShu.Text = Model.HeTongMiaoShu.ToString();
            this.txtHeTongTiaoKuan.Text = Model.HeTongTiaoKuan.ToString();
            this.txtHeTongContent.Text = Model.HeTongContent.ToString();
            this.txtShengXiaoDate.Text = Model.ShengXiaoDate.ToString().Replace(" 0:00:00", "");
            this.txtZhongZhiDate.Text = Model.ZhongZhiDate.ToString().Replace(" 0:00:00", "");
            this.txtTiXingDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");
            this.txtQianYueRenBuy.Text = Model.QianYueRenBuy.ToString();
            this.txtQianYueRenSell.Text = Model.QianYueRenSell.ToString();
            this.Label2.Text = Model.CreateTime.ToString();
            this.Label1.Text = Model.CreateUser.ToString();

            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", Model.FuJianList);
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));

            this.txtBackInfo.Text = Model.BackInfo.ToString();
            this.Label3.Text = Model.NowState.ToString();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPContract Model = new FTD.BLL.ERPContract();
        if (FTD.Unit.PublicMethod.IFExists("HeTongName", "ERPContract", 0, this.txtHeTongName.Text) == true)
        {
            Model.ID = int.Parse(Request.QueryString["ID"].ToString());
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
            Model.CreateTime = DateTime.Parse(this.Label2.Text);
            Model.CreateUser = this.Label1.Text.ToString();
            Model.FuJianList = FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.NowState = this.Label3.Text.ToString();

            Model.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改销售订单信息(" + this.txtHeTongName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "销售订单信息修改成功！", "ContractDengJi.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该订单名称已经存在，请更改其他订单名称！");
        }
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
                    FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Text, "").Replace("||", "|"));
                }
            }
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }

    protected void iButton4_Click(object sender, EventArgs e)
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
    protected void iButton5_Click(object sender, EventArgs e)
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
}