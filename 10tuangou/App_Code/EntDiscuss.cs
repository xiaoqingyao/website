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
/// EntDiscuss 的摘要说明
/// </summary>
public class EntDiscuss
{
    private string fDiscussId;
    private string noteId;
    private string discussContent;
    private string perName;
    private string disDateTime;
	public EntDiscuss()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}




    public string FDiscussId
    {
        get
        {
            return fDiscussId;
        }
        set
        {
            fDiscussId = value;
        }
    }
    public string NoteId
    {
        get
        {
            return noteId;
        }
        set
        {
            noteId = value;
        }
    }
    public string DiscussContent
    {
        get
        {
            return discussContent;
        }
        set
        {
            discussContent = value;
        }
    }
    public string PerName
    {
        get
        {
            return perName;
        }
        set
        {
            perName = value;
        }
    }
    public string DisDateTime
    {
        get
        {
            return disDateTime;
        }
        set
        {
            disDateTime = value;
        }
    }
}
