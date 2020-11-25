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
using ThesisManage.BLL;
using ThesisManage.Model;
public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    MessageManage messageManage = new MessageManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        Teacher teacher = (Teacher)Session["teacher"];
        int num = messageManage.GetTeacherMesList(teacher.TEID, "未读").Count;
        if (num > 0)
        {
            Label1.Visible = true;
            Label1.Text = "你有【" + num.ToString() + "】条未读消息请注意查看！";
        }
    }
}
