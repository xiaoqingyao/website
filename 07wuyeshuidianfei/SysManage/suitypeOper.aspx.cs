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

public partial class SysManage_suitypeOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected string parentid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        parentid = Request.QueryString["parentid"];
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
            DataTable dt = DB.getDataTable("select * from suitype where suitypeId=" + id);
            if (dt.Rows.Count == 1)
            {
                suitypename.Text = dt.Rows[0]["suitypename"].ToString();
                
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

            if (string.IsNullOrEmpty(id))//添加
            {
                sql2 = "insert into suitype(suitypename,parentid) ";
                sql2 += "values('" + suitypename.Text + "'," + parentid + ")";
            }
            else//修改
            {
                sql2 = "update suitype set suitypename='{0}' where suitypeId=" + id;
                sql2 = string.Format(sql2, suitypename.Text);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "suitypemanage.aspx?parentid=" + parentid);
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。", "");
            return;
        }
    }

    
}