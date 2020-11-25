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
 public partial class LiRunView: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPLiRun model = new FTD.BLL.ERPLiRun();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblProjectName.Text = model.ProjectName;
            this.lblProjectSerils.Text = model.ProjectSerils;
            this.lblSumJinE.Text = model.SumJinE;
            this.lblFeiYong.Text = model.FeiYong;
            this.lblChengBen.Text = model.ChengBen;
            this.lblFangZu.Text = model.FangZu;
            this.lblShuiE.Text = model.ShuiE;
            this.lblGongZi.Text = model.GongZi;
            this.lblTiCheng.Text = model.TiCheng;
            this.lblQiTa.Text = model.QiTa;
            this.lblShiJi.Text = model.ShiJi;
            this.lblUserName.Text = model.UserName;
            this.lblTimeStr.Text = model.TimeStr.ToString();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "查看利润核算信息(" + this.lblProjectName.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();
        }
    }
}
}