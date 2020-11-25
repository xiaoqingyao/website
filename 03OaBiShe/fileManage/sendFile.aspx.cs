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

public partial class fileManage_sendFile : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    static string path;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null) ClientScript.RegisterStartupScript(this.GetType(), "", "this.parent.location.href='/login/sysLogin.aspx'", true);
        if (!IsPostBack)
        {
            ddlName.DataSource = bc.GetDataSet("select * from employee","employee");
            ddlName.DataTextField = "name";
            ddlName.DataValueField = "name";
            ddlName.DataBind();
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            //将附件传送到服务器上
            string str = this.File1.PostedFile.FileName;

            string ss = str.Substring(str.LastIndexOf("\\") + 1);
            string s = Server.MapPath("..\\file\\" + ss);
            path = "..\\file\\" + ss;

            bool bl = bc.ExecSQL("INSERT INTO [file] (fileSender, fileAccepter, fileTitle, fileTime, fileContent, path,examine,fileName) VALUES('" + Convert.ToString(Session["loginName"]) + "','" + ddlName.Text + "','" + TextBox1.Text + "','" + DateTime.Today.ToString() + "','" + TextBox2.Text + "','" + path + "','未接收','" + ss + "')");
            if (bl)
            {
                Response.Write(bc.MessageBox("文件传送成功！"));
            }
            else
            {
                Response.Write(bc.MessageBox("网络故障，文件传送失败！"));
                return;
            }
            if (str == string.Empty) return;
            this.File1.PostedFile.SaveAs(s);
        }
        catch (Exception ex)
        {
            Response.Write(bc.MessageBox(ex.Message));
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}
