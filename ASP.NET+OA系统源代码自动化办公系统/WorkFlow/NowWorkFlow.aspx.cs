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
public partial class WorkFlow_NowWorkFlow : System.Web.UI.Page
{
    public List<ERPWorkToDo> EmailList = new List<ERPWorkToDo>();
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
        SDLX.BLL.ERPWorkToDo MyLanEmail = new SDLX.BLL.ERPWorkToDo();
        var T = context.ERPWorkToDo.Where(p => p.StateNow == "正在办理" && p.ShenPiRenList.Contains(SDLX.Common.PublicMethod.GetSessionValue("UserName"))).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
   
}