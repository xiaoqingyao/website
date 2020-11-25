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

public partial class BBS_TieZiAdd : System.Web.UI.Page
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
        ZWL.BLL.ERPBBSTieZi Model = new ZWL.BLL.ERPBBSTieZi();
        Model.BanKuaiID = int.Parse(Request.QueryString["BanKuaiID"].ToString());
        Model.ContentStr = this.TxtContent.Text;
        Model.HuiFuContent = "";
        Model.PaiXu = 0;
        Model.TimeStr = DateTime.Now;
        Model.TitleStr = this.TextBox1.Text.Trim();
        Model.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model.ZuiHouTime = DateTime.Now;
        Model.ZuiHouUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        Model.Add();

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加论坛帖子信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        ZWL.Common.MessageBox.ShowAndRedirect(this, "论坛帖子添加成功！", "BanKuaiView.aspx?ID="+Request.QueryString["BanKuaiID"].ToString());
    }
}