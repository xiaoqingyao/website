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

public partial class UserBlogOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        if (!IsPostBack)
        {
            if (Request.Cookies["memberinfo"] != null)
            {
                DB.Bind_Dropdownlist("select * from PicClass", ddltype, "PicClassId", "PicClassName");
                if (!string.IsNullOrEmpty(id))
                {
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
            DataTable dt = DB.getDataTable("select * from Blog where BlogId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtBlogName.Text = dt.Rows[0]["BlogName"].ToString();
                ddltype.SelectedValue = dt.Rows[0]["typeId"].ToString();
                txtContent.Value = DB.ConvertStringToHtml(dt.Rows[0]["jieshao"].ToString());
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
            if (chktitle())
            {
                Common.ShowMessage(this.Page, "标题中含有非法词语，请修改！", "");
                txtBlogName.Focus();
                return;
            }

            string memberid = Server.UrlDecode(Request.Cookies["memberinfo"]["MemberId"]);
            string username = Server.UrlDecode(Request.Cookies["memberinfo"]["UserName"]);
            string sql2 = string.Empty;
            if (string.IsNullOrEmpty(id))//添加
            {
                sql2 = "insert into Blog(BlogName,typeId,typeName,jieshao,memberid,username) ";
                sql2 += "values('" + txtBlogName.Text + "','" + ddltype.SelectedItem.Value + "','" + ddltype.SelectedItem.Text + "','" + DB.ConvertHtmlToString(txtContent.Value) + "','" + memberid + "','" + username + "')";
            }
            else//修改
            {
                sql2 = "update Blog set BlogName='{0}',typeId='{1}',typeName='{2}',jieshao='{3}' where BlogId=" + id;
                sql2 = string.Format(sql2, txtBlogName.Text, ddltype.SelectedItem.Value, ddltype.SelectedItem.Text, DB.ConvertHtmlToString(txtContent.Value));
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "userBlogmanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。" + ex.Message, "");
            return;
        }
    }

    private bool chktitle()
    {
        bool flag = false;
        string tit = txtBlogName.Text;
        DataTable dt = DB.getDataTable("select * from feifa");
        foreach (DataRow dr in dt.Rows)
        {
            if (tit.IndexOf(dr[1].ToString()) >= 0)
            {
                flag = true;
                break;
            }
        }

        return flag;
    }


}
