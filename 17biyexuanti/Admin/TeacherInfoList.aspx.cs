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

public partial class Admin_TeacherInfoList : System.Web.UI.Page
{
    public string Sql
    {
        get { return (string)ViewState["sql"]; }
        set { ViewState["sql"] = value; }
    }
    TeacherManage teacherManage = new TeacherManage();
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
                Sql = "select 教师号=TeacherID,教师姓名=TeacherName,联系方式=TeacherPhone,邮箱=TeacherMail from teacher where 1=1";
                GridView1.DataSourceID = null;
                GridView1.DataSource = teacherManage.GetTeacher(Sql);
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
        Sql = "select 教师号=TeacherID,教师姓名=TeacherName,联系方式=TeacherPhone,邮箱=TeacherMail from teacher where 1=1";
        if (TextBox1.Text.Trim() != "")
        {
            Sql = Sql + " and TeacherName like '%" + TextBox1.Text.Trim() + "%'";
        }
        GridView1.DataSourceID = null;
        GridView1.DataSource = teacherManage.GetTeacher(Sql);
        GridView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet dataset = teacherManage.GetTeacher(Sql);
        DataTable table = dataset.Tables["teacher"];
        System.IO.StringWriter sw = new System.IO.StringWriter();
        sw.WriteLine("教师号\t教师姓名\t联系方式\t邮箱");
        foreach (DataRow dr in table.Rows)
        {
            sw.WriteLine(dr["教师号"] + "\t " + dr["教师姓名"] + "\t" + dr["联系方式"] + "\t" + dr["邮箱"]);
        }
        sw.Close();
        Response.Charset = "GBK";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode("教员信息表.xls", System.Text.Encoding.GetEncoding("UTF-8")));
        Response.ContentType = "application/ms-excel";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GBK");
        Response.Write(sw);
        Response.End(); 
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSourceID = null;
        GridView1.DataSource = teacherManage.GetTeacher(Sql);
        GridView1.DataBind();
    }
}
