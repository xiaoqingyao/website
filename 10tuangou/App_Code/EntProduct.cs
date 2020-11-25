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
/// EntProduct 的摘要说明
/// </summary>
public class EntProduct
{
    private string companyid;
    private string productname;
    private string pdtypeid;
    private int pdprice;
    private string pdphoto;
    private string stime;
    private string pddesc;
    private string productid;
	public EntProduct()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string CompanyId
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
    public string ProductName
    {
        get
        {
            return productname;
        }
        set
        {
            productname = value;
        }
    }
    public string PdtypeId
    {
        get
        {
            return pdtypeid;
        }
        set
        {
            pdtypeid = value;
        }
    }
    public int Price
    {
        get
        {
            return pdprice;
        }
        set
        {
            pdprice = value;
        }
    }
    public string Photo
    {
        get
        {
            return pdphoto;
        }
        set
        {
            pdphoto = value;
        }
    }
    public string sTime
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
    public string Desc
    {
        get
        {
            return pddesc;
        }
        set
        {
            pddesc = value;
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
}
