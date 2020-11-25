using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// MessageBox 的摘要说明
/// </summary>
public class MessageBox
{
	public MessageBox()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static void Show(string strtext)
    {
        HttpContext.Current.Response.Write("<script language='javascript'>alert('" + strtext + "');</script>");
    }
}
