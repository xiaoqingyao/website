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

public partial class admin_Mag_udpwd : System.Web.UI.Page
{
    DxxBlog.BLL.B_Admin dal = new DxxBlog.BLL.B_Admin();
    DxxBlog.Model.B_Admin model = new DxxBlog.Model.B_Admin();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void ClearData()
    {
        this.txtUserLogPwd.Value = "";
        this.txtUserLogPwdNew.Value = "";
        this.txtUserLogPwdNewSec.Value = "";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.txtUserLogPwd.Value.ToString() != "")
        {
            DataTable dt = dal.GetList(" Id=" + Session["AdminNo"].ToString()).Tables[0];
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["LogPwd"].ToString() == this.txtUserLogPwd.Value)
                {
                    model.LogPwd = this.txtUserLogPwdNewSec.Value;

                    try
                    {
                        model.Id = Int32.Parse(Session["AdminNo"].ToString());
                        dal.Update(model);
                        Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('修改成功!');</script>");
                        ClearData();
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('修改失败!');</script>");
                        ClearData();
                    }
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('密码错误!');</script>");
                    ClearData();
                }
            }

        }
    }
}
