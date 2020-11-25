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

public partial class Student_ModifyThesis : System.Web.UI.Page
{
    ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
    TitleManage titleManage = new TitleManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Student stu = (Student)Session["student"];
            if (stu == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Student student = (Student)Session["student"];
                Thesis th = thesisManage.GetThesisByStuId(student.SID);
                if (!string.IsNullOrEmpty(th.PublishDate))
                {
                    Thesis thesis = thesisManage.GetThesisByStuId(student.SID);
                    Title title = titleManage.GetTilteByTitleId(thesis.Title.TID);
                    Label1.Text = thesis.Title.TitleName;
                    Label3.Text = thesis.PublishDate;
                    Label2.Text = title.Teacher.TeacherName;
                }
                else
                {
                    Panel1.Visible = false;
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('对不起！你还没有上传论文！');</script>");
                    Label4.Text = "你还没有上传论文！";
                }
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Student student = (Student)Session["student"];
        int num=thesisManage.GetCountsByStuId(student.SID);
        System.IO.FileStream r = new System.IO.FileStream("ThesisManage\\毕业论文.doc", System.IO.FileMode.Open); 
  //设置基本信息 
  Response.Buffer = false; 
  Response.AddHeader("Connection", "Keep-Alive");
  Response.Charset = "GBK";
  Response.ContentType = "application/octet-stream";
  Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(System.IO.Path.GetFileName("ThesisManage\\毕业论文.doc"), System.Text.Encoding.GetEncoding("UTF-8"))); 
  Response.AddHeader("Content-Length", r.Length.ToString()); 


  while (true) 
  { 
  //开辟缓冲区空间 
  byte[] buffer = new byte[1024]; 
  //读取文件的数据 
  int leng = r.Read(buffer, 0, 1024); 
  if (leng == 0)//到文件尾，结束 
  break; 
  if (leng == 1024)//读出的文件数据长度等于缓冲区长度，直接将缓冲区数据写入 
  Response.BinaryWrite(buffer); 
  else 
  { 
  //读出文件数据比缓冲区小，重新定义缓冲区大小，只用于读取文件的最后一个数据块 
  byte[] b = new byte[leng]; 
  for (int i = 0; i < leng; i++) 
  b[i] = buffer[i]; 
  Response.BinaryWrite(b); 
  } 
  } 
  r.Close();//关闭下载文件 
  Response.End();//结束文件下载 

        //if (num > 0)
        //{
        //    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('下载成功！文件保存在：桌面/毕业论文.doc');</script>");
        //}
        //else
        //{
        //    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('下载失败');</script>");
        //}
    }
}
