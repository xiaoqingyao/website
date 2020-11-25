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
/// EntNotes 的摘要说明
/// </summary>
public class EntNotes
{
    private string noteId;
    private string moduleId;
    private string noteTitle;
    private string noteContent;
    private string perName;
    private string saveTime;
    private string isTop;
    private string isGood;
    private string typeId;


	public EntNotes()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
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
    public string ModuleId
    {
        get
        {
            return moduleId;
        }
        set
        {
            moduleId = value;
        }
    }
    public string IsTop
    {
        get
        {
            return isTop;
        }
        set
        {
            isTop = value;
        }
    }
    public string IsGood
    {
        get
        {
            return isGood;
        }
        set
        {
            isGood = value;
        }
    }
    public string NoteTitle
    {
        get
        {
            return noteTitle;
        }
        set
        {
            noteTitle = value;
        }
    }
    public string TypeId
    {
        get
        {
            return typeId;
        }
        set
        {
            typeId = value;
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
    public string NoteContent
    {
        get
        {
            return noteContent;
        }
        set
        {
            noteContent = value;
        }

    }
    public string SaveTime
    {
        get
        {
            return saveTime;
        }
        set
        {
            saveTime = value;
        }

    }

}
