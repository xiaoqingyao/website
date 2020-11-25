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

public partial class Student_ModifyMessage : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student stu = (Student)Session["student"];
            if (stu == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                string studentId = ((Student)Session["student"]).StudentID;
                Student student = studentManage.GetStudentByStudentID(studentId);
                lbNum.Text = student.StudentID;
                lbName.Text = student.StudentName;
                lbClass.Text = student.StudentClass;
                txtAddress.Text = student.StudentAddress;
                txtEmail.Text = student.StudentMail;
                txtPhone.Text = student.StudentPhone;
                int state = student.SudentState;
                if (state == 0)
                {
                    lbTitle.Visible = false;
                    lbTitleName.Visible = false;
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
    protected void BtnOk_Click(object sender, EventArgs e)
    {
        string StuNum = ((Student)Session["student"]).StudentID;
        string StuPhone = txtPhone.Text;
        string StuEmail = txtEmail.Text;
        string StuAddress = txtAddress.Text;
        int num = studentManage.ModifiyStuByStudentID(StuAddress, StuPhone, StuEmail, StuNum);
        if (num > 0)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改成功！');window.location.href='StudentMessage.aspx';</script>");
        }
        else
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('修改失败！');</script>");
    }
    protected void BtnReSet_Click(object sender, EventArgs e)
    {
        txtAddress.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
    }
}
