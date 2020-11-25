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
using System.IO;          //引用命名空间

public partial class BaseInfo_addEmployee : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    static string path;   //必须设置静态变量　　才可以保存存储　上传　文件路径
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        if (!IsPostBack)
        {
            dlDept.DataSource = bc.GetDataSet("select * from dept", "dept");
            dlDept.DataBind();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string str;
        str = "insert into employee values('" + txtEName.Text + "','" + dlSex.Text + "','" + txtEBrith.Text + "','" + txtELearn.Text + "','" + txtPost.Text + "','" + dlDept.Text + "','" + dlJop.Text + "','" + txtTel.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + dlState.Text + "','" + path + "')";
        Boolean bl;
        bl = bc.ExecSQL(str);
        if (bl)
        {
            Response.Write(bc.MessageBox("学生基础信息添加成功"));
        }
        else
        {
            Response.Write(bc.MessageBox("学生基础信息添加失败"));
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtEName.Text = "";
        txtEBrith.Text = "";
        txtAddress.Text = "";
        txtELearn.Text = "";
        txtPost.Text = "";
        txtTel.Text = "";
        txtEmail.Text = "";
    }

    protected void btnGoUp_Click(object sender, EventArgs e)
    {
        string str = this.File1.PostedFile.FileName;
        if (str == "")
        {
            Response.Write(bc.MessageBox("请选择上传图片！"));
            return;
        }
        
        string ss = str.Substring(str.LastIndexOf("\\") + 1);
        string s = Server.MapPath("..\\photo\\" + ss);
        path = "..\\photo\\" + ss;
        if (File.Exists(s))
        {
            Response.Write(bc.MessageBox("该文件已经存在，请重新命名！！！"));
            return;
        }
        this.File1.PostedFile.SaveAs(s);
        Image1.ImageUrl = path;
    }
}
