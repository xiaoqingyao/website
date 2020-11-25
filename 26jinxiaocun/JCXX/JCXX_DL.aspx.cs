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
using JXCBLL;
using JXCMODEL;

public partial class JCXX_JCXX_DL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack){
            dlDataBind();
        }
    }
    public void dlDataBind()
    {
        ddlsf.DataSource = JsManager.getAllJs();
        ddlsf.DataValueField = "jsbh";
        ddlsf.DataTextField = "jsmc";
        ddlsf.DataBind();
        ListItem item = new ListItem("请选择……", "-1", true);
        ddlsf.Items.Insert(0, item);
    }
    protected void btndl_Click1(object sender, EventArgs e)
    {
        if (ddlsf.SelectedValue == "-1")
        {
            lblmassage.Text = "请选择身份！";
        }
        else if(txtbuser.Text == null || txtbuser.Text == ""){
            lblmassage.Text = "请填写用户名！";
        }
        else if (txtbpwd.Text == null || txtbpwd.Text == "")
        {
            lblmassage.Text = "请填写密码！";
        }
        else {
            lblmassage.Text = "";
            Ywy ywy = YwyManager.getYwyByCoditions(txtbuser.Text,txtbpwd.Text,Convert.ToInt32(ddlsf.SelectedValue));
            if(ywy!=null && ywy.Ywymc!=null){
                Session.Add("ywy", ywy);
                Response.Redirect("~/Default.aspx", true);
            }
            else{
                lblmassage.Text = "登录失败！";
            }
        }
    }
    protected void btnqx_Click1(object sender, EventArgs e)
    {
        txtbuser.Text = "";
        txtbpwd.Text = "";
        ddlsf.SelectedItem.Selected = false;
        ddlsf.Items.FindByValue("-1").Selected = true;
        lblmassage.Text = "";
    }
}
