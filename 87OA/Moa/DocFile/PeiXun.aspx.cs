
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

public partial class DocFile_PeiXun : System.Web.UI.Page
{
    public List<ERPPeiXun> EmailList = new List<ERPPeiXun>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            DataBindToGridview();

           
        }
    }
	public void DataBindToGridview()
	{
        DataEntityDataContext context = new DataEntityDataContext();
        ZWL.BLL.ERPPeiXun MyLanEmail = new ZWL.BLL.ERPPeiXun();
        var T = context.ERPPeiXun.Where(p => p.ID > 0).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
		
	}
	protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
	{
		Response.Redirect("PeiXunAdd.aspx");
	}
	
}
