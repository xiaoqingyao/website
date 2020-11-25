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
using FTD.DBUnit;

namespace OA.aspx.Supply{ 
 public partial class BuyOrderAdd: System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            //设置上传的附件为空
            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", "");
            string str = Request.QueryString["name"];
            FTD.BLL.ERPBuyOrder Model = new FTD.BLL.ERPBuyOrder();
            txtSerils.Text = Model.GetSerils();
            this.txtOrderName.Text = str;
            this.txtGongYingShangName.Attributes.Add("readonly", "true");
            string sql = "insert into ERPBuyChanPin(OrderName,ProductName,Danjia,ShuLiang,ZongJia,YiFuKuan,QianKuanShu,IFJiaoFu) select HeTongName,ChanPinName,DanJia,ShuLiang,ZongJia,YiFuKuan,QianKuanShu,IFJiaoFu from ERPContractChanPin where HeTongName='" + str + "'";
            DbHelperSQL.ExecuteSql(sql.ToString());
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPBuyOrder Model = new FTD.BLL.ERPBuyOrder();
        FTD.BLL.ERPContract Model1 = new FTD.BLL.ERPContract();
        if (FTD.Unit.PublicMethod.IFExists("OrderName", "ERPBuyOrder", 0, this.txtOrderName.Text) == true)
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
            Model.FuJianList = FTD.Unit.PublicMethod.GetSessionValue("WenJianList");
            Model.NowState = "等待审核";
            Model.ShenPiTongGuoRen = "";
            Model.BackInfo = this.txtBackInfo.Text.ToString();
            Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            Model.TimeStr = DateTime.Now;

            Model.Add();
            DataSet ds = Model1.GetList("HeTongName='" + this.txtOrderName.Text + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {
                string sql = "update  ERPContract set NowState='正在采购' where ID=" + ds.Tables[0].Rows[0]["ID"].ToString() + "";
                DbHelperSQL.ExecuteSql(sql.ToString());
            }

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加采购订单信息(" + this.txtOrderName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "采购订单信息添加成功！", "BuyDengJi.aspx");
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