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

public partial class usercontrols_login : System.Web.UI.UserControl
{
    DxxBlog.BLL.B_Users dal = new DxxBlog.BLL.B_Users();
    DxxBlog.Model.B_Users model = new DxxBlog.Model.B_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string userid = Session["userid"].ToString();
                if (!String.IsNullOrEmpty(userid))
                {
                    divLoged.Visible = true;
                    divLogin.Visible = false;

                    lblLogName.Text = Session["logname"].ToString();
                    lblNickName.Text = Session["nickname"].ToString();
                }
                else
                {
                    divLoged.Visible = false;
                    divLogin.Visible = true;
                }
            }
            catch (Exception)
            {
                divLoged.Visible = false;
                divLogin.Visible = true;
            }
        }
    }
    protected void imgLogin_Click(object sender, ImageClickEventArgs e)
    {
        string LogName = this.txtLogName.Text;
        string LogPwd = this.txtLogPwd.Text;
        DataTable dt = dal.GetAllList().Tables[0];
        if (dt.Rows.Count > 0)
        {
            DataRow[] dr = dt.Select("LogName='" + LogName + "' and LogPwd='" + LogPwd + "'");
            if (dr.Length > 0)
            {
                Session["userid"] = dr[0]["Id"].ToString();
                Session["logname"] = dr[0]["LogName"].ToString();
                Session["username"] = dr[0]["UserName"].ToString();
                Session["nickname"] = dr[0]["Nickname"].ToString();
                Response.Redirect("users/mycenter.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>window.alert('请您正确输入');window.location.href=('index.aspx');</script>");
            }
        }
    }
}
