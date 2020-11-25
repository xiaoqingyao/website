using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Xml;
using System.Text;
using System.IO;
using System.Net;
using BLL;
using COMM;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection sqlcon;
    string strCon = ConfigurationManager.AppSettings["ConnectionString"].ToString();
    COMM.XmlProcess dss = new XmlProcess();

    protected BLL.User_BLL testbll = new User_BLL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转到注册页面，注册按钮事件
        Response.Redirect("reg.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string users = username.Text.Trim();
        DataSet ds;
        if (username.Text.Length == 0)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空!');location='Default.aspx'</script>");
        }
        string password1 = password.Text.Trim();
        string quanxian1 = quanxian.Text.Trim();
        //if (quanxian1.Equals("管理员"))
        //{
        //    ds = DetaiBind(users, password1);
        //}
        //else
        //{
        //    ds = DetaiBind1(users, password1);
        //}
        try
        {

            //if (ds != null && ds.Tables[0].Rows.Count > 0)
            //{
                if (quanxian1.Equals("管理员"))
                {
                    Session["username"] = users;
                    string userlogin = Session["username"].ToString();

                    // Label4.Text = Session["username"].ToString();
                    Response.Write("<script language=javascript>alert('欢迎登陆集约化水产养殖设备管理系统!');location='index.aspx'</script>");
                }
                else
                {
                    Session["userinfo"] = users;
                    // Label4.Text = Session["username"].ToString();
                    Response.Write("<script language=javascript>alert('欢迎登陆集约化水产养殖设备管理系统!');location='index2.aspx'</script>");
                }
            //}
            //else
            //{
            //    Response.Write("<script language=javascript>alert('用户名活密码错误!');location='Default.aspx'</script>");
            //}

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    private DataSet DetaiBind(string empbng, string pass)
    {
        DataSet ds =(DataSet)testbll.executeDAO("EmpDetail_BLL", new object[] { empbng, pass });
        return ds;
    }

     private DataSet DetaiBind1(string empbng, string pass)
    {
        DataSet ds = (DataSet)testbll.executeDAO("EmpDetailInfo_BLL111", new object[] { empbng, pass });
        return ds;
    }
}
