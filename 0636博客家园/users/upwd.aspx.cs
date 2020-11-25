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

public partial class users_upwd : System.Web.UI.Page
{
    DxxBlog.BLL.B_Users dal = new DxxBlog.BLL.B_Users();
    DxxBlog.Model.B_Users model = new DxxBlog.Model.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void ClearData()
    {
        this.txtUserLogPwd.Value = "";
        this.txtUserLogPwdNew.Value = "";
        this.txtUserLogPwdNewSec.Value = "";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (this.txtUserLogPwd.Value.ToString() != "")
        {
            DataTable dt = dal.GetList(" Id=" + Session["userid"].ToString()).Tables[0];
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["LogPwd"].ToString() == this.txtUserLogPwd.Value)
                {
                    model.LogPwd = this.txtUserLogPwdNewSec.Value;

                    try
                    {
                        model.Id = Int32.Parse(Session["userid"].ToString());
                        dal.Update(model);
                        Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作成功!');</script>");
                        ClearData();
                    }
                    catch (Exception ex)
                    {
                        Page.ClientScript.RegisterStartupScript(GetType(), "", "<script language=\"javascript\">alert('操作失败!');</script>");
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
