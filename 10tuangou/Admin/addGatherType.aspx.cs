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

public partial class Admin_addGatherType : System.Web.UI.Page
{
    CtlGather cg = new CtlGather();
    EntGather eg = new EntGather();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibtnok_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtTypeName.Text.Length == 0)
        {
            if (!this.IsStartupScriptRegistered("Startup"))
                this.RegisterStartupScript("Startup", "<script language=javascript>alert('类别不能为空！');</script>");
            return;

        }
        else
        {
            String tname = this.txtTypeName.Text.Trim();
            if (cg.CheckTypeName(tname))
            {
                if (cg.InsertType(tname))
                {
                    if (!this.IsStartupScriptRegistered("Startup"))
                        this.RegisterStartupScript("Startup", "<script language=javascript>alert('成功添加');window.returnValue=true;window.close();</script>");
                }
                else
                {
                    if (!this.IsStartupScriptRegistered("Startup"))
                        this.RegisterStartupScript("Startup", "<script language=javascript>alert('添加失败');window.returnValue=true;window.close();</script>");
                }

            }
            else
            {
                if (!this.IsStartupScriptRegistered("Startup"))
                    this.txtTypeName.Text = "";
                this.RegisterStartupScript("Startup", "<script language=javascript>alert('该类别已存在,请重新输入！');</script>");
            }

        }
    }
    protected void ibtncancel_Click(object sender, ImageClickEventArgs e)
    {
        this.Page.RegisterClientScriptBlock("关闭窗口", "<script>window.close()</script>");
    }
}
