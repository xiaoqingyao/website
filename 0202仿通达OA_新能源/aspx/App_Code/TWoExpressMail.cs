using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
///TWoExpressMail 的摘要说明
/// </summary>
public class TWoExpressMail
{
    private string m_FromMail;
    /// <summary>
    /// 邮件发送者
    /// </summary>
    public string FromMail
    {
        get { return m_FromMail; }
        set { m_FromMail = value; }
    }

    private string m_ToMail;
    /// <summary>
    /// 邮件接受者
    /// </summary>
    public string ToMail
    {
        get { return m_ToMail; }
        set { m_ToMail = value; }
    }

    private string m_Subject;
    /// <summary>
    /// 邮件主题
    /// </summary>
    public string Subject
    {
        get { return m_Subject; }
        set { m_Subject = value; }
    }

    private string m_Body;
    /// <summary>
    /// 邮件正文
    /// </summary>
    public string Body
    {
        get { return m_Body; }
        set { m_Body = value; }
    }

    private string m_Poster;
    /// <summary>
    /// 发送者邮箱地址
    /// </summary>
    public string Poster
    {
        get { return m_Poster; }
        set { m_Poster = value; }
    }

    private string m_PosterPWD;
    /// <summary>
    /// 发送者邮箱密码
    /// </summary>
    public string PosterPWD
    {
        get { return m_PosterPWD; }
        set { m_PosterPWD = value; }
    }

    /// <summary>
    /// 构造函数
    /// </summary>
    public TWoExpressMail()
    {
        Random rand = new Random();
        int i = rand.Next(0, 9);
        if (i >= 0 && i <= 9)
        {
            m_FromMail = "huangjiatest" + i.ToString() + "@126.com";
            m_Poster = "huangjiatest" + i.ToString() + "@126.com";
            m_PosterPWD = "huangjialin123";
        }
        else
        {
            m_FromMail = "test123@126.com";
            m_Poster = "test123@126.com";
            m_PosterPWD = "huangjialin";
        }
    }

    /// <summary>
    /// 判断是否允许发送
    /// </summary>
    /// <returns></returns>
    private bool AllowSend()
    {
        //使用正则式匹配邮箱地址--移动号段
        Regex regex1 = new Regex(@"(134|135|136|137|138|139|147|150|151|152|157|158|159|187|188)\d{8}");
        if (regex1.IsMatch(m_ToMail))
        {
            m_ToMail = m_ToMail + "@139.com";
            return true;
        }

        //使用正则式匹配邮箱地址--电信号段
        Regex regex2 = new Regex(@"(133|153|180|189|181)\d{8}");
        if (regex2.IsMatch(m_ToMail))
        {
            m_ToMail = m_ToMail + "@189.cn";
            return true;
        }

        //使用正则式匹配邮箱地址--联通号段
        Regex regex3 = new Regex(@"(130|131|132|155|156|185|186)\d{8}");
        if (regex3.IsMatch(m_ToMail))
        {
            m_ToMail = m_ToMail + "@wo.com.cn";
            return true;
        }

        /*
        // 1、邮件发送者或邮件接受者为空，不允许发送。
        if (String.IsNullOrEmpty(m_FromMail.Trim()) || String.IsNullOrEmpty(m_ToMail.Trim()) || m_ToMail.Trim() == "@139.com")
            return false;

        // 2、检查邮件接受者是否合法，以下情况不合法：
        // 1）邮件接受者不含@符号；
        // 2）邮件接受者非移动用户；
        if (m_ToMail.IndexOf("@") <= 0)
            return false;

        string s10086 = ",134,135,136,137,138,139,147,150,151,152,157,158,159,187,188,";
        string sSubStr = "," + m_ToMail.Substring(0, 3) + ",";
        if (s10086.IndexOf(sSubStr) < 0)
            return false;
        */

        return false;
    }

    /// <summary>
    /// 发送邮件
    /// </summary>
    public void SendMail()
    {
        if (!AllowSend())
            return;
        SmtpClient client = new SmtpClient("smtp.126.com");
        client.UseDefaultCredentials = false;
        client.Credentials = new NetworkCredential(m_Poster, m_PosterPWD);
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        MailMessage message = new MailMessage(m_FromMail, m_ToMail, m_Subject, m_Body);
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        try
        {
            client.Send(message);
            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}