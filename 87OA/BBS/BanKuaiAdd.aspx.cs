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

public partial class BBS_BanKuaiAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        ZWL.BLL.ERPBBSBanKuai Model = new ZWL.BLL.ERPBBSBanKuai();
        Model.BanKuaiName = this.TextBox1.Text;
        Model.BanZhuList = this.TextBox2.Text;
        Model.BanKuaiMiaoShu = this.TextBox3.Text;
        Model.JiaoSeXianZhiList = this.TextBox4.Text;
        Model.BuMenXianZhi = this.TextBox5.Text;
        Model.UserXianZhi = this.TextBox6.Text;

        string ImgNameStr = ZWL.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (ImgNameStr.Trim().Length <= 0)
        {
            ImgNameStr = "BanKuai.gif";
        }
        Model.BanKuaiImg = ImgNameStr;

        Model.Add();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加论坛版块信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "论坛版块添加成功！", "SettingConfig.aspx");
    }
}