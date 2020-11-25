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

namespace OA.aspx.Moa.NetMail{ 
 public partial class NetMailCao: System.Web.UI.Page
{
    public List<ERPNetEmail> EmailList = new List<ERPNetEmail>();
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
        FTD.BLL.ERPNetEmail MyLanEmail = new FTD.BLL.ERPNetEmail();
        var T = context.ERPNetEmail.Where(p => p.FromUser == FTD.Unit.PublicMethod.GetSessionValue("UserName") && p.EmailState == "草稿").OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }

    protected void iButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("NetEmailAdd.aspx");
    }
}}