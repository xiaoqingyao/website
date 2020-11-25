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

namespace OA.aspx.Moa.GongGao{ 
 public partial class Vote: System.Web.UI.Page
{
    public List<ERPVote> EmailList = new List<ERPVote>();
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
        FTD.BLL.ERPVote MyLanEmail = new FTD.BLL.ERPVote();
        var T = context.ERPVote.Where(p => p.ID != 0).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }

}}