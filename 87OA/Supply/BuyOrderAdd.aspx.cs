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
using ZWL.DBUtility;

public partial class Supply_BuyOrderAdd : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            //设置上传的附件为空
            ZWL.Common.PublicMethod.SetSessionValue("WenJianList", "");
            string str = Request.QueryString["name"];
            ZWL.BLL.ERPBuyOrder Model = new ZWL.BLL.ERPBuyOrder();
            txtSerils.Text = Model.GetSerils();
            this.txtOrderName.Text = str;
            this.txtGongYingShangName.Attributes.Add("readonly", "true");
            string sql = "insert into ERPBuyChanPin(OrderName,ProductName,Danjia,ShuLiang,ZongJia,YiFuKuan,QianKuanShu,IFJiaoFu) select HeTongName,ChanPinName,DanJia,ShuLiang,ZongJia,YiFuKuan,QianKuanShu,IFJiaoFu from ERPContractChanPin where HeTongName='" + str + "'";
            DbHelperSQL.ExecuteSql(sql.ToString());
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPBuyOrder Model = new ZWL.BLL.ERPBuyOrder();
        ZWL.BLL.ERPContract Model1 = new ZWL.BLL.ERPContract();
        if (ZWL.Common.PublicMethod.IFExists("OrderName", "ERPBuyOrder", 0, this.txtOrderName.Text) == true)
        {
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
            Model.NowState = "等待审核";
            Model.ShenPiTongGuoRen = "";
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            Model.TimeStr = DateTime.Now;

            Model.Add();
            DataSet ds = Model1.GetList("HeTongName='" + this.txtOrderName.Text + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string sql = "update  ERPContract set NowState='正在采购' where ID=" + ds.Tables[0].Rows[0]["ID"].ToString() + "";
                DbHelperSQL.ExecuteSql(sql.ToString());
            }

            //写系统日志
            ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
            MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加采购订单信息(" + this.txtOrderName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            ZWL.Common.MessageBox.ShowAndRedirect(this, "采购订单信息添加成功！", "BuyDengJi.aspx");
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
