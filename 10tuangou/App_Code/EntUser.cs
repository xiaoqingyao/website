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
/// EntUser 的摘要说明
/// </summary>
public class EntUser
{
	public EntUser()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    private string strUserName;
    private string strPassword;
    private string strRoleId;

    public string userName
    {
        get
        {
            return strUserName;
        }
        set
        {
            strUserName = value;
        }
    }
    public string password
    {
        get
        {
            return strPassword;
        }
        set
        {
            strPassword = value;
        }
    }
    public string roleId
    {
        get
        {
            return strRoleId;
        }
        set
        {
            strRoleId = value;
        }
    }
}
