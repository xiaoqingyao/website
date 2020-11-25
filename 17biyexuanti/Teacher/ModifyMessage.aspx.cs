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

public partial class Teacher_ModifyMessage : System.Web.UI.Page
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
            else
            {
                lbNum.Text = teacher.TeacherID;
                lbName.Text = teacher.TeacherName;
                textAddress.Text = teacher.TeacherAddress;
                textEmail.Text = teacher.TeacherMail;
                textphone.Text = teacher.TeacherPhone;
            }
        }
    }
    protected void btnsubmint_Click(object sender, EventArgs e)
    {
        string address = textAddress.Text;
        string email=textEmail.Text;
        string phone=textphone.Text;
        int num = teacherManage.Modifiy(address,email,phone);
        if (num > 0)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功！');window.location.href='TeacherMessage.aspx';</script>");
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改失败！');</script>");
        }
    }
    protected void btnesc_Click(object sender, EventArgs e)
    {
        textAddress.Text = "";
        textEmail.Text = "";
        textphone.Text = "";
    }
}
