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

public partial class SystemManage_SystemJiaoSeUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
            this.Label1.Text = Request.QueryString["JiaoSeName"].ToString();

            this.TextBox1.Text = ReturnUserInJiaoSe(Request.QueryString["JiaoSeName"].ToString());
        }
    }

    public string ReturnUserInJiaoSe(string JiaoSeName)
    {
        string ReturnStr = "";
        DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select UserName from ERPUser where ','+JiaoSe+','  like  '%," + JiaoSeName + ",%'");
        for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
        {
            if (ReturnStr.Trim().Length > 0)
            {
                ReturnStr =ReturnStr+","+ MYDT.Tables[0].Rows[i]["UserName"].ToString();
            }
            else
            {
                ReturnStr = MYDT.Tables[0].Rows[i]["UserName"].ToString();
            }
        }
        return ReturnStr;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //设置所有在文本框中的用户角色加上当前角色，先去掉所有角色，再加上对应角色
        string InitJiaoSeSql = "update ERPUser Set JiaoSe=','+JiaoSe+','";
        string RemoveJiaoSeSql = "update ERPUser Set JiaoSe=replace(JiaoSe,'," + Request.QueryString["JiaoSeName"].ToString() + ",',',') ";        
        //替换后，如果只有这个角色，那么替换后，只有 ， 所以加入一个，防止Sql运行出错
        string OKKTemp = "update ERPUser Set JiaoSe=',,' where JiaoSe=','";
        string OKJiaoSeSql1 = "update ERPUser Set JiaoSe=left(JiaoSe,len(JiaoSe)-1)";
        string OKJiaoSeSql2 = "update ERPUser Set JiaoSe=right(JiaoSe,len(JiaoSe)-1)";

        string AddJiaoSeSql1 = "update ERPUser Set JiaoSe='" + Request.QueryString["JiaoSeName"].ToString() + "'   where len(JiaoSe)<=1 and UserName in('" + this.TextBox1.Text.ToString().Replace(",", "','") + "')";
        string AddJiaoSeSql2 = "update ERPUser Set JiaoSe=JiaoSe+'," + Request.QueryString["JiaoSeName"].ToString() + "'   where len(JiaoSe)>1 and JiaoSe!='" + Request.QueryString["JiaoSeName"].ToString() + "' and UserName in('" + this.TextBox1.Text.ToString().Replace(",", "','") + "')";

        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(InitJiaoSeSql);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(RemoveJiaoSeSql);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(OKKTemp);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(OKJiaoSeSql1);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(OKJiaoSeSql2);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(AddJiaoSeSql1);
        ZWL.DBUtility.DbHelperSQL.ExecuteSQL(AddJiaoSeSql2);

        ZWL.Common.MessageBox.ShowAndRedirect(this, "角色用户设置成功！", "SystemJiaoSe.aspx");
    }
}
