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
/// EntCompany 的摘要说明
/// </summary>
public class EntCompany//添加公司的实体类
{
    private string companyid;
    private string companyname;//公司名字
    private string contactman;//公司的联系人
    private string phone;//公司电话
    private string address;//公司地址
	public EntCompany()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string ConpanName
    {
        get
        {
            return companyname;
        }
        set
        {
            companyname = value;
        }
    }
    public string ContactMan
    {
        get
        {
            return contactman;
        }
        set
        {
            contactman = value;
        }
    }
    public string Phone
    {
        get
        {
            return phone;
        }
        set
        {
            phone = value;
        }
    }
    public string Address
    {
        get
        {
            return address;
        }
        set
        {
            address = value;
        }
    }
    public string CompanyID
    {
        get
        {
            return companyid;
        }
        set
        {
            companyid = value;
        }
    }
}
