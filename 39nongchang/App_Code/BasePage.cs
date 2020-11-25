using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// BasePage 的摘要说明
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected override void OnLoad(EventArgs e)
    {
        if (Session["userCode"] == null)
            ClientScript.RegisterStartupScript(this.GetType(), "", "window.open('index.aspx')", true);
        else
            base.OnLoad(e);
    }

    public int PageSize = 5;
    public BasePage()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
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