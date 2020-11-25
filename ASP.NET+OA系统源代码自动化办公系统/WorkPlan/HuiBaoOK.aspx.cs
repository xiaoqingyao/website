using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class WorkPlan_ManageWorkPlan : System.Web.UI.Page
{
    public List<ERPHuiBao> EmailList = new List<ERPHuiBao>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            DataBindToGridview();
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        SDLX.BLL.ERPHuiBao MyLanEmail = new SDLX.BLL.ERPHuiBao();
        var T = context.ERPHuiBao.Where(p => p.UserName == SDLX.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
   
}