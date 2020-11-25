using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

/// <summary>
/// StrRegExp 的摘要说明
/// </summary>
public class StrRegExp
{
	public StrRegExp()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static bool IsID(string PostStr)
    {
        string RegStr = @"^[0-9]*[1-9][0-9]*$";
        if (Regex.IsMatch(PostStr, RegStr))
        {
            return true;
           
        }
        else
        {
            return false;
        }

     

    }
}
