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

public partial class Teacher_TeacherMessage : System.Web.UI.Page
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
                Teacher te = teacherManage.GetTeacherByTeacherId(teacher.TeacherID);
                lbNum.Text = te.TeacherID;
                lbName.Text = te.TeacherName;
                lbEmail.Text = te.TeacherMail;
                lbAddress.Text = te.TeacherAddress;
                lbPhone.Text = te.TeacherPhone;
            }
        }
    }
}
