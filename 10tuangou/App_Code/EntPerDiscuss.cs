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
/// EntPerDiscuss 的摘要说明
/// </summary>
public class EntPerDiscuss
{
    private string strgDdiscussId;
    private string strgatherId;
    private string strperName;
    private string strdiscussContent;
    private string strdisDateTime;
    private string noteId;
   
	public EntPerDiscuss()
	{
	}

    public string gDiscussId
    {
        get
        {
            return strgDdiscussId;
        }
        set
        {
            strgDdiscussId = value;
        }
    }
    public string gatherId
    {
        get
        {
            return strgatherId;
        }
        set
        {
            strgatherId = value;
        }
    }
    public string perName
    {
        get
        {
            return strperName;
        }
        set
        {
            strperName = value;
        }
    }
    public string discussContent
    {
        get
        {
            return strdiscussContent;
        }
        set
        {
            strdiscussContent = value;
        }
    }
    public string disDateTime
    {
        get
        {
            return strdisDateTime;
        }
        set
        {
            strdisDateTime = value;
        }
    }  
}
