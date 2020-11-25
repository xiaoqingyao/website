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

public partial class Teacher_MessageDetial : System.Web.UI.Page
{
    MessageManage messageManage = new MessageManage();
    TeacherManage teacherManage = new TeacherManage();
    StudentManage studentManage = new StudentManage();
    AdminManage adminManage = new AdminManage();
    public Message mes
    {
        get { return (Message)ViewState["mes"]; }
        set { ViewState["mes"] = value; }
    }
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
                int MID = Convert.ToInt32(Request.QueryString["MID"]);
                messageManage.ModifyMessage(MID, 1);
                mes = messageManage.GetMesByMID(MID);
                Label1.Text = mes.SenderRole;
                Label2.Text = NameBind(mes.Sender, mes.SenderRole);
                Label3.Text = mes.Contents;
                Label4.Text = "发送时间:" + mes.MPubDate;
                Label5.Text = NameBind(mes.Sender, mes.SenderRole);
            }
        }
    }
    public string NameBind(int id, string roleName)
    {
        string mes = null;
        if (roleName.Trim() == "教师")
        {
            Teacher teacher = teacherManage.GetTeacherById(id);
            mes = teacher.TeacherName;
        }
        else if (roleName.Trim() == "管理员")
        {
            mes = "管理员";
        }
        else if (roleName.Trim() == "学生")
        {
            Student student = studentManage.GetStudentBySID(id);
            mes = student.StudentName;
        }
        return mes;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Message message = new Message();
            message.MPubDate = DateTime.Now.ToString();
            Teacher teacher = (Teacher)Session["teacher"];
            message.Sender = teacher.TEID;
            message.SenderRole = "教师";
            message.Student = null;
            message.Student = null;
            message.Contents = TextBox1.Text;
            if (mes.SenderRole == "教师")
            {
                Teacher te = teacherManage.GetTeacherById(mes.Sender);
                message.Teacher = te;
                message.Student = null;
                message.State = 0;
            }
            else if (mes.SenderRole == "学生")
            {
                Student stu = studentManage.GetStudentBySID(mes.Sender);
                message.Student = stu;
                message.Teacher = null;
                message.State = 0;
            }
            else
            {
                message.State = 2;
            }
            int num = messageManage.AddMessage(message);
            if (num > 0)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('发送成功！');</script>");
                TextBox1.Text = "";
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('发送失败！');</script>");
            }


        }
    }
}
