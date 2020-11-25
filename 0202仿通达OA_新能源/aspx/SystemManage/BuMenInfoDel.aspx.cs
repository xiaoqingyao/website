using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace OA.aspx.SystemManage{ 
 public partial class BuMenInfoDel: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (FTD.DBUnit.DbHelperSQL.GetSHSLInt("select top 1 ID from ERPBuMen where DirID=" + Request.QueryString["ID"].ToString()) == "0")
        {
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("delete from ERPBuMen where ID=" + Request.QueryString["ID"].ToString());
            FTD.Unit.MessageBox.Show(this, "选定部门已经删除！");
            Response.Redirect("BuMenInfo.aspx?View=" + Request.QueryString["View"].ToString() + "&Type=&DirID=0");
        }
        else
        {            
            FTD.Unit.MessageBox.Show(this, "当前部门下有子部门的存在，请先删除子部门后，再删除当前部门数据！");
            Response.Redirect("BuMenInfo.aspx?View=" + Request.QueryString["View"].ToString() + "&Type=&DirID=0");
        }
    }
}
}