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

public partial class Teacher_StudentMessage : System.Web.UI.Page
{
    ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
                Teacher te = (Teacher)Session["teacher"];
                if (te == null)
                {
                    Response.Redirect("~/DoLogin.aspx");
                }
                else
                {
                    int thesisId = Convert.ToInt32(Request.Params["ThesisID"]);
                    Thesis thesis = thesisManage.GetThesisById(thesisId);
                    Student student = thesis.Student;
                    lbNum.Text = student.StudentID;
                    lbName.Text = student.StudentName;
                    lbAddress.Text = student.StudentAddress;
                    lbClass.Text = student.StudentClass;
                    lbEmail.Text = student.StudentMail;
                    lbPhone.Text = student.StudentPhone;
                    int state = student.SudentState;
                    if (state == 0)
                    {
                        lbIsChooseTitle.Text = "否";
                    }
                    else
                    {
                        lbIsChooseTitle.Text = "是";
                    }
                    Label1.Text = thesis.Title.TitleName;
                    Label2.Text = thesis.PublishDate;
                }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int thesisId = Convert.ToInt32(Request.Params["ThesisID"]);
        Thesis thesis = thesisManage.GetThesisById(thesisId);
        int num = thesisManage.GetCountsByStuId(thesis.Student.SID);
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
    }
}
