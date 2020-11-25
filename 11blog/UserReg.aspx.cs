using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string js = "";
        //验证不要重复注册
        string name = txtname.Text.Trim();
        DataSet ds = new Class1().hsggetdata("select * from huiyuan where username='" + txtname.Text.Trim() + "'");
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            js = "<script language='javascript'>alert('{0}');window.location.replace('{1}')</script>";
            HttpContext.Current.Response.Write(string.Format(js, "对不起，该用户名已经被注册，请更换!", "UserReg.aspx"));
            return;
        }
        new Class1().hsgexucute("insert into huiyuan(Daan,wenti,password,username,Sex,Tel,ADdress,nianling,Ds)values('" + txtdanan.Text + "','" + txtwwenti.Text + "','" + TextBox1.Text + "','" + txtname.Text + "','" + DropDownList1.SelectedItem.Text + "','" + txtTel.Text + "','" + txtbanquan.Text + "','" + tb_birth.Value + "','" + txtds.Text + "')");

        HttpContext.Current.Response.Write(string.Format(js, "注册成功请登录!", "loginhuiyuan.aspx"));
    }
}
