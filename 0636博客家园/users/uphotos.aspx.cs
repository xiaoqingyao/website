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

public partial class users_uphotos : System.Web.UI.Page
{
    DxxBlog.BLL.B_Part dalt = new DxxBlog.BLL.B_Part();
    DxxBlog.BLL.B_Img dal = new DxxBlog.BLL.B_Img();
    DxxBlog.Model.B_Img model = new DxxBlog.Model.B_Img();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TreeBind();
            string abc = null;
            try
            {
                abc = Session["userid"].ToString();
            }
            catch (Exception) { }
            if (String.IsNullOrEmpty(abc))
            {
                Response.Redirect("<script>alert('session失效，请重新登录');window.parent.location.href='../index.aspx';</script>");
                return;
            }
        }

    }

    protected void btnUpLoad_Click(object sender, EventArgs e)
    {
        if (fu.HasFile)
        {
            string extension = System.IO.Path.GetExtension(fu.FileName);
            if (extension.ToLower() == ".jpg" || extension.ToLower() == ".gif" || extension.ToLower() == ".png")//判断文件类型
            {
                if (fu.PostedFile.ContentLength < 3154884)//判断文件大小
                {
                    string strname = DateTime.Now.ToString("yyyyMMddHHmmss");//生成当前时间文件名
                    string folderPath = Server.MapPath("..\\UpFile\\Photos");//创建文件夹时用
                    if (!System.IO.Directory.Exists(folderPath))//判断文件夹是否已经存在
                    {
                        System.IO.Directory.CreateDirectory(folderPath);//创建文件夹
                    }
                    fu.SaveAs(System.IO.Path.Combine(Request.PhysicalApplicationPath, "UpFile\\Photos\\") + strname + extension);
                    hidphoto.Value = strname + extension;

                    Photos.Src = "../UpFile/Photos/" + strname + extension;

                }
                else
                    Response.Write("<script>alert('对不起，你上传的图片太大，图片大小不能大于3MB!');</script>");

            }
            else
                Response.Write("<script>alert('上传图片的类型不正确,上传图片的类型只能是|.jpg|.gif|.png!');</script>");
        }
        else
            Response.Write("<script>alert('请选择图片!');</script>");
    }


    private void TreeBind()
    {
        DataTable dt = dalt.GetList("StrType=2").Tables[0];

        this.ddlClassId.Items.Clear();
        this.ddlClassId.Items.Insert(0, new ListItem("请选择所属类别...", "-1"));
        this.ddlClassId.Items[0].Selected = true;
        foreach (DataRow dr in dt.Rows)
        {
            string Id = dr["Id"].ToString();
            string Title = dr["StrName"].ToString().Trim();

            this.ddlClassId.Items.Add(new ListItem(Title, Id));
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(this.txtTitle.Text.Trim()))
        {
            Response.Write("<script>alert('标题不能空');</script>");
            return;
        }
        model.StrName = this.txtTitle.Text;
        model.StrUser = Session["userid"].ToString();
        if (this.ddlClassId.SelectedValue.ToString() == "-1")
        {
            Response.Write("<script>alert('请选择所属栏目');</script>");
            return;
        }
        model.StrType = this.ddlClassId.SelectedValue.ToString();
        model.StrDescription = txtMiaoshu.Text;
        model.ReleaseDate = System.DateTime.Now.ToString();
        model.StrImgPath = hidphoto.Value.ToString();
        int i = dal.Add(model);
        if (i > 0)
        {
            Response.Write("<script>alert('发布成功');window.location.href='photos.aspx'</script>");
        }
    }
}
