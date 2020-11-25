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
/// EntModule 的摘要说明
/// </summary>
public class EntModule
{
	
    private string moduleId;
    private string moduleName;
    private string moduleDesc;
    private string startDate;
    private string moduleCode;
   
    public EntModule()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
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
    public string ModuleName
    {
        get
        {
            return moduleName;
        }
        set
        {
            moduleName = value;
        }
    }
    public string ModuleDesc
    {
        get
        {
            return moduleDesc;
        }
        set
        {
            moduleDesc = value;
        }
    }
    public string StartDate
    {
        get
        {
            return startDate;
        }
        set
        {
            startDate = value;
        }
    }
    public string ModuleCode
    {
        get
        {
            return moduleCode;
        }
        set
        {
            moduleCode = value;
        }
    }
}
