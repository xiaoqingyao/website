
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

namespace OA.aspx.Moa.DocFile{ 
 public partial class XueXiXinDeOK: System.Web.UI.Page
{
    public List<ERPXueXiXinDe> EmailList = new List<ERPXueXiXinDe>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview("");
        }
    }
   
	public void DataBindToGridview(string IDList)
	{

        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPXueXiXinDe MyLanEmail = new FTD.BLL.ERPXueXiXinDe();
        var T = context.ERPXueXiXinDe.Where(p => p.ID > 0 ).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
	}
	
}
}