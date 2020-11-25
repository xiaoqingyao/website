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

public partial class Admin_AdminTest : System.Web.UI.Page
{
    StudentManage studentManage = new StudentManage();
    private string sql;// = "select 学号=Student.StudentID,姓名=StudentName,班级=StudentClass,指导老师=(select TeacherName from Teacher where TEID=(select TeacherId from title,student where STitleID=TID group by TeacherId)),标题名=(select TitleName from Title where TID=STitleID group by TitleName) from Student where 1=1";

    public string Sql
    {
        get { return (string)ViewState["sql"]; }
        set { ViewState["sql"] = value; }
    }

    public string Sql2
    {
        get { return (string)ViewState["sql2"]; }
        set { ViewState["sql2"] = value; }
    }
   
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
                Sql = "select 学号=Student.StudentID,姓名=StudentName,班级=StudentClass,指导老师=teacherName,标题名=titleName from Student,teacher,title where 1=1 and STitleID=TID and TEID=title.TeacherId";
                Sql2="select 学号=Student.StudentID,姓名=StudentName,班级=StudentClass,指导老师='无',标题名='未选题' from Student where SudentState=0";
                DropDownList1.DataSourceID = null;
                DropDownList1.DataSource = studentManage.GetAllClass();
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("——班级——", "-1"));
                DataSet dataset = studentManage.GetStudent(Sql + " union " + Sql2);
                GridView1.DataSourceID = null;
                GridView1.DataSource = dataset;
                GridView1.DataBind();
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
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        DataSet dataset = studentManage.GetStudent(Sql);
        GridView1.DataSourceID = null;
        GridView1.DataSource = dataset;
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Sql = "select 学号=Student.StudentID,姓名=StudentName,班级=StudentClass,指导老师=teacherName,标题名=titleName from Student,teacher,title where 1=1 and STitleID=TID and TEID=title.TeacherId";
        Sql2 = "select 学号=Student.StudentID,姓名=StudentName,班级=StudentClass,指导老师='无',标题名='未选题' from Student where SudentState=0";
        string className = DropDownList1.SelectedItem.Text;
        if (!(className =="——班级——"))
        {
            Sql = Sql + " and StudentClass='" + className.Trim() + "'";
            Sql2 = Sql2 + " and StudentClass='" + className.Trim() + "'";
        }
        string isChoose = null;
        if (RadioButton1.Checked == true)
        {
            isChoose = "已选";
        }
        else if (RadioButton2.Checked == true)
        {
            isChoose = "未选";
        }
        if (!string.IsNullOrEmpty(isChoose))
        {
            if (isChoose == "已选")
            {
                Sql = Sql + " and STitleID is not null";
                Sql2 = Sql2 + " and STitleID is not null";
            }
            else
            {
                Sql = Sql + " and SudentState=0";
            }
        }
        string sql = Sql + " union " + Sql2;
        DataSet dataset = studentManage.GetStudent(sql);
        GridView1.DataSourceID = null;
        GridView1.DataSource = dataset;
        GridView1.DataBind();
        RadioButton1.Checked = false;
        RadioButton2.Checked = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sql = Sql + " union " + Sql2;
        DataSet dataset = studentManage.GetStudent(sql);
        DataTable table = dataset.Tables["student"];
        System.IO.StringWriter sw = new System.IO.StringWriter();
        sw.WriteLine("学号\t姓名\t班级\t指导老师\t标题名"); 
        foreach (DataRow dr in table.Rows)
        {
            sw.WriteLine(dr["学号"] + "\t " + dr["姓名"] + "\t" + dr["班级"] + "\t" + dr["指导老师"] + "\t" + dr["标题名"]);
        }
        sw.Close();
        Response.Charset = "GBK";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode("学生信息表.xls", System.Text.Encoding.GetEncoding("UTF-8")));
        Response.ContentType = "application/ms-excel";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GBK");
        Response.Write(sw);
        Response.End(); 

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DataSet dataset = studentManage.GetStudent(Sql + " union " + Sql2);
        GridView1.DataSourceID = null;
        GridView1.DataSource = dataset;
        GridView1.DataBind();
    }
}
