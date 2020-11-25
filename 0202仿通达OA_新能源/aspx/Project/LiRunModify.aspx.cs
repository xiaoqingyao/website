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

namespace OA.aspx.Project{ 
 public partial class LiRunModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPLiRun model = new FTD.BLL.ERPLiRun();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtProjectName.Text = model.ProjectName;
            this.txtProjectSerils.Text = model.ProjectSerils;
            this.txtSumJinE.Text = model.SumJinE;
            this.txtFeiYong.Text = model.FeiYong;
            this.txtChengBen.Text = model.ChengBen;
            this.txtFangZu.Text = model.FangZu;
            this.txtShuiE.Text = model.ShuiE;
            this.txtGongZi.Text = model.GongZi;
            this.txtTiCheng.Text = model.TiCheng;
            this.txtQiTa.Text = model.QiTa;
            this.txtShiJi.Text = model.ShiJi;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPLiRun model = new FTD.BLL.ERPLiRun();
        model.ID = int.Parse(Request.QueryString["ID"].ToString());
        model.ProjectName = this.txtProjectName.Text;
        model.ProjectSerils = this.txtProjectSerils.Text;
        model.SumJinE = this.txtSumJinE.Text;
        model.FeiYong = this.txtFeiYong.Text;
        model.ChengBen = this.txtChengBen.Text;
        model.FangZu = this.txtFangZu.Text;
        model.ShuiE = this.txtShuiE.Text;
        model.GongZi = this.txtGongZi.Text;
        model.TiCheng = this.txtTiCheng.Text;
        model.QiTa = this.txtQiTa.Text;
        model.ShiJi = this.txtShiJi.Text;
        model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        model.TimeStr = DateTime.Now;
        model.Update();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改利润核算信息(" + this.txtProjectName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        FTD.Unit.MessageBox.ShowAndRedirect(this, "利润核算信息修改成功！", "LiRuiGuanLi.aspx?ProjectName=" + Request.QueryString["ProjectName"].ToString());
    }
}}