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

public partial class Student_ModifyPassWord : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student student = (Student)Session["student"];
            if (student == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Student student = (Student)Session["student"];
            if (student.StudentPass == txtOldPassWord.Text.Trim())
            {
                string password = txtNewPassWord.Text.Trim();
                int num = studentManage.ModifiyStuPass(password,student.StudentID);
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
    }
    protected void btnEsc_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentMessage.aspx");
    }
}
