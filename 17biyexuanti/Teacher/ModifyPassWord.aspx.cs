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

public partial class Teacher_ModifyPassWord : System.Web.UI.Page
{
    TeacherManage teacherManage = new TeacherManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Teacher teacher = (Teacher)Session["teacher"];
            if (teacher == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Teacher teacher = (Teacher)Session["teacher"];
        if (teacher.TeacherPass == txtOldPassWord.Text.Trim())
        {
            string password = txtNewPassWord.Text.Trim();
            int num = teacherManage.ModifiyPassWord(password,teacher.TEID);
            if (num > 0)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码修改成功！');</script>");
            }
            else
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('密码修改失败！');</script>");
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('原始密码输入错误！');</script>");
        }
    }
    protected void btnEsc_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherMessage.aspx");
    }
}
