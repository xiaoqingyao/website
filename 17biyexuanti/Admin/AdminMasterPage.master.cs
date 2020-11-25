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
    StudentManage studentManage = new StudentManage();
    TitleManage titleManage = new TitleManage();
    ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        int studentTotalNum = studentManage.GetStudentCount();
        int titleNum = titleManage.GetTitleCount();
        int titleCountSum = titleManage.GetTitleCountsSum();
        int hasChooseTitleStuNum = studentManage.GetHasChooseTitleNum();
        int upLoadThesisStuNum = thesisManage.GetThesisCount();
        Label3.Text = studentTotalNum.ToString();
        Label5.Text = titleNum.ToString();
        Label9.Text = titleCountSum.ToString();
        Label7.Text = hasChooseTitleStuNum.ToString();
        Label11.Text = upLoadThesisStuNum.ToString();
        int num = messageManage.GetAdminMesList("未读").Count;
        if (num > 0)
        {
            Label1.Visible = true;
            Label1.Text = "你有【" + num.ToString() + "】条未读消息请注意查看！";
        }
    }
}
