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

namespace OA.aspx.Moa.Subaltern{ 
 public partial class SubRiZhi: System.Web.UI.Page
{
    public List<ERPWorkRiZhi> EmailList = new List<ERPWorkRiZhi>();
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
        string XiaShuUser = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 XiaShuUser from ERPUser where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'");
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPWorkRiZhi MyModel = new FTD.BLL.ERPWorkRiZhi();
        var T = context.ERPWorkRiZhi.Where(p => p.ID > 0);
        if (XiaShuUser != "全部")
        {
            string[] res = XiaShuUser.Split(',');
            T = T.Where(p=>res.Contains(p.UserName)).OrderByDescending(p => p.ID);
        }
        EmailList = T.ToList();
    }
    
}}