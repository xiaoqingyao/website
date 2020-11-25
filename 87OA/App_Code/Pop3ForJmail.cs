using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using jmail;

/// <summary>
/// Pop3ForJmail 的摘要说明
/// </summary>
public class Pop3ForJmail
{
    public Pop3ForJmail()
    {
        
    }
    /// <summary>
    /// 收取新邮件、不删除老邮件、收取邮件后写入数据库
    /// </summary>
    public static void GetNewMailIntoDataBase(string UserName,string PassWord,string PopServer,int Port,DateTime MaxDate)
    {
        POP3 NewMail = new POP3();
        
        NewMail.Connect(UserName, PassWord, PopServer, Port);        
        for (int i = 1; i <= NewMail.Count; i++)
        {
            //判断是否跟当前最大的时间作比较，大于当前时间就处理
            DateTime CurrentEmailDate = DateTime.Now;
            try
            {
                CurrentEmailDate = DateTime.Parse(NewMail.Messages[i].Date.ToString());
            }
            catch
            { }

            try
            {
                if (CurrentEmailDate.CompareTo(MaxDate) > 0)
                {
                    string EmailFuJian = "";
                    for (int j = 0; j < NewMail.Messages[i].Attachments.Count; j++)
                    {

                        NewMail.Messages[i].Charset = "GB2312"; //设置邮件的编码方式
                        NewMail.Messages[i].Encoding = "Base64"; //设置邮件的附件编码方式
                        NewMail.Messages[i].ISOEncodeHeaders = false; //是否将信头编码成iso-8859-1字符集



                        try
                        {
                            string FileName = DateTime.Now.Ticks.ToString() + NewMail.Messages[i].Attachments[j].Name;
                            //符合上传要求就保存，否则提示文件名未下载
                            if (ZWL.Common.PublicMethod.IfOkFile(FileName) == true)
                            {
                                NewMail.Messages[i].Attachments[j].SaveToFile(System.Web.HttpContext.Current.Request.MapPath("../UploadFile") + "\\MailAttachments\\" + FileName);
                            }
                            else
                            {
                                System.Web.HttpContext.Current.Response.Write("<script>alert('邮件附件文件：" + NewMail.Messages[i].Attachments[j].Name + " 不符合本服务器文件保存权限设置，禁止下载！已自动跳过本附件！');</script>");
                            }
                            if (EmailFuJian.Trim().Length > 0)
                            {
                                EmailFuJian = EmailFuJian + "|MailAttachments/" + FileName;
                            }
                            else
                            {
                                EmailFuJian = "MailAttachments/" + FileName;
                            }
                        }
                        catch (Exception e)
                        {
                            System.Web.HttpContext.Current.Response.Write("<script>alert('" + e.Message.ToString() + "');</script>");
                        }
                    }

                    ZWL.BLL.ERPNetEmail MyModel = new ZWL.BLL.ERPNetEmail();
                    MyModel.EmailContent = NewMail.Messages[i].Body;
                    MyModel.EmailState = "未读";
                    MyModel.EmailTitle = NewMail.Messages[i].Subject;
                    MyModel.FromUser = NewMail.Messages[i].FromName + "（" + NewMail.Messages[i].From + "）";
                    MyModel.FuJian = EmailFuJian;
                    try
                    {
                        MyModel.TimeStr = DateTime.Parse(NewMail.Messages[i].Date.ToString());
                    }
                    catch
                    {
                        MyModel.TimeStr = DateTime.Now;
                    }
                    MyModel.ToUser = ZWL.Common.PublicMethod.GetSessionValue("UserName");

                    MyModel.Add();
                }
            }
            catch (Exception ee)
            {
                System.Web.HttpContext.Current.Response.Write("<script>alert('" + ee.Message.ToString() + "');</script>");
            }
        }
        NewMail.Disconnect();
    }
    /// <summary>
    /// 发送邮件到网络
    /// </summary>
    public static void SendMail(string UserName, string PassWord, string SMTPServer, string Subject, string body, string FromEmail, string ToEmail,string FuJianList)
    {
        try
        {
            Message Jmail = new Message();
            DateTime t = DateTime.Now;

            //Slient属性:如果设置为true,Jmail不会抛出例外错误，Jmail.Send()会根据操作结果返回True或False
            Jmail.Silent = false;

            //Jmail创建的日志，提前loging属性设置为True
            Jmail.Logging = true;

            //字符集，缺省为"US-ASCII";
            Jmail.Charset = "GB2312";

            //信件的ContentType,缺省为"Text/plain",字符串如果你以Html格式发送邮件，改为"Text/Html"即可。
            //Jmail.ContentType = "text/html";

            //添加收件人
            Jmail.AddRecipient(ToEmail, "", "");
            Jmail.From = FromEmail;

            //发件人邮件用户名
            Jmail.MailServerUserName = UserName;

            //发件人邮件密码
            Jmail.MailServerPassWord = PassWord;

            //设置邮件标题
            Jmail.Subject = Subject;

            //邮件添加附件（多附件的话，可以再加一条Jmail.AddAttachment("c:\test.jpg",true,null);就可以搞定了。
            //注意：为了添加附件，要把上面的Jmail.ContentType="text/html";删掉，否则会在邮件里出现乱码
            string[] FuJian = FuJianList.Split('|');
            for (int kk = 0; kk < FuJian.Length; kk++)
            {
                if (FuJian[kk].Trim().Length > 0)
                {
                    Jmail.AddAttachment(System.Web.HttpContext.Current.Request.MapPath("../UploadFile") + "\\" + FuJian[kk].ToString(), true, null);
                }
            }

            //邮件内容
            Jmail.Body = body + t.ToString();

            //Jmail发送的方法
            Jmail.Send(SMTPServer, false);
            Jmail.Close();
        }
        catch (Exception e)
        {
            System.Web.HttpContext.Current.Response.Write("<script>alert('" + e.Message.ToString() + "');</script>");
        }
    }
}
