using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//5-1-aspx
public partial class system_setSysName : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == string.Empty)
        {
            bc.MessageBox("该用户在线20分钟,没有操作任何动作,即将返回到系统主页!");
            Response.Redirect("../Index.aspx");
        }
        
        if (!IsPostBack)
        {
            //装载学生姓名
            dlEmployee.DataSource = bc.GetDataSet("select * from employee", "employee");
            dlEmployee.DataTextField = "name";
            dlEmployee.DataValueField = "name";
            dlEmployee.DataBind();
            //装载系统操作员姓名
            DataSet ds = bc.GetDataSet("select * from sysUser", "sysUser");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row)  //将检索到的数据逐一,循环添加到Listbox1中
            {
                ListBox1.Items.Add(new ListItem(rs["userName"].ToString()));
            }
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断该系统用户名是否存在,如果存在将不允许创建,否则设置系统用户
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
        SqlCommand cmd = new SqlCommand("select count(*) from sysUser where userName='"+dlEmployee.Text+"'", con);
        cmd.Connection.Open();
        int i = (int)cmd.ExecuteScalar();
        cmd.Connection.Close();
        if (i > 0)
        {
            Response.Write(bc.MessageBox("该用户已经被设置为系统用户！"));
            con.Close();
            return ;
        }
        else
        {
            //添加系统用户
            bc.ExecSQL("INSERT INTO sysUser (userName, userPwd, loginTime, system) values('" + dlEmployee.Text + "','" + TextBox1.Text + "','','0')");
            ListBox1.DataBind();
        }
        
        con.Close();
        Response.Redirect("setSysName.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //删除系统用户
        bc.ExecSQL("DELETE FROM sysUser WHERE(userName = '" + this.ListBox1.SelectedItem.Text.ToString() + "')");
        string strss=Convert.ToString( Session["loginName"]);
        
        if (this.ListBox1.SelectedItem.Text.ToString().Equals(strss))
        {
            //删除当前用户时,退出系统回到首页
            Response.Write("<script language=javascript>parent.location='../index.aspx'</script>");
        }
        else
        {
            //删除系统操作员后,重新定向到本页
            Response.Redirect("setSysName.aspx");
        }

    }
}
