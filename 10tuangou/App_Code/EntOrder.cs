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
/// EntOrder 的摘要说明
/// </summary>
public class EntOrder
{
    private string oid;
    private string gid;
    private string pid;
    private string pname;
    private  string  stotal;
    private string state;
    private string time;
    private string personalInfoid;

	public EntOrder()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string Oid
    {
        get
        {
            return oid;
        }
        set
        {
            oid = value;
        }
    }
    public string Gid
    {
        get
        {
            return gid;
        }
        set
        {
            gid = value;
        }
    }
    public string Pid
    {
        get
        {
            return pid;
        }
        set
        {
            pid = value;
        }
    }
    public string Pname
    {
        get
        {
            return pname;
        }
        set
        {
            pname = value;
        }
    }
    public string Stotal
    {
        get
        {
            return stotal;
        }
        set
        {
            stotal = value;
        }
    }
    public string State
    {
        get
        {
            return state;
        }
        set
        {
            state = value;
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
    public string PersonalInfoid
    {
        get
        {
            return personalInfoid;
        }
        set
        {
            personalInfoid = value;
        }
    }
}
