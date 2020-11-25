using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

    public class JavaScriptHelper
    {
        /// <summary>
        /// ����JavaScriptС����
        /// </summary>
        /// <param name="strMessage">��ʾ��Ϣ</param>
        public static void Alert(string strMessage)
        {
            System.Web.HttpContext.Current.Response.Write("<script language=\"javascript\">alert(\"" + strMessage + "\");</script>");
        }

        /// <summary>
        /// ����JavaScriptС����
        /// </summary>
        /// <param name="strMessage">��ʾ��Ϣ</param>
        public static void Alert(string strMessage, Page page)
        {
            string key = "";
            string strScript = "<script language=\"javascript\">alert(\"" + strMessage + "\");</script>";
            ClientScriptManager cs = page.ClientScript;
            Type type = page.GetType();
            if (!cs.IsStartupScriptRegistered(key))
            {
                cs.RegisterStartupScript(type, key, strScript);
            }
        }

        /// <summary>
        /// ����JavaScriptС���ڲ����¶����µ�URL
        /// </summary>
        /// <param name="strMessage">��ʾ��Ϣ</param>
        /// <param name="strRedirectUrl">��URL</param>
        public static void AlertAndRedirect(string strMessage, string strRedirectUrl)
        {
            System.Web.HttpContext.Current.Response.Write(String.Format("<script language=\"javascript\">alert(\"{0}\");window.location.replace(\"{1}\")</script>", strMessage, strRedirectUrl));
        }

        /// <summary>
        /// ����JavaScriptС���ڲ����¶����µ�URL
        /// </summary>
        /// <param name="strMessage">��ʾ��Ϣ</param>
        /// <param name="strRedirectUrl">��URL</param>
        public static void AlertAndRedirect(string strMessage, string strRedirectUrl, Page page)
        {
            string key = "";
            string strScript = String.Format("<script language=\"javascript\">alert(\"{0}\");window.location.replace(\"{1}\")</script>", strMessage, strRedirectUrl);
            ClientScriptManager cs = page.ClientScript;
            Type type = page.GetType();
            if (!cs.IsStartupScriptRegistered(key))
            {
                cs.RegisterStartupScript(type, key, strScript);
            }
        }

        /// <summary>
        /// ���¶����µ�ҳ��
        /// </summary>
        /// <param name="strRedirectUrl">��ҳ���URL</param>
        public static void Redirect(string strRedirectUrl)
        {
            System.Web.HttpContext.Current.Response.Write("<script language=\"javascript\">window.location.href=\"" + strRedirectUrl + "\";</script>");
        }

        /// <summary>
        /// ���ݶԻ����ض��嵽ָ����ҳ����
        /// </summary>
        /// <param name="strMsg">��Ϣ�Ի���</param>
        /// <param name="TrueUrl">���ѡ��[��]��ָ���ҳ���ַ</param>
        /// <param name="FalseUrl">���ѡ��[��]��ָ���ҳ���ַ</param>
        public static void ConfirmGoTo(string strMsg, string TrueUrl, string FalseUrl)
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT language=\"javascript\">");
            System.Web.HttpContext.Current.Response.Write("if (confirm(\"" + strMsg + "\"))");
            System.Web.HttpContext.Current.Response.Write("{window.location='" + TrueUrl + "';}");
            System.Web.HttpContext.Current.Response.Write("else");
            System.Web.HttpContext.Current.Response.Write("{window.location='" + FalseUrl + "';}");
            System.Web.HttpContext.Current.Response.Write("</SCRIPT>");
        }

        /// <summary>
        /// ���ݶԻ����ض��嵽ָ����ҳ����
        /// </summary>
        /// <param name="strMsg">��Ϣ�Ի���</param>
        /// <param name="TrueUrl">���ѡ��[��]��ָ���ҳ���ַ</param>
        /// <param name="FalseUrl">���ѡ��[��]��ָ���ҳ���ַ</param>
        public static void ConfirmGoTo(string strMsg, string TrueUrl, string FalseUrl, Page page)
        {
            string key = "";
            string strScript = "<SCRIPT language=\"javascript\">";
            strScript += "if (confirm(\"" + strMsg + "\"))";
            strScript += "{window.location='" + TrueUrl + "';}";
            strScript += "else";
            strScript += "{window.location='" + FalseUrl + "';}";
            strScript += "</SCRIPT>";
            ClientScriptManager cs = page.ClientScript;
            Type type = page.GetType();
            if (!cs.IsStartupScriptRegistered(key))
            {
                cs.RegisterStartupScript(type, key, strScript);
            }
        }
        /// <summary>
        /// �ص���ʷҳ��
        /// </summary>
        /// <param name="iValue">-1/1</param>
        public static void GoHistory(int iValue)
        {
            System.Web.HttpContext.Current.Response.Write(String.Format("<script language=\"JavaScript\">history.go({0});</script>", iValue));
        }

        /// <summary>
        /// �رյ�ǰ����
        /// </summary>
        public static void CloseWindow()
        {
            System.Web.HttpContext.Current.Response.Write("<script language=\"JavaScript\">parent.opener=null;window.close();</script>");
            System.Web.HttpContext.Current.Response.End();
        }

        /// <summary>
        /// ˢ�¸�����
        /// </summary>
        public static void RefreshParent(string url)
        {
            System.Web.HttpContext.Current.Response.Write("<Script language='JavaScript'>window.opener.location.href='" + url + "';window.close();</Script>");
        }

        /// <summary>
        /// ����ֵ
        /// </summary>
        public static void ReturnValue(string bl)
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT language=\"javascript\">");
            System.Web.HttpContext.Current.Response.Write("window.returnValue='" + bl + "';");
            System.Web.HttpContext.Current.Response.Write("</SCRIPT>");
        }

        /// <summary>
        /// ˢ�¸�����Dialog
        /// </summary>
        public static void RefreshDialogParent()
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT language=\"javascript\">");
            System.Web.HttpContext.Current.Response.Write("var args = window.dialogArguments;");
            System.Web.HttpContext.Current.Response.Write("args.location.reload();");
            System.Web.HttpContext.Current.Response.Write("</SCRIPT>");
        }

        public static string FormatStringToHTML(string strText)
        {
            strText = strText.Replace("\n", "<br/>");
            strText = strText.Replace("<", "&lt;");
            strText = strText.Replace(">", "&gt;");
            strText = strText.Replace(" ", "&nbsp;&nbsp;");

            return strText;
        }

        public static string FormatStringToCHAR(string strText)
        {
            strText = strText.Replace("&nbsp;&nbsp;", " ");
            strText = strText.Replace("&lt;", "<");
            strText = strText.Replace("&gt;", ">");
            strText = strText.Replace("<br/>", "\n");

            return strText;
        }
    }
