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

public partial class xiangce_add : System.Web.UI.Page
{
    public string fname;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (UploadFile.Value != null && UploadFile.Value != "")
        {
            hsgupload();
        }

        string sql;
        //sql = "insert into bianjibu(bh,mc,dw,addr,postcode,tel,email,website,pwd) values('"+bh.Text.ToString().Trim()+"','"+mc.Text.ToString().Trim()+"','"+dw.Text.ToString().Trim()+"','"+addr.Text.ToString().Trim()+"','"+postcode.Text.ToString().Trim()+"','"+tel.Text.ToString().Trim()+"','"+email.Text.ToString().Trim()+"','"+website.Text.ToString().Trim()+"','"+pwd.Text.ToString().Trim()+"')";
        sql="insert into xiangce(bianhao,mingcheng,pic) values('"+bianhao.Text.ToString().Trim()+"','"+mingcheng.Text.ToString().Trim()+"','"+fname +"') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库的连?);</script>");
        }
    }

    private void hsgupload()
    {
        if (UploadFile.Value != null)
        {
            string nam = UploadFile.PostedFile.FileName;
            //取得文件名(抱括路径)里最后一个"."的索引
            int i = nam.LastIndexOf(".");
            //取得文件扩展名
            string newext = nam.Substring(i);
            //这里我自动根据日期和文件大小不同为文件命名,确保文件名不重复
            DateTime now = DateTime.Now;
            string newname = now.DayOfYear.ToString() + UploadFile.PostedFile.ContentLength.ToString();

            //保存文件到你所要的目录,这里是IIS根目录下的uploadfiles目录
            //注意: 我这里用Server.MapPath()取当前文件的绝对目录.在asp.net里"\"必须用"\\"代替
            UploadFile.PostedFile.SaveAs(Server.MapPath("uppic/" + newname + newext));

            //得到这个文件的相关属性:文件名,文件类型,文件大小
            //string fname;
            fname = newname + newext;
            //Response.Write("<script>javascript:alert('"+fname+"');</script>");
            //fenc.Text=UploadFile.PostedFile.ContentType ;
            //fsize.Text=UploadFile.PostedFile.ContentLength.ToString();
            //Image1.ImageUrl = "http://localhost/web/news/uploadfiles/"+newname+newext;
        }
    }
}

