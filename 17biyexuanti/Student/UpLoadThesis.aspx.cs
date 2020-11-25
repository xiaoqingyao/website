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
using System.IO;
using ThesisManage.BLL;
using ThesisManage.Model;

public partial class Student_UpLoadThesis : System.Web.UI.Page
{
    ThesisManage.BLL.ThesisManage thesisManage = new ThesisManage.BLL.ThesisManage();
    TitleManage titlemanage = new TitleManage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Student student = (Student)Session["student"];
            if (student == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                btnUpLoad.Attributes.Add("onclick", "return confirm('你已上传论文，确定要重新上传吗？');");
            }
        }
    }
    protected void btnUpLoad_Click(object sender, EventArgs e)
    {

            Student student = (Student)Session["student"];
            if (student.Title.TitleName != null && student.Title.TitleName!="")
            {
                Thesis th = thesisManage.GetThesisByStuId(student.SID);
                Stream worddatastream = FileUpload1.PostedFile.InputStream;
                int worddatalen = FileUpload1.PostedFile.ContentLength;
                string wordtype = FileUpload1.PostedFile.ContentType;
                string name = this.FileUpload1.PostedFile.FileName;
                DateTime time = DateTime.Now;
                byte[] wordData = new byte[worddatalen];
                int n = worddatastream.Read(wordData, 0, worddatalen);
                Thesis thesis = new Thesis();
                thesis.Student = student;
                thesis.PublishDate = time.ToString();
                thesis.Content = wordData;
                int titleId = student.Title.TID;
                ThesisManage.Model.Title title = titlemanage.GetTilteByTitleId(titleId);
                thesis.Title = title;
                if (string.IsNullOrEmpty(th.PublishDate))
                {
                    
                    int isUpLoadOk = thesisManage.InsertThesis(thesis);
                    if (isUpLoadOk > 0)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('论上传成功！');</script>");
                    }
                    else
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('论文上传失败！');</script>");
                    }
                }
                else
                {
                    btnUpLoad.Attributes.Add("onclick", "return confirm('你已上传论文，确定要重新上传吗？');");
                    thesisManage.DeleteThesisByStudentId(student.SID);
                   int num= thesisManage.InsertThesis(thesis);
                    if (num > 0)
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('论文重新上传成功！');</script>");
                    }
                    else
                    {
                        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('论文重新上传失败！');</script>");
                    }
                }
            }
            else
            {
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('你还没有选题，请选题！');</script>");
            }
        }

   
    protected void btnesc_Click(object sender, EventArgs e)
    {
       
    }
}
