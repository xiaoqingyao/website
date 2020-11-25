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
public partial class Student_UpLoadTitle : System.Web.UI.Page
{
    TitleManage titleManage = new TitleManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Teacher teacher = (Teacher)Session["teacher"];
            if (teacher == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Teacher teacher = (Teacher)Session["teacher"];
                string title = txtTitile.Text;
                string Description = txtDescription.Text;
                int chooseNum =Convert.ToInt32( TextBox1.Text.Trim());
                int num = titleManage.TeacherAddTitle(title, teacher.TEID, Description,chooseNum);
                if (num > 0)
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('提交成功，等待管理员进行审核！');</script>");
                }
                else
                {
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('提交失败！');</script>");
                }
        }
        txtTitile.Text = "";
        txtDescription.Text = "";
        TextBox1.Text = "";
    }
    protected void btnEsc_Click(object sender, EventArgs e)
    {
        txtTitile.Text = "";
        txtDescription.Text = "";
        TextBox1.Text = "";
    }
}
