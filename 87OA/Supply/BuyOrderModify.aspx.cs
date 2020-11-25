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

public partial class Supply_BuyOrderModify : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPBuyOrder Model = new ZWL.BLL.ERPBuyOrder();
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
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", Model.FuJianList);
            ZWL.Common.PublicMethod.BindDDL(this.CheckBoxList1, ZWL.Common.PublicMethod.GetSessionValue("WenJianList"));
            this.txtNowState.Text = Model.NowState.ToString();
            this.txtShenPiTongGuoRen.Text = Model.ShenPiTongGuoRen.ToString();
            this.txtBackInfo.Text = Model.BackInfo.ToString();
            this.txtUserName.Text = Model.UserName.ToString();
            this.txtTimeStr.Text = Model.TimeStr.ToString();
            this.txtGongYingShangName.Attributes.Add("readonly", "true");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPBuyOrder Model = new ZWL.BLL.ERPBuyOrder();
        if (ZWL.Common.PublicMethod.IFExists("OrderName", "ERPBuyOrder", 0, this.txtOrderName.Text) == true)
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
            Model.FuJianList = ZWL.Common.PublicMethod.GetSessionValue("WenJianList");
            Model.NowState = this.txtNowState.Text.ToString();
            Model.ShenPiTongGuoRen = this.txtShenPiTongGuoRen.Text.ToString();
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.UserName = this.txtUserName.Text.ToString();
            Model.TimeStr = DateTime.Parse(this.txtTimeStr.Text);

            Model.Update();

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改采购订单信息(" + this.txtOrderName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "采购订单信息修改成功！", "BuyDengJi.aspx");
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
