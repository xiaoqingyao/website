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

public partial class NWorkFlow_WorkWT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            //设定按钮权限
            ImageButton1.Visible = ZWL.Common.PublicMethod.StrIFIn("|021M|", ZWL.Common.PublicMethod.GetSessionValue("QuanXian"));

            //读取当前已有的设置

            this.Label1.Text = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            this.TextBox1.Text = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 ToUser from ERPNWorkFlowWT where FromUser='"+ZWL.Common.PublicMethod.GetSessionValue("UserName")+"'");            
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (ZWL.DBUtility.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPNWorkFlowWT where FromUser='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "'") == "0")
        {
            //不存在就添加
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("insert into ERPNWorkFlowWT(FromUser,ToUser) values('" + this.Label1.Text + "','" + this.TextBox1.Text.Trim() + "')");
        }
        else
        {
            ZWL.DBUtility.DbHelperSQL.ExecuteSQL("update ERPNWorkFlowWT set ToUser='" + this.TextBox1.Text.Trim() + "' where FromUser='" + this.Label1.Text + "'");
        }

        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户设置工作委托信息(被委托人：" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        //发送内部信息
        ZWL.BLL.ERPLanEmail MyMail = new ZWL.BLL.ERPLanEmail();
        MyMail.EmailContent = "用户："+this.Label1.Text.Trim()+" 已经设置您为他的工作委托人，在该用户重新设置委托人之前，所有待办工作将转入由您进行办理！";
        MyMail.EmailState = "未读";
        MyMail.EmailTitle = "用户：" + this.Label1.Text.Trim() + " 已经设置您为他的工作委托人"; 
        MyMail.FromUser = "系统消息";
        MyMail.FuJian = "";
        MyMail.TimeStr = DateTime.Now;
        MyMail.ToUser =this.TextBox1.Text.Trim();
        MyMail.Add();


        ZWL.Common.MessageBox.Show(this, "工作委托已经成功设置！");
    }
}
