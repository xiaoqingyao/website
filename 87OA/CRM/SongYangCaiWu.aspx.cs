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

public partial class CRM_SongYangCaiWu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPSongYang model = new ZWL.BLL.ERPSongYang();
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
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPSongYang set SongYangDanJia='" + this.txtSongYangDanJia.Text.Trim() + "',SongYangJinE='"+this.txtSongYangJinE.Text.Trim()+"' where ID="+Request.QueryString["ID"].ToString());

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户输入送样财务记录(" + this.lblCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "送样记录财务信息输入成功！", "SongYang.aspx");
    }
}