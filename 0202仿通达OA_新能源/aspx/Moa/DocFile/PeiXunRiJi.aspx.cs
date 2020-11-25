
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
 public partial class PeiXunRiJi: System.Web.UI.Page
{
    public List<ERPPeiXunRiJi> EmailList = new List<ERPPeiXunRiJi>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
           
            DataBindToGridview();

        }
    }
	public void DataBindToGridview()
	{
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPPeiXunRiJi MyLanEmail = new FTD.BLL.ERPPeiXunRiJi();
        var T = context.ERPPeiXunRiJi.Where(p => p.ID > 0).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
		
	}
	}
}