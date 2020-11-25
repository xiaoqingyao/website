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

public partial class LLogin : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    TeacherManage teacherManage = new TeacherManage();
    AdminManage adminManage = new AdminManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlUserRole.DataSourceID = null;
            ddlUserRole.DataSource = UserRoleManage.GetUserRole();
            ddlUserRole.DataBind();
            ddlUserRole.Items.Insert(0, new ListItem("——用户角色——", "-1"));
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String userRole = ddlUserRole.SelectedItem.Text.Trim();
        string loginName =txtName.Text.Trim();
        string password = txtPassWord.Text.Trim();
        if (userRole == "管理员")
        {
            string mes = adminManage.GetAdminById(loginName, password);
            if (mes.Trim() == "成功")
            {
                Admin admin = new Admin();
                admin.LoginId = loginName;
                admin.LoginPass = password;
                Session["admin"] = admin;
                Response.Redirect("Admin/AuditUpLoadTitle.aspx");
            }
            else
            {
                lbmes.Text = mes;
            }
        }
        else if (userRole == "教师")
        {
            string mes = teacherManage.IsValide(loginName, password);
            if (mes.Trim() == "成功")
            {
                Teacher teacher = teacherManage.GetTeacherByTeacherId(loginName);
                Session["teacher"] = teacher;
                Session["TEID"] = teacher.TEID;
                Response.Redirect("Teacher/TeacherMessage.aspx");
            }
            else
            {
                lbmes.Text = mes;
            }
        }
        else if (userRole == "学生")
        {
            string mes = studentManage.StudentLogin(loginName, password);
            if (mes.Trim() == "成功")
            {
                Student student = studentManage.GetStudentByStudentID(loginName);
                Session["student"] = student;
                Response.Redirect("Student/StudentMessage.aspx");
            }
            else
            {
                lbmes.Text = mes;
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请选择用户角色！');</script>");
        }
    }
    protected void btnEsc_Click(object sender, EventArgs e)
    {
        
    }
}
