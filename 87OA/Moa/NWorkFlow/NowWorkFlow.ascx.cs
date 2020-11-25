using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Moa_NWorkFlow_NowWorkFlow : System.Web.UI.UserControl
{
    public List<ERPNWorkToDo> EmailList = new List<ERPNWorkToDo>();
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
        ERPNWorkToDo MyLanEmail = new ERPNWorkToDo();
        var T = context.ERPNWorkToDo.Where(p => p.StateNow == "正在办理" && p.ShenPiUserList.Contains(ZWL.Common.PublicMethod.GetSessionValue("UserName"))).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
}