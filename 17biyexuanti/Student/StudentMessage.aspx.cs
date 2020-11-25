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


public partial class Student_StudentMessage : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Button1.Attributes.Add("onclick", "return confirm('您确认要退选该论题吗?');");
            Student stu = (Student)Session["student"];
            if (stu == null)
            {
                Response.Redirect("~/DoLogin.aspx");
            }
            else
            {
                string studentId = ((Student)Session["student"]).StudentID;
                Student student = studentManage.GetStudentByStudentID(studentId);
                lbNum.Text = student.StudentID;
                lbName.Text = student.StudentName;
                lbAddress.Text = student.StudentAddress;
                lbClass.Text = student.StudentClass;
                lbEmail.Text = student.StudentMail;
                lbPhone.Text = student.StudentPhone;
                int state = student.SudentState;
                if (state == 0)
                {
                    lbTitle.Visible = false;
                    lbTitleName.Visible = false;
                    Button1.Visible = false;
                    lbIsChooseTitle.Text = "否";
                }
                else
                {
                    lbIsChooseTitle.Text = "是";
                    lbTitleName.Text = student.Title.TitleName;
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Student stu = (Student)Session["student"];
        TitleManage titleManage = new TitleManage();
        titleManage.ModifiyTitleChooseNum(stu.Title.TID);
        int num = studentManage.EscTitleByStudentId(stu.SID);
        ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
        int num2=thesisManage.DeleteThesisByStudentId(stu.SID);
        if (num > 0)
        {
            Student student = studentManage.GetStudentBySID(stu.SID);
            Session.Remove("student");
            Session["student"] = student;
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('退选成功！');window.location.href='StudentMessage.aspx';</script>");
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('退选失败！');</script>");
        }
    }
}
