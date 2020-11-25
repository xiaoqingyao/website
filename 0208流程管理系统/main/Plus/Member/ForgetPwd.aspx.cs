using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model.MemberManage;
using AllPower.BLL.MemberManage;
using System.Net.Mail;
using System.Net;


#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      涂芳
    创建时间： 2010年11月02日
    功能描述： 找回密码 
--===============================================================*/
#endregion

namespace AllPower.WEB.main.Plus.Member
{
    public partial class ForgetPwd : System.Web.UI.Page
    {
        #region 变量成员
        protected string jsMessage = string.Empty;
        #endregion

        #region 实例化对象
        AllPower.BLL.MemberManage.Member MemberBll = new AllPower.BLL.MemberManage.Member();
        AllPower.Model.MemberManage.Member member = new AllPower.Model.MemberManage.Member();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.lblVel.Visible = false;
                this.lblEmalUsn.Visible = false;
                if (Request["token"] != null)
                {
                    bool ValToken = MemberBll.GetMIDbyToken(Request["token"]);
                    if (!ValToken)
                    {
                        jsMessage = "alert({msg:'该激活码不存在！',title:'提示信息'})";
                        return;
                    }
                    else
                    {
                        member.Token = Request["token"];
                        member.Password = MemberBll.GetPwdByToken(Request["token"]).Pwdve;
                        if (MemberBll.UpdatePwdByToken(member))
                        {
                            jsMessage = "alertClose({msg:'激活成功,请使用新密码重新登录！',title:'提示信息'},function (){window.location.href='Login.aspx';})";
                            return;
                        }
                        else 
                        {
                            jsMessage = "alert({msg:'激活失败！',title:'提示信息'})";
                            return;
                        }
                    }
                }
            }
        }

        //邮箱服务器：strSmtpServer,发件人账号:strFrom,发件人密码：strFormPass,收件人的账号：strto,主题：strtSubject,内容：strBody
        public void SendSMTPEMail(string strSmtpServer, string strFrom, string strFromPass, string strto, string strSubject, string strBody)
        {
            try
            {
                System.Net.Mail.SmtpClient client = new SmtpClient(strSmtpServer);
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential(strFrom, strFromPass);
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                System.Net.Mail.MailMessage message = new MailMessage(strFrom, strto, strSubject, strBody);
                message.BodyEncoding = System.Text.Encoding.UTF8;
                message.IsBodyHtml = true;
                client.Send(message);
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
      

        public void BtnFindPwd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session[SystemConst.SESSION_VALIDATECODE] == null || txtVel.Text.ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower())
                {
                    txtVel.Text = "";
                    this.lblVel.Visible = true;
                    return;
                }
                else
                {
                    this.lblVel.Visible = false;
                    bool ValiFindID = MemberBll.GetMemberIDByEmail(this.txtEmail.Text, this.txtUsn.Text);
                    if (!ValiFindID)
                    {
                        this.lblEmalUsn.Visible = true;
                        return;
                    }
                    else
                    {
                        this.lblEmalUsn.Visible = false;
                        string txtemail = this.txtEmail.Text;

                        member.UserName = this.txtUsn.Text;
                        member.Pwdve = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPwd.Text, "MD5");
                        string username = Guid.NewGuid().ToString();
                        string a = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(username, "MD5");
                        member.Token = a;
                   
                        string urlmail = Server.MapPath("~/main/config/Post.config");
                        string email = Utils.XmlRead(urlmail, "/PostConfig/Email", "");
                        string smserver = Utils.XmlRead(urlmail, "/PostConfig/SmtpServer", "");
                        string passw = DesSecurity.DesDecrypt(Utils.XmlRead(urlmail, "/PostConfig/Password", ""), "emailpwd");
                        
                        if (MemberBll.UpdatePwd(member))
                        {
                            SendSMTPEMail(smserver, email, passw, txtemail, "密码激活", "请点击以下链接激活密码:<a href=" + Request.Url.ToString() + "?token=" + a + " >" + Request.Url.ToString() + "?token=" + a + "" + "</a>");
                            jsMessage = "alert({ msg: '您的申请已提交成功，请到邮箱激活本次操作！', title: '提示信息' })";
                        }
                        else 
                        {                                         
                            jsMessage = "alert({ msg: '申请失败，请重新提交！', title: '提示信息' })";
                        }
                        // "nz.oicp.net", "123@nz.oicp.net"
                    }
                }
            }
            catch (Exception er)
            {
                lblMessage.Text = er.Message;
            }
        }
    }
}
