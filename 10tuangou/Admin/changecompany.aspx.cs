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

public partial class Admin_changecompany : System.Web.UI.Page
{
    CtlCompany cc = new CtlCompany();
    EntCompany ec = new EntCompany();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ec.CompanyID = System.Convert.ToString(Request["cid"]);
            DataTable dt = new DataTable();
            dt = cc.RunTable(ec);
            this.txtCompanyName.Text = System.Convert.ToString(dt.Rows[0][4]);
            this.txtContactMan.Text = System.Convert.ToString(dt.Rows[0][1]);
            this.txtAddress.Text = System.Convert.ToString(dt.Rows[0][3]);
            this.txtPhone.Text = System.Convert.ToString(dt.Rows[0][2]);
            ibtnOk.Attributes.Add("onclick", "return confirm('确定要修改吗？');");
        }

    }
    protected void ibtnOk_Click(object sender, ImageClickEventArgs e)
    {
        ec.CompanyID = System.Convert.ToString(Request["cid"]);
        ec.ConpanName = this.txtCompanyName.Text;
        ec.ContactMan = this.txtContactMan.Text;
        ec.Phone = this.txtPhone.Text;
        ec.Address = this.txtAddress.Text;
        if (cc.UpdateCompany(ec))
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>alert('修改成功');window.returnValue=true;window.close();</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>alert('修改失败');window.returnValue=false;window.close();</script>");
        }
    }
    protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script>window.close()</script>");
    }
}
