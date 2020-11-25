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

public partial class CRM_SongYangModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            ZWL.BLL.ERPSongYang model = new ZWL.BLL.ERPSongYang();
            model.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.txtCustomName.Text = model.CustomName;
            this.txtSongYangLiaoHao.Text = model.SongYangLiaoHao;
            this.txtSongYangType.Text = model.SongYangType;
            this.txtSongYangShuLiang.Text = model.SongYangShuLiang;
            this.txtSongYangResult.Text = model.SongYangResult;
            this.txtSongYangTime.Text = model.SongYangTime;
            this.Label1.Text = model.UserName;
            this.Label2.Text = model.TimeStr.ToString();
            this.txtIFShare.Text = model.IFShare;
            this.txtCusBakA.Text = model.CusBakA;
            this.txtCusBakB.Text = model.CusBakB;
            this.txtCusBakC.Text = model.CusBakC;
            this.txtCusBakD.Text = model.CusBakD;
            this.txtCusBakE.Text = model.CusBakE;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPSongYang model = new ZWL.BLL.ERPSongYang();
        model.ID = int.Parse(Request.QueryString["ID"].ToString());
        model.CustomName = this.txtCustomName.Text;
        model.SongYangLiaoHao = this.txtSongYangLiaoHao.Text;
        model.SongYangType = this.txtSongYangType.Text;
        model.SongYangShuLiang = this.txtSongYangShuLiang.Text;
        model.SongYangResult = this.txtSongYangResult.Text;
        model.SongYangTime = this.txtSongYangTime.Text;
        model.UserName = this.Label1.Text;
        model.TimeStr = DateTime.Parse(this.Label2.Text);
        model.IFShare = this.txtIFShare.Text;
        model.CusBakA = this.txtCusBakA.Text;
        model.CusBakB = this.txtCusBakB.Text;
        model.CusBakC = this.txtCusBakC.Text;
        model.CusBakD = this.txtCusBakD.Text;
        model.CusBakE = this.txtCusBakE.Text;
        model.Update();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改送样记录(" + this.txtCustomName.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "送样记录修改成功！", "MySongYang.aspx?CustomName=" + Request.QueryString["CustomName"].ToString());
    }
}