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

public partial class checkAttendance_setTime : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool blS = bc.ExecSQL("update signstate set [time]='" + TextBox1.Text + "'where signstateid=1");
        bool blX = bc.ExecSQL("update signstate set [time]='" + TextBox2.Text + "'where signstateid=2");
        if(blS&&blX)
        {
            Response.Write(bc.MessageBox("上下课时间设置成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("上下课时间设置失败！"));
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
