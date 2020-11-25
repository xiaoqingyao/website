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
/// EntPerGather 的摘要说明
/// </summary>
public class EntPerGather
{
	public EntPerGather()
	{
	}
    private string strpGahterId;
    private string strgTypeId;
    private string strperName;
    private string strtitle;
    private string strgatherDesc;
    private string strgatherTime;

    public string pGatherId
    {
        get
        {
            return strpGahterId;
        }
        set
        {
            strpGahterId = value;
        }
    }
    public string gTypeId
    {
        get
        {
            return strgTypeId;
        }
        set
        {
            strgTypeId = value;
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
    public string title
    {
        get
        {
            return strtitle;
        }
        set
        {
            strtitle = value;
        }
    }
    public string gatherDesc
    {
        get
        {
            return strgatherDesc;
        }
        set
        {
            strgatherDesc = value;
        }
    }
    public string gatherTime
    {
        get
        {
            return strgatherTime;
        }
        set
        {
            strgatherTime = value;
        }
    }

}
