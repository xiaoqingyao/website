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
using System.Data.SqlClient;

public partial class UserXinOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                DB.Bind_Dropdownlist("select * from haoyou where memberid=" + Request.Cookies["memberinfo"]["MemberId"], tousername, "tousername", "tousername");
                if (!string.IsNullOrEmpty(id))
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["tousername"]))
                        tousername.SelectedValue = Request.QueryString["tousername"];

                    Get_Data();
                }
                
            }
            else
            {
                JavaScriptHelper.AlertAndRedirect("请先登录。", "userlogin.aspx");
                return;
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from Xin where XinId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtXinName.Text = dt.Rows[0]["XinName"].ToString();
                tousername.SelectedValue = dt.Rows[0]["tousername"].ToString();
            }
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "页面加载时出现异常。", "");
            return;
        }
    }

    /// <summary>
    /// 按钮事件：提交信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string memberid = Server.UrlDecode(Request.Cookies["memberinfo"]["MemberId"]);
            string username = Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"]);
            
            string sql2 = string.Empty;
            if (string.IsNullOrEmpty(id))//添加
            {
                sql2 = "insert into Xin(XinName,tousername,memberid,username) ";
                sql2 += "values('" + txtXinName.Text + "','" + tousername.SelectedValue + "','" + memberid + "','" + username + "')";
            }
            

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "发信成功！", "", "userXinmanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。" + ex.Message, "");
            return;
        }
    }
    


}
