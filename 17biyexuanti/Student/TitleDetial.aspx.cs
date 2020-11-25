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

public partial class Student_TitleDetial : System.Web.UI.Page
{
    TitleManage titleManage = new TitleManage();
    StudentManage studentManage = new StudentManage();
    public int TID
    {
        get { return (int)ViewState["TID"]; }
        set { ViewState["TID"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student student = (Student)Session["student"];
            if (student == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                TID = Convert.ToInt32(Request.QueryString["TID"]);
                ThesisManage.Model.Title title = titleManage.GetTilteByTitleId(TID);
                Label6.Text = title.Teacher.TeacherName;
                Label2.Text = "教师:[" + title.Teacher.TeacherName + "]";
                Label1.Text = title.TitleName;
                Label8.Text = title.Description;
                Label3.Text = title.Counts.ToString();
                Label4.Text = title.HasChooseNum.ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String studentId = ((Student)Session["student"]).StudentID;
        int studentState = ((Student)Session["student"]).SudentState;
        if (studentState == 0)
        {
            int TitleId = TID;
            int num = studentManage.ModifiyStuSate(1, TitleId, studentId);
            if (num > 0)
            {
                int num1 = titleManage.ModifiyTitleHasChooseNum(TitleId);
                if (num1 > 0)
                {

                    Student student = studentManage.GetStudentByStudentID(studentId);
                    Session.Remove("student");
                    Session["student"] = student;                    
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('选题成功！');window.location.href='StudentMessage.aspx';</script>");
                }
            }
            else
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('选题失败！');</script>");
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你已选题，请别重选！');</script>");
        }
    }
}
