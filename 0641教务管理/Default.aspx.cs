using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Drawing.Imaging;
using System.Drawing;
public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }


    protected void btnlogin_Click(object sender, EventArgs e)
    {

        if (txtCode.Text.Trim() != Session["vnum"].ToString())
        {
            Response.Write("<script>alert('验证码错误');location='Default.aspx'</script>");
        }
        else
        {
            if (this.power.SelectedValue == "学生")
            {
                if (baseClass.CheckStudent(txtNum.Text.Trim(), txtPwd.Text.Trim()))
                {
                    Session["student"] = txtNum.Text.Trim();
                    Response.Redirect("student/student_index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('您不是学生或者用户名和密码错误');location='Default.aspx'</script>");
                }
            }
            if (this.power.SelectedValue == "教师")
            {
                if (baseClass.CheckTeacher(txtNum.Text.Trim(), txtPwd.Text.Trim()))
                {
                    Session["teacher"] = txtNum.Text;
                    Response.Redirect("teacher/teacher_index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('您不是教师或者用户名和密码错误');location='Default.aspx'</script>");
                }
            }
            if (this.power.SelectedValue == "管理员")
            {
                if (baseClass.CheckAdmin(txtNum.Text.Trim(), txtPwd.Text.Trim()))
                {
                    Session["admin"] = txtNum.Text;
                    Response.Redirect("admin/admin_index.aspx");
                }
                else
                {
                    Response.Write("<script>alert('您不是管理员或者用户名和密码错误');location='Default.aspx'</script>");
                }

            }
        }
    }
 
    protected void btnconcel_Click(object sender, EventArgs e)
    {
        RegisterStartupScript("提示", "<script>window.close();</script>");
    }
}
