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

public partial class SysManage_MemberOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(id))
            {
                Get_Data();
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from Member where MemberId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtMemberUser.Enabled = false;
                txtMemberUser.Text = dt.Rows[0]["username"].ToString();
                txtMemberPwd.Text = dt.Rows[0]["userpwd"].ToString();
                txtTitle.Text = dt.Rows[0]["membername"].ToString();
                tel.Text = dt.Rows[0]["tel"].ToString();
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
            string sql2 = string.Empty;
            string user = txtMemberUser.Text;

            if (string.IsNullOrEmpty(id))//添加
            {
                if (DB.getDataTable("select * from Member where username='" + user + "'").Rows.Count > 0)
                {
                    JavaScriptHelper.Alert("此帐号已存在。");
                    return;
                }
                else
                {
                    sql2 = "insert into Member(username,userpwd,membername,tel) ";
                    sql2 += "values('" + user + "','" + txtMemberPwd.Text + "','" + txtTitle.Text + "'," + tel.Text + "')";
                }
            }
            else//修改
            {
                sql2 = "update Member set membername='{0}',userpwd='{1}',tel='{2}' where MemberId=" + id;
                sql2 = string.Format(sql2, txtTitle.Text, txtMemberPwd.Text, tel.Text);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "Membermanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。", "");
            return;
        }
    }

}
