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
/// THClaass 的摘要说明
/// </summary>
public class THClaass
{
	public THClaass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public String HtmlEncode(String str)//转化成Html编码
    {
        str = str.Replace(">", "&gt");
        str = str.Replace("<", "&lt");
        char ch;
        ch = (char)32;
        str = str.Replace(ch.ToString(), "&nbsp;");
        ch = (char)34;
        str=str.Replace(ch.ToString(),"&quot;");
        ch=(char)39;
        str=str.Replace(ch.ToString(),"&#39;");
        ch=(char)13;
        str=str.Replace(ch.ToString(),"");
        ch=(char)10;
        str=str.Replace(ch.ToString(),"<br>");
        return str;
    }

    public String HtmlToStringEncode(String str)//Html编码反转化
    {
        str = str.Replace("&gt", ">");
        str = str.Replace("&lt", "<");
        char ch;
        ch = (char)32;
        str = str.Replace( "&nbsp;",ch.ToString());
        ch = (char)34;
        str = str.Replace("&quot;",ch.ToString());
        ch = (char)39;
        str = str.Replace("&#39;",ch.ToString());
        ch = (char)13;
        //str = str.Replace("",ch.ToString());
        ch = (char)10;
        str = str.Replace( "<br>",ch.ToString());
        return str;
    }
}
