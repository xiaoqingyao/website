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

public partial class regis : System.Web.UI.Page
{
    DxxBlog.BLL.B_Users dal = new DxxBlog.BLL.B_Users();
    DxxBlog.Model.B_Users model = new DxxBlog.Model.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegis_Click(object sender, EventArgs e)
    {
        model.LogName = this.txtLogName.Text;
        model.LogPwd = this.txtLogPwd.Text;
        model.Nickname = this.txtNickName.Text;
        model.Tel = this.txtTel.Text;
        model.QQ= this.txtQQ.Text;
        model.Email = this.txtEmail.Text;
        int i = dal.Add(model);
        if (i>0)
        {
            Response.Write("<script language=javascript>window.alert('恭喜你，注册成功，快去首页登录吧!');window.location.href=('index.aspx');</script>");
        }
        else
        {
            Response.Write("<script language=javascript>window.alert('不好意思，注册失败!');window.location.href=('regis.aspx');</script>");
        }
    }
}
