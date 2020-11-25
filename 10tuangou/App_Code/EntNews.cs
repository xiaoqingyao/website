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
/// EntNews 的摘要说明
/// </summary>
public class EntNews
{
    private string title;
    private string newscontent;
    private string name;
    private string time;
	public EntNews()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string NewsTitle
    {
        get
        {
            return title;
        }
        set
        {
            title = value;
        }
    }
    public string Content
    {
        get
        {
            return newscontent;
        }
        set
        {
            newscontent = value;
        }
    }
    public string Name
    {
        get
        {
            return name;
        }
        set
        {
            name = value;
        }
    }
    public string Time
    {
        get
        {
            return time;
        }
        set
        {
            time = value;
        }
    }
}
