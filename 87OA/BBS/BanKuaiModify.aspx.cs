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

public partial class BBS_BanKuaiModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();

            ZWL.BLL.ERPBBSBanKuai MyModel = new ZWL.BLL.ERPBBSBanKuai();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyModel.BanKuaiName;
            this.TextBox2.Text = MyModel.BanZhuList;
            this.TextBox3.Text = MyModel.BanKuaiMiaoShu;
            this.TextBox4.Text = MyModel.JiaoSeXianZhiList;
            this.TextBox5.Text = MyModel.BuMenXianZhi;
            this.TextBox6.Text = MyModel.UserXianZhi;
            this.HyperLink1.Text = MyModel.BanKuaiImg;
            this.HyperLink1.NavigateUrl = "../UploadFile/" + this.HyperLink1.Text;
            this.HyperLink1.Target = "_blank";
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPBBSBanKuai Model = new ZWL.BLL.ERPBBSBanKuai();
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.BanKuaiName = this.TextBox1.Text;
        Model.BanZhuList = this.TextBox2.Text;
        Model.BanKuaiMiaoShu = this.TextBox3.Text;
        Model.JiaoSeXianZhiList = this.TextBox4.Text;
        Model.BuMenXianZhi = this.TextBox5.Text;
        Model.UserXianZhi = this.TextBox6.Text;

        string ImgNameStr = ZWL.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (ImgNameStr.Trim().Length <= 0)
        {
            ImgNameStr = this.HyperLink1.Text;
        }
        Model.BanKuaiImg = ImgNameStr;

        Model.Update();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改论坛版块信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "论坛版块修改成功！", "SettingConfig.aspx");
    }
}