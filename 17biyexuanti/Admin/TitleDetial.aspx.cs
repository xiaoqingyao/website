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

public partial class Admin_TitleDetial : System.Web.UI.Page
{
    TitleManage titleManage = new TitleManage();
    TeacherManage teacherManage = new TeacherManage();
    StudentManage studentManage = new StudentManage();
    int tID = 0;
    public int TID
    {
        get { return (int)ViewState["TID"]; }
        set { ViewState["TID"]=value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
                Button1.Attributes.Add("onclick", "return confirm('您确认该标题审核通过吗！');");
                Admin admin = (Admin)Session["admin"];
                if (admin == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    TID = Convert.ToInt32(Request.QueryString["TID"]);
                    ThesisManage.Model.Title title = titleManage.GetTilteByTitleId(TID);
                    if (title.Student == null || title.Student.StudentName == "" || title.Student.StudentName == null)
                    {
                        DataList1.Visible = false;
                        Button3.Visible = false;
                        Label6.Text = title.Teacher.TeacherName;
                        Label2.Text = "教师:[" + title.Teacher.TeacherName + "]";
                    }
                    else
                    {
                        Label2.Text = "学生:[" + title.Student.StudentName + "]";
                    }
                    Label1.Text = title.TitleName;
                    Label8.Text = title.Description;
                    Label3.Text = title.Counts.ToString();

                    if (title.State == 0)
                    {
                        Label4.Text = "未审核";
                    }
                }
            
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int n = e.Item.ItemIndex;
        DataList1.Items[n].BackColor = System.Drawing.Color.Red;
        int key = Convert.ToInt32(this.DataList1.DataKeys[n]);
        Session["key"] = key;
        Teacher teacher = teacherManage.GetTeacherById(key);
        Label6.Text = teacher.TeacherName;
    }
    public string GetImageUrl(object ID)
    {
        int teid =Convert.ToInt32(ID);
        string imageUrl = string.Empty;
        if (teid%2==0)
            imageUrl = "~/Images/tu1.gif";
        else if (teid % 3 == 0)
            imageUrl = "~/Images/tu2.gif";
        else
            imageUrl = "~/Images/tu3.gif";
        return imageUrl;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Admin admin = (Admin)Session["admin"];
        if (Label6.Text == "")
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请给该标题指定一个指导老师！');</script>");
        }
        else
        {
            int num = 0;
            int teacherId=Convert.ToInt32(Session["key"]);
            ThesisManage.Model.Title title = titleManage.GetTilteByTitleId(TID);
            Message message = new Message();
            message.Contents = "你上传的标题为[" + Label1.Text + "]通过管理员的审核！";
            message.MPubDate = DateTime.Now.ToString();
            message.Sender = admin.AID;
            message.SenderRole = "管理员";
            message.State = 0;
            message.Student = null;
            message.Teacher = null;
            if (title.Student == null || title.Student.StudentName == "" || title.Student.StudentName == null)
            {
                num = titleManage.ModifiyTitleState(TID);
                message.Teacher = title.Teacher;
            }
            else
            {
                message.Student = title.Student;
                num = titleManage.ModifiyTitleState(TID, teacherId);
                studentManage.ModifiyStuSate(1, TID,title.Student.StudentID);
            }
            if (num > 0)
            {
                MessageManage manageManage = new MessageManage();
                manageManage.AddMessage(message);
                Response.Redirect("AuditUpLoadTitle.aspx");
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('操作失败！');</script>");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Panel1.Visible == true)
        {
            Panel1.Visible = false;
        }
        else
            Panel1.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (DataList1.Visible == true)
        {
            DataList1.Visible = false;
        }
        else
        {
            DataList1.Visible = true;
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() != "")
        {
            Admin admin = (Admin)Session["admin"];
            int num = titleManage.ModifiyTitleUnState(TID);
            ThesisManage.Model.Title title = titleManage.GetTilteByTitleId(TID);
            Message message = new Message();
            message.Contents = "你上传的标题为[" + Label1.Text + "]未通过管理员的审核！原因是:" + TextBox1.Text;
            message.MPubDate = DateTime.Now.ToString();
            message.Sender = admin.AID;
            message.SenderRole = "管理员";
            message.State = 0;
            message.Student = null;
            message.Teacher = null;
            if (title.Student == null || title.Student.StudentName == "" || title.Student.StudentName == null)
            {
                message.Teacher = title.Teacher;
            }
            else
            {
                message.Student = title.Student;
            }
            if (num > 0)
            {
                MessageManage manageManage = new MessageManage();
                manageManage.AddMessage(message);
                Response.Redirect("AuditUpLoadTitle.aspx");
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('操作失败！');</script>");
            }
        }
        else
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('请注明原因！');</script>");
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }
}
