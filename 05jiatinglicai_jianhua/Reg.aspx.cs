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

public partial class Reg : System.Web.UI.Page
{
    SqlHelper data = new SqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string sql = "insert into UserInfo(Name,Sex,Pass,loginName,NianLing,Ds,SFZ,XueLI,TEl)values('" + Name.Text + "','" + Sex.SelectedValue + "','" + Pass.Text + "','" + loginName.Text + "','" + NianLing.Text + "','" + Ds.Text + "','" + SFZ.Text + "','" + XueLI.Text + "','" + TEl.Text + "')";
        data.RunSql(sql);




        Alert.AlertAndRedirect("注册成功请登陆", "Login.aspx");
    }
}
