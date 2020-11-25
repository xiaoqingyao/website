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

public partial class UpdatePassword : System.Web.UI.Page
{
    Common com = new Common();
    EntPersonal obj = new EntPersonal();
    CtlPersonal ctl = new CtlPersonal();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.lblPerName.Text = Session["perName"].ToString();
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        try
        {
            string perName = this.lblPerName.Text;
            DataTable dt = new DataTable();
            dt = ctl.selectPersonal(perName);
            obj.perName = this.lblPerName.Text;
            obj.password = this.txtPassword.Text;
            if (dt.Rows[0][1].ToString() == this.txtOldPassword.Text)
            {
                if (ctl.updatePassword(obj))
                {
                    com.Alert("修改成功");
                }
                else
                {
                    com.Alert("修改失败");
                }
            }
            else
            {
                com.Alert("原密码不正确");
            }
        }
        catch (Exception ex)
        {

        }

    }

}
