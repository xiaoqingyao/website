using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    sqlHelper server = new sqlHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_btn_Click(object sender, EventArgs e)
    {
        string code = this.Name.Text.Trim();
        string pwd = this.pwd.Text.Trim();
        string role = this.role.SelectedValue;
        if (string.IsNullOrEmpty(code))
        {
            showMessage("请输入登录名", false, "");
            return;
        }
        //else if (string.IsNullOrEmpty(pwd))
        //{
        //    showMessage("密码不能为空", false, "");
        //    return;
        //}
        string sql = string.Empty;
        if (role.Equals("0"))
        {
            //农场主
            sql = "select * from farmer where code='" + code + "' and pwd='" + pwd + "'";
            Session["role"] = "农场主";
        }
        else if (role.Equals("1"))
        {
            //承租人
            sql = "select * from tenantry where code='" + code + "' and pwd='" + pwd + "'";
            Session["role"] = "承租人";
        }
        else if (role.Equals("2"))
        {
            //管理员
            sql = "select * from admin where code='" + code + "' and pwd='" + pwd + "'";
            Session["role"] = "管理员";
        }
        DataTable dt = server.GetDataTable(sql, null);
        if (dt.Rows.Count == 0)
        {
            showMessage("登录失败，请检查用户名密码是否一致", false, "");
            return;
        }
        Session["userCode"] = code;
        Session["userName"] = dt.Rows[0]["name"].ToString();
        //showMessage(dt.Rows[0]["name"].ToString(), false,"");
        //Response.Write(dt.Rows[0]["name"].ToString());
        Response.Redirect("index.aspx");
    }
    /// <summary>
    /// 提示信息
    /// </summary>
    /// <param name="strMsg">提示的信息</param>
    /// <param name="isExit">提示后是否退出</param>
    /// <param name="addScript">追加的script</param>
    public void showMessage(string strMsg, bool isExit, string addScript)
    {
        string strScript = "alert('" + strMsg + "');";
        if (!addScript.Equals(""))
        {
            strScript += addScript;
        }
        if (isExit)
        {
            strScript += "self.close();";
        }
        ClientScript.RegisterStartupScript(this.GetType(), "", strScript, true);
    }
}