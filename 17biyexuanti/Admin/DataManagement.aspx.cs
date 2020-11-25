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

public partial class Admin_DataManagement : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    TeacherManage teacherManage = new TeacherManage();
    AdminManage adminManage = new AdminManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            Admin admin = (Admin)Session["admin"];
            if (admin == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                DropDownList1.DataSourceID = null;
                DropDownList1.DataSource = UserRoleManage.GetUserRole();
                DropDownList1.DataBind();
                Bind();
            }
            
        }
        string UserRole = DropDownList1.SelectedItem.Text.Trim();
        Button3.Attributes.Add("onclick", "return confirm('您是要添加【--" + UserRole + "--】表的数据吗？');");
       
    }
    public void Bind()
    {
        string UserRole = DropDownList1.SelectedItem.Text.Trim();
        if (UserRole == "学生")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
        }
        if (UserRole == "教师")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Panel3.Visible = false;
        }
        if (UserRole == "管理员")
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = true;
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind();
    }
    protected void BtnOk_Click(object sender, EventArgs e)
    {
        string studentId = TextBox1.Text.Trim();
        string studentName = TextBox2.Text.Trim();
        string studentClass = TextBox3.Text.Trim();
        Student student = studentManage.GetStudentByStudentID(studentId);
        int roleID = Convert.ToInt32(DropDownList1.SelectedItem.Value.Trim());
        if (student.StudentName =="")
        {           
            int num = studentManage.AddStudent(studentId, studentName, studentClass, roleID);
            if (num > 0)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你添加的学号已存在！');</script>");
        }

    }
    protected void BtnReSet_Click(object sender, EventArgs e)
    {
        TextBox1.Text="";
        TextBox2.Text="";
        TextBox3.Text="";
    }
    protected void btnsubmint_Click(object sender, EventArgs e)
    {
        string teacherId = TextBox4.Text.Trim();
        string teacherName = TextBox5.Text.Trim();
        int roleID = Convert.ToInt32(DropDownList1.SelectedItem.Value.Trim());
        Teacher teacher = teacherManage.GetTeacherByTeacherId(teacherId);
        if (teacher.TeacherName == "")
        {
            int num = teacherManage.AddTeacher(teacherId, teacherName, roleID);
            if (num > 0)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你添加的教师号已存在！');</script>");
        }
    }
    protected void btnesc_Click(object sender, EventArgs e)
    {
        TextBox4.Text="";
        TextBox5.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string loginId = TextBox6.Text.Trim();
        int roleID = Convert.ToInt32(DropDownList1.SelectedItem.Value.Trim());
        Admin admin = adminManage.GetAdminById(loginId);
        if (admin.LoginId == "")
        {
            int num = adminManage.AddAdmin(loginId, roleID);
            if (num > 0)
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你添加的管理员帐户号已存在！');</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox6.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
         int roleID = Convert.ToInt32(DropDownList1.SelectedItem.Value.Trim());
        string roleName=DropDownList1.SelectedItem.Text.Trim();
        string source = this.FileUpload1.PostedFile.FileName;
        string getextend = System.IO.Path.GetExtension(source);
        if (source == String.Empty || getextend != ".xls")
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请选择Excel文件！');</script>");
            return;
        }
        else
        {
            if (roleName == "管理员")
            {
                int num = adminManage.AddAdmins(source, roleID);
                if (num > 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！原因可能为:您添加的用户已存在');</script>");
                }
            }
            else if (roleName == "学生")
            {
                int num = studentManage.addStudents(source, roleID);
                if (num > 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！原因可能为:您添加的用户已存在');</script>");
                }
            }
            else if (roleName == "教师")
            {
                int num = teacherManage.AddTeacher(source, roleID);
                if (num > 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加成功！');</script>");
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('添加失败！原因可能为:您添加的用户已存在');</script>");
                }
            }
        }


    }
}
