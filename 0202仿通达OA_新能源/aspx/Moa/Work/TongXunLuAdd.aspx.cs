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

namespace OA.aspx.Moa.Work{ 
 public partial class TongXunLuAdd: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.BLL.ERPTongXunLu Model = new FTD.BLL.ERPTongXunLu();
        Model.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        Model.IfShare = this.RadioButtonList1.SelectedItem.Text;
        Model.TypeStr = Request.QueryString["TypeStr"].ToString();
        Model.FenZu = this.TextBox1.Text.Trim();
        Model.NameStr = this.TextBox2.Text.Trim();
        Model.Sex = this.TextBox3.Text.Trim();
        Model.BirthDay = this.TextBox4.Text.Trim();
        Model.NiCheng = this.TextBox5.Text.Trim();
        Model.ZhiWu = this.TextBox6.Text.Trim();
        Model.PeiOu = this.TextBox7.Text.Trim();
        Model.ZiNv = this.TextBox8.Text.Trim();
        Model.DanWeiMingCheng = this.TextBox9.Text.Trim();
        Model.DanWeiDiZhi = this.TextBox10.Text.Trim();
        Model.DanWeiYouBian = this.TextBox11.Text.Trim();
        Model.DanWieDianHua = this.TextBox12.Text.Trim();
        Model.DanWeiChuanZhen = this.TextBox13.Text.Trim();
        Model.JiaTingZhuZhi = this.TextBox14.Text.Trim();
        Model.JiaTingYouBian = this.TextBox15.Text.Trim();
        Model.JiaTingDianHua = this.TextBox16.Text.Trim();
        Model.ShouJi = this.TextBox17.Text.Trim();
        Model.XiaoLingTong = this.TextBox18.Text.Trim();
        Model.Email = this.TextBox19.Text.Trim();
        Model.QQ = this.TextBox20.Text.Trim();
        Model.Msn = this.TextBox21.Text.Trim();
        Model.BackInfo = this.TxtContent.Text;
        Model.Add();

        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户添加联系人信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        FTD.Unit.MessageBox.ShowAndRedirect(this, "联系人信息添加成功！", "TongXunLu.aspx?TypeStr=" + Request.QueryString["TypeStr"].ToString());
    }
}}