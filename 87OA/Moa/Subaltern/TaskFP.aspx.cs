
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

public partial class Subaltern_TaskFP : System.Web.UI.Page
{
    public List<ERPTaskFP> EmailList = new List<ERPTaskFP>();
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
        ZWL.BLL.ERPTaskFP MyModel = new ZWL.BLL.ERPTaskFP();
        var T = context.ERPTaskFP.Where(p => p.ID > 0);
        if (IDList.Trim().Length > 0)
        {
            T = T.Where(p => p.ToUserList.Contains(',' + ZWL.Common.PublicMethod.GetSessionValue("UserName") + ',') && IDList.Contains(p.ID.ToString())).OrderByDescending(p => p.ID);
        }
        else
        {
            T = T.Where(p => p.FromUser==ZWL.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        }
        EmailList = T.ToList();


    }

}
