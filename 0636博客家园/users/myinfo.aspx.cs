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

public partial class users_myinfo : System.Web.UI.Page
{
    DxxBlog.BLL.B_Users dal = new DxxBlog.BLL.B_Users();
    DxxBlog.Model.B_Users model = new DxxBlog.Model.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            InitData();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string uid = null;
        try
        {
            uid = Session["userid"].ToString();

        }
        catch (Exception ex)
        { }
        model.LogName = txtloginame.Text;
        if (String.IsNullOrEmpty(txtloginame.Text.Trim()))
        {
            Response.Write("<script>alert('帐号不能为空!');</script>");
            return;
        }

        model.UserName = txtusername.Text;
        model.Nickname = txtnickname.Text;
        model.AvatarImg = hidphoto.Value;
        model.Sex = ddlsex.SelectedValue.ToString();
        if (txtbirthday.Text != null && txtbirthday.Text != "")
        {
            try
            {
                DateTime dst = Convert.ToDateTime(txtbirthday.Text);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('请输入正确的日期!');</script>");
                return;
            }

            model.Birthday = txtbirthday.Text;
        }

        model.Email = txtEmail.Text;
        model.Tel = txttel.Text;
        model.Mobile = txtmobile.Text;

        model.Professional = txtProfesstion.Text;
        model.Address = txtAddress.Text;

        model.Profile = fckdescription.Value;
        if (!String.IsNullOrEmpty(uid))
        {
            model.Id = int.Parse(uid);
            dal.Update(model);
        }
    }
    public void InitData()
    {
        string id = null;
        try
        {
            id = Session["userid"].ToString();

        }
        catch (Exception ex)
        { }
        if (id != null)
        {
            DataTable dt = dal.GetList(" Id=" + id + "").Tables[0];

            if (dt.Rows.Count > 0)
            {

                hiduid.Value = dt.Rows[0]["Id"].ToString();

                txtusername.Text = dt.Rows[0]["UserName"].ToString();
                txtloginame.Text = dt.Rows[0]["LogName"].ToString();
                txtnickname.Text = dt.Rows[0]["Nickname"].ToString();
                txttel.Text = dt.Rows[0]["Tel"].ToString();
                txtmobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtbirthday.Text = dt.Rows[0]["Birthday"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtProfesstion.Text = dt.Rows[0]["Professional"].ToString();
                txtregtime.Text = dt.Rows[0]["RegisDate"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                fckdescription.Value = dt.Rows[0]["Profile"].ToString();
                ddlsex.SelectedValue = dt.Rows[0]["Sex"].ToString();
                hidphoto.Value = dt.Rows[0]["AvatarImg"].ToString();
                if (String.IsNullOrEmpty(dt.Rows[0]["AvatarImg"].ToString()))
                {
                    Photos.Src = "images/no.gif";
                }
                else
                {
                    Photos.Src = "../UpFile/Photos/" + dt.Rows[0]["AvatarImg"].ToString();
                }
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
}
