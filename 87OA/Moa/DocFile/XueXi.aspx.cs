
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

public partial class DocFile_XueXi : System.Web.UI.Page
{
    public List<ERPXueXi> EmailList = new List<ERPXueXi>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview("");

        }
    }
   
	public void DataBindToGridview(string IDList)
	{
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPXueXi MyLanEmail = new ZWL.BLL.ERPXueXi();
        var T = context.ERPXueXi.Where(p => p.ID > 0).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
	}
	
}
