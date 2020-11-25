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

public partial class Student_ChooseTitle : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    TitleManage titleManage = new TitleManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student student = (Student)Session["student"];
            if (student == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }
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
            Button btn = (Button)e.Row.FindControl("btnChooseTitle");
            btn.Attributes.Add("onclick", "return confirm('您确认要选择该论题吗?');");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String studentId = ((Student)Session["student"]).StudentID;
        int studentState = ((Student)Session["student"]).SudentState;
        if (studentState == 0)
        {
            int TitleId = Convert.ToInt32(e.CommandArgument);
            Title title = titleManage.GetTilteByTitleId(TitleId);
            if (title.HasChooseNum < title.Counts)
            {
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
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('该标题人数已满！');</script>");
            }

        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你已选题，请别重选！');</script>");
        }
       
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
}
