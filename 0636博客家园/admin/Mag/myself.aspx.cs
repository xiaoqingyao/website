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

public partial class admin_Mag_myself : System.Web.UI.Page
{
    DxxBlog.BLL.B_Admin dal = new DxxBlog.BLL.B_Admin();
    DxxBlog.Model.B_Admin model = new DxxBlog.Model.B_Admin();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string abc = null;
            try
            {
                abc = Session["AdminNo"].ToString();
            }
            catch (Exception)
            {
                
            }
            if (!String.IsNullOrEmpty(abc))
            {
                LoadData();
            }
            else
            {
                Response.Redirect("<script>alert('session失效，请重新登录');window.parent.location.href='../login.aspx';</script>");
                return;
            }
        }
    }
    private void LoadData()
    {
        DataTable dt = null;
        dt = dal.GetList("Id=" + Session["AdminNo"].ToString()).Tables[0];
        if (dt.Rows.Count>0)
        {
            this.txtName.Text = dt.Rows[0]["UserName"].ToString();
            this.txtLogName.Text = dt.Rows[0]["LogName"].ToString();
            this.txtNickName.Text = dt.Rows[0]["Nickname"].ToString();
            this.txtBirthday.Text = dt.Rows[0]["Birthday"].ToString();
            this.txtTel.Text = dt.Rows[0]["Tel"].ToString();
            this.txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
            this.txtEmail.Text = dt.Rows[0]["Email"].ToString();
            this.txtProfessional.Text = dt.Rows[0]["Professional"].ToString();
            this.txtAddress.Text = dt.Rows[0]["Address"].ToString();
            this.FCKeditor.Value = dt.Rows[0]["Remark"].ToString();
            if (String.IsNullOrEmpty(dt.Rows[0]["AvatarImg"].ToString()))
            {
                this.myPhotos.Src = "../../images/no.gif";
            }
            else
            {
                this.myPhotos.Src = "../../UpFile/Photos/" + dt.Rows[0]["AvatarImg"].ToString();
            }
            for (int i = 0; i < ddlSex.Items.Count; i++)
            {
                if (ddlSex.Items[i].Text == dt.Rows[0]["Sex"].ToString())
                {
                    this.ddlSex.Items[i].Selected = true;
                }
                else
                {
                    this.ddlSex.Items[i].Selected = false;
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
                    string folderPath = Server.MapPath("..\\..\\UpFile\\Photos");//创建文件夹时用
                    if (!System.IO.Directory.Exists(folderPath))//判断文件夹是否已经存在
                    {
                        System.IO.Directory.CreateDirectory(folderPath);//创建文件夹
                    }
                    fu.SaveAs(System.IO.Path.Combine(Request.PhysicalApplicationPath, "UpFile\\Photos\\") + strname + extension);
                    hidphoto.Value = strname + extension;

                    myPhotos.Src = "../../UpFile/Photos/" + strname + extension;

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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(this.txtLogName.Text.Trim()))
        {
            Response.Write("<script>alert('登录名不能为空');</script>");
            return;
        }
        model.UserName = this.txtName.Text;
        model.LogName = this.txtLogName.Text;
        model.Sex = this.ddlSex.SelectedItem.Text;
        model.Tel = this.txtTel.Text;
        model.Nickname = this.txtNickName.Text;
        model.Birthday = this.txtBirthday.Text;
        model.Mobile = this.txtMobile.Text;
        model.Email = this.txtEmail.Text;
        model.Professional = this.txtProfessional.Text;
        model.Address = this.txtAddress.Text;
        model.Remark = this.FCKeditor.Value;
        model.AvatarImg = this.hidphoto.Value;
        if (!String.IsNullOrEmpty(Session["AdminNo"].ToString()))
        {
            model.Id = int.Parse(Session["AdminNo"].ToString());
        }
       
        try
        {
            dal.Update(model);
            Response.Write("<script>alert('修改成功');</script>");
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('修改失败');</script>");
        }
    }
}
