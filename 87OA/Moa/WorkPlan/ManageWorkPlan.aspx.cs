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
    public List<ERPWorkPlan> EmailList = new List<ERPWorkPlan>();
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
        ZWL.BLL.ERPWorkPlan MyLanEmail = new ZWL.BLL.ERPWorkPlan();
        var T = context.ERPWorkPlan.Where(p => p.UserName == ZWL.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
  
}