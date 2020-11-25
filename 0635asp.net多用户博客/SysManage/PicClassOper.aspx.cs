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

public partial class SysManage_PicClassOper : System.Web.UI.Page
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
            DataTable dt = DB.getDataTable("select * from PicClass where PicClassId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtPicClassName.Text = dt.Rows[0]["PicClassName"].ToString();
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
                sql2 = "insert into PicClass(PicClassName) ";
                sql2 += "values('" + txtPicClassName.Text + "')";
            }
            else//修改
            {
                sql2 = "update PicClass set PicClassName='{0}' where PicClassId=" + id;
                sql2 = string.Format(sql2, txtPicClassName.Text);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "Picclassmanage.aspx");
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。"+ex.Message, "");
            return;
        }
    }
}
