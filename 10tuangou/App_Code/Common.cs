using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;

/// <summary>
/// Common 的摘要说明
/// </summary>
public class Common
{
	public Common()
	{
	}
    //弹出窗口小信息
    public void Alert(string AlertStr)
    {
        string Alert = "";
        Alert = "<script language='javascript'>alert('" + AlertStr + "')</script>";
        HttpContext.Current.Response.Write(Alert);
    }

    //弹出提示并跳转
    public void AlertAndRedirect(string Message, string RedirectUrl)
    {
        string js = "";
        js = "<script language='javascript'>alert('{0}');window.location.replace('{1}')</script>";
        HttpContext.Current.Response.Write(string.Format(js, Message, RedirectUrl));

    }
    //弹出新页面
    public void AlertNewWebForm(string url, int width, int heigth, int top, int left)
    {
        string js = @"<Script language='JavaScript'>window.open('" + url + @"','','height=" + heigth + ",width=" + width + ",top=" + top + ",left=" + left + ",location=no,menubar=no,resizable=yes,scrollbars=yes,status=yes,titlebar=no,toolbar=no,directories=no');</Script>";

        HttpContext.Current.Response.Write(js);
    }
    public string StringToMD5(string password)
    {
        Byte[] by = Encoding.Default.GetBytes(password);
        Byte[] by1 = MD5.Create().ComputeHash(by);
        string len = BitConverter.ToString(by1).Replace("-", "");
        return len;
    }
}
