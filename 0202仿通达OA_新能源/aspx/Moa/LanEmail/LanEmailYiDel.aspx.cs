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

namespace OA.aspx.Moa.LanEmail{ 
 public partial class LanEmailYiDel: System.Web.UI.Page
{
    public List<ERPLanEmail> EmailList = new List<ERPLanEmail>();
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
        FTD.BLL.ERPLanEmail MyLanEmail = new FTD.BLL.ERPLanEmail();
        var T = context.ERPLanEmail.Where(p => p.ToUser == FTD.Unit.PublicMethod.GetSessionValue("UserName") && p.EmailState == "删除").OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }


}}