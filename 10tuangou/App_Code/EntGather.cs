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
/// EntGather 的摘要说明
/// </summary>
public class EntGather
{
    private string gatherid;
    private string productid;
    private string title;
    private string contant;
    private string typeid;
    private int gprice;
    private int gathernum;
    private int number;
    private int heat;
    private string stime;

	public EntGather()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string GatherId
    {
        get
        {
            return gatherid;
        }
        set
        {
            gatherid = value;
        }
    }
    public string ProductId
    {
        get
        {
            return productid;
        }
        set
        {
            productid = value;
        }
    }
    public string Titel
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
    public string Contant
    {
        get
        {
            return contant;
        }
        set
        {
            contant = value;
        }
    }
    public string TypeId
    {
        get
        {
            return typeid;
        }
        set
        {
            typeid = value;
        }
    }
    public int Price
    {
        get
        {
            return gprice;
        }
        set
        {
            gprice = value;
        }
    }
    public int GatherNum
    {
        get
        {
            return gathernum;
        }
        set
        {
            gathernum = value;
        }
    }
    public int Number
    {
        get
        {
            return number;
        }
        set
        {
            number = value;
        }
    }
    public int Heat
    {
        get
        {
            return heat;
        }
        set
        {
            heat = value;
        }
    }
    public string Time
    {
        get
        {
            return stime;
        }
        set
        {
            stime = value;
        }
    }
}
