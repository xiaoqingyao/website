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

namespace OA.aspx.Moa.WorkPlan{ 
 public partial class HuiBaoOK: System.Web.UI.Page
{
    public List<ERPHuiBao> EmailList = new List<ERPHuiBao>();
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
        FTD.BLL.ERPHuiBao MyLanEmail = new FTD.BLL.ERPHuiBao();
        var T = context.ERPHuiBao.Where(p => p.UserName == FTD.Unit.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
   
}}