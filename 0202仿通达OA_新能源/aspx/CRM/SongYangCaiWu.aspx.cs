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

namespace OA.aspx.CRM{ 
 public partial class SongYangCaiWu: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPSongYang model = new FTD.BLL.ERPSongYang();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.lblCustomName.Text = model.CustomName;
            this.lblSongYangLiaoHao.Text = model.SongYangLiaoHao;
            this.lblSongYangType.Text = model.SongYangType;
            this.lblSongYangShuLiang.Text = model.SongYangShuLiang;
            this.txtSongYangDanJia.Text = model.SongYangDanJia;
            this.txtSongYangJinE.Text = model.SongYangJinE;
            this.lblSongYangResult.Text = model.SongYangResult;
            this.lblSongYangTime.Text = model.SongYangTime;
            this.lblUserName.Text = model.UserName;
            this.lblTimeStr.Text = model.TimeStr.ToString();
            this.lblIFShare.Text = model.IFShare;
            this.lblCusBakA.Text = model.CusBakA;
            this.lblCusBakB.Text = model.CusBakB;
            this.lblCusBakC.Text = model.CusBakC;
            this.lblCusBakD.Text = model.CusBakD;
            this.lblCusBakE.Text = model.CusBakE;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPSongYang set SongYangDanJia='" + this.txtSongYangDanJia.Text.Trim() + "',SongYangJinE='"+this.txtSongYangJinE.Text.Trim()+"' where ID="+Request.QueryString["ID"].ToString());

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户输入送样财务记录(" + this.lblCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "送样记录财务信息输入成功！", "SongYang.aspx");
    }
}}