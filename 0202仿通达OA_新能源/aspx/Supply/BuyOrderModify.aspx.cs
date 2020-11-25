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

namespace OA.aspx.Supply{ 
 public partial class BuyOrderModify: System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPBuyOrder Model = new FTD.BLL.ERPBuyOrder();
            Model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtOrderName.Text = Model.OrderName.ToString();
            this.txtGongYingShangName.Text = Model.GongYingShangName.ToString();
            this.txtSerils.Text = Model.Serils.ToString();
            this.txtDingDanLeiXing.Text = Model.DingDanLeiXing.ToString();
            this.txtDingDanMiaoShu.Text = Model.DingDanMiaoShu.ToString();
            this.txtCreateDate.Text = Model.CreateDate.ToString().Replace(" 0:00:00", "");
            this.txtLaiHuoDate.Text = Model.LaiHuoDate.ToString().Replace(" 0:00:00", "");
            this.txtTiXingDate.Text = Model.TiXingDate.ToString().Replace(" 0:00:00", "");
            this.txtChuangJianRen.Text = Model.ChuangJianRen.ToString();
            this.txtFuZeRen.Text = Model.FuZeRen.ToString();
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", Model.FuJianList);
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
            this.txtNowState.Text = Model.NowState.ToString();
            this.txtShenPiTongGuoRen.Text = Model.ShenPiTongGuoRen.ToString();
            this.txtBackInfo.Text = Model.BackInfo.ToString();
            this.txtUserName.Text = Model.UserName.ToString();
            this.txtTimeStr.Text = Model.TimeStr.ToString();
            this.txtGongYingShangName.Attributes.Add("readonly", "true");
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPBuyOrder Model = new FTD.BLL.ERPBuyOrder();
        if (FTD.Unit.PublicMethod.IFExists("OrderName", "ERPBuyOrder", 0, this.txtOrderName.Text) == true)
        {
            Model.ID = int.Parse(Request.QueryString["ID"].ToString());
            Model.OrderName = this.txtOrderName.Text.ToString();
            Model.GongYingShangName = this.txtGongYingShangName.Text.ToString();
            Model.Serils = this.txtSerils.Text.ToString();
            Model.DingDanLeiXing = this.txtDingDanLeiXing.Text.ToString();
            Model.DingDanMiaoShu = this.txtDingDanMiaoShu.Text.ToString();
            Model.CreateDate = DateTime.Parse(this.txtCreateDate.Text);
            Model.LaiHuoDate = DateTime.Parse(this.txtLaiHuoDate.Text);
            Model.TiXingDate = DateTime.Parse(this.txtTiXingDate.Text);
            Model.ChuangJianRen = this.txtChuangJianRen.Text.ToString();
            Model.FuZeRen = this.txtFuZeRen.Text.ToString();
            Model.FuJianList = FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
            Model.NowState = this.txtNowState.Text.ToString();
            Model.ShenPiTongGuoRen = this.txtShenPiTongGuoRen.Text.ToString();
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.UserName = this.txtUserName.Text.ToString();
            Model.TimeStr = DateTime.Parse(this.txtTimeStr.Text);

            Model.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改采购订单信息(" + this.txtOrderName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "采购订单信息修改成功！", "BuyDengJi.aspx");
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