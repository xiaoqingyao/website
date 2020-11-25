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

public partial class ziliaoxiazai_add : System.Web.UI.Page
{
    public string fname;

    protected void Page_Load(object sender, EventArgs e)
    {
        faburen.Text = Session["username"].ToString().Trim();
		if (!IsPostBack)
        {
            leixing.Items.Add("课件");
            leixing.Items.Add("软件");
            leixing.Items.Add("歌曲");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (UploadFile.Value != null && UploadFile.Value != "")
        {
            hsgupload();
        }
        string sql;
        sql="insert into ziliaoxiazai(bianhao,mingcheng,leixing,jianjie,wenjian,faburen) values('"+bianhao.Text.ToString().Trim()+"','"+mingcheng.Text.ToString().Trim()+"','"+leixing.Text.ToString().Trim()+"','"+jianjie.Text.ToString().Trim()+"','"+fname+"','"+faburen.Text.ToString().Trim()+"') ";
        int result;
        result = new Class1().hsgexucute(sql);
        if (result == 1)
        {
            Response.Write("<script>javascript:alert('添加成功');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('系统错误，请检查数据库设置问题');</script>");
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
            Random rnd = new Random();
            int n = rnd.Next(1000, 9999);
            string newname = DateTime.Now.Year.ToString().Trim() + DateTime.Now.Month.ToString().Trim() + DateTime.Now.Day.ToString().Trim() + DateTime.Now.Hour.ToString().Trim() + DateTime.Now.Minute.ToString().Trim() + DateTime.Now.Second.ToString().Trim() + n.ToString().Trim();
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
	//private void addxiala(string ntable, string nzd, string nxlk)
    //{
    //    string sql;
    //    sql = "select "+nzd+" from "+ntable+" order by id desc";
    //    DataSet result = new DataSet();
    //    result = new Class1().hsggetdata(sql);
    //    if (result != null)
    //    {
    //        if (result.Tables[0].Rows.Count > 0)
    //       {
    //            int i = 0;
    //            for (i = 0; i < result.Tables[0].Rows.Count; i++)
    //            {
    //                kehubianhao.Items.Add(result.Tables[0].Rows[i][0].ToString().Trim());
    //            }
    //        }
    //    }
    //}
}

