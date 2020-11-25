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
/// EntMark 的摘要说明
/// </summary>
public class EntMark
{
	
      private string markId;
    private string markName;
    private string markStart;
    private string markEnd;
    private string markPhoto;

    public EntMark()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public string MarkId
    {
        get
        {
            return markId;
        }
        set
        {
            markId = value;
        }
    }
    public string MarkName
    {
        get
        {
            return markName;
        }
        set
        {
            markName = value;
        }
    }
    public string MarkStart
    {
        get
        {
            return markStart;
        }
        set
        {
            markStart = value;
        }
    }
    public string MarkEnd
    {
        get
        {
            return markEnd;
        }
        set
        {
            markEnd = value;
        }
    }
    public string MarkPhoto
    {
        get
        {
            return markPhoto;
        }
        set
        {
            markPhoto = value;
        }
    }
    
}
