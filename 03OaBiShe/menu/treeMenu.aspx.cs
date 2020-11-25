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

public partial class menu_treeViewMenu : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        if (TreeView1.SelectedValue == "注销用户")
        {
            bc.ExecSQL("update sysUser set sign=0 where userName='" + Session["loginName"].ToString() + "'");
            Session["loginName"] = "";
            Response.Write("<script language=javascript>parent.location='../index.aspx'</script>");
        }
    }
}
