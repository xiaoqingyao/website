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
using ThesisManage.Model;
using ThesisManage.BLL;
//using System.Web.UI.MobileControls;
using System.Collections.Generic;

public partial class Teacher_Message : System.Web.UI.Page
{
    MessageManage messageManage = new MessageManage();
    TeacherManage teacherManage = new TeacherManage();
    StudentManage studentManage = new StudentManage();
    AdminManage adminManage = new AdminManage();
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
                bind();
            }
        }
    }
    public void bind()
    {
        Teacher teacher = (Teacher)Session["teacher"];
        GridView1.DataSourceID = null;
        GridView1.DataSource = messageManage.GetTeacherMesList(teacher.TEID, null);
        GridView1.DataBind();
    }
    public string NameBind(object Id, object role)
    {
        int id = Convert.ToInt32(Id);
        string roleName = role.ToString();
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
    public string panduan(object state)
    {
        string mes = null;
        int s = Convert.ToInt32(state);
        if (s == 0 || s == 4)
        {
            mes = "未读";
        }
        else
        {
            mes = "已读";
        }
        return mes;
    }
    public string GetImageUrl(object ID)
    {
        int teid = Convert.ToInt32(ID);
        string imageUrl = string.Empty;
        if (teid % 2 == 0)
            imageUrl = "~/Images/tu1.gif";
        else if (teid % 3 == 0)
            imageUrl = "~/Images/tu2.gif";
        else
            imageUrl = "~/Images/tu3.gif";
        return imageUrl;
    }
    public string cutContents(object c)
    {
        string contents = c.ToString();
        string content = null;
        if (contents.Length > 10)
        {
            content = contents.Substring(0, 10);
            content = content + "...";
        }
        else
            content = contents;
        return content;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //设置行颜色   
            e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ff9900'");
            //添加自定义属性，当鼠标移走时还原该行的背景色   
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            //添加删除确认
            LinkButton btn = (LinkButton)e.Row.FindControl("LinkButton1");
            btn.Attributes.Add("onclick", "return confirm('您确认要删除该消息吗?');");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int MID = Convert.ToInt32(e.CommandArgument);
        int num = messageManage.DeleteMessage(MID);
        if (num < 0)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('操作失败！');</script>");
        }
        bind();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Teacher teacher =(Teacher)Session["teacher"];
        List<Student> list = studentManage.GetStudentWithOenTeacher(teacher.TEID);
        if (list.Count > 0)
        {
            DataList1.Visible = true;
            DataList1.DataSourceID = null;
            DataList1.DataSource = list;
            DataList1.DataBind();
        }
        else
        {
            Label6.Visible = true;
            Label6.Text = "你还没有联系人！";
        }
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton3.Checked)
        {
            TextBox5.Text = "admin";
            TextBox5.Enabled = false;
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        TextBox5.Enabled = true;
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        TextBox5.Enabled = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox5.Text.Trim() == "")
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请填写接受人！');</script>");
            return;
        }
        if (TextBox6.Text.Trim() == "")
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请填写发送的内容！');</script>");
            return;
        }
        if (RadioButton3.Checked==false && RadioButton2.Checked==false && RadioButton1.Checked==false)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请选择用户角色！');</script>");
            return;
        }
        else
        {
            string senderRole = null;
            Teacher teacher = null;
            Student student = null;
            if (RadioButton3.Checked)
            {
                senderRole = "管理员";
            }
            if (RadioButton1.Checked)
            {
                senderRole = "教师";
            }
            if (RadioButton2.Checked)
            {
                senderRole = "学生";
            }
            if (senderRole == "教师")
            {
                teacher = teacherManage.GetTeacherByTeacherId(TextBox5.Text.Trim());
                if (teacher.TeacherName == null || teacher.TeacherName == "")
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你的联系人在系统中不存在！');</script>");
                    return;
                }
            }
            if (senderRole == "学生")
            {
                student = studentManage.GetStudentByStudentID(TextBox5.Text.Trim());
                if (student.StudentName == null || student.StudentName=="")
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你的联系人在系统中不存在！');</script>");
                    return;
                }
            }
            
                Teacher te = (Teacher)Session["teacher"];
                Message message = new Message();
                message.Contents = TextBox6.Text.Trim();
                message.MPubDate = DateTime.Now.ToString();
                message.Sender = te.TEID;
                message.SenderRole = "教师";
                if (senderRole == "学生")
                {
                    message.State = 0;
                    message.Student = student;
                    message.Teacher = null;
                }
                if (senderRole == "教师")
                {
                    message.State = 0;
                    message.Teacher = teacher;
                    message.Student = null;
                }
                if (senderRole == "管理员")
                {
                    message.State = 2;
                    message.Teacher = null;
                    message.Student = null;
                }
                int num = messageManage.AddMessage(message);
                if (num > 0)
                {
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('发送成功！');</script>");
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('发送失败！');</script>");
                }
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox5.Text = "";
        TextBox6.Text = "";
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int n = e.Item.ItemIndex;
        DataList1.Items[n].BackColor = System.Drawing.Color.Red;
        int key = Convert.ToInt32(this.DataList1.DataKeys[n]);
        Session["key"] = key;
        Student student = studentManage.GetStudentBySID(key);
        TextBox5.Text = student.StudentID;
        RadioButton2.Checked = true;
    }
}
