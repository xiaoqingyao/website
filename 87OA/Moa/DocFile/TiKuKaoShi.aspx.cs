
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

public partial class DocFile_TiKuKaoShi : System.Web.UI.Page
{
    public List<ERPTiKuKaoShi> EmailList = new List<ERPTiKuKaoShi>();
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
        ZWL.BLL.ERPTiKuKaoShi MyLanEmail = new ZWL.BLL.ERPTiKuKaoShi();
        var T = context.ERPTiKuKaoShi.Where(p => p.UserName == ZWL.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
	}
	
}
