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

public partial class Teacher_StudentList : System.Web.UI.Page
{
    ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int thesisId = Convert.ToInt32(e.CommandArgument);
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
