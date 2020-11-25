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

public partial class SysManage_NewsOper : System.Web.UI.Page
{
    string id = string.Empty;
    protected string typeid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"];
        typeid = Request.QueryString["typeid"];
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(id))
            {
                //Image1.Visible = true;
                Get_Data();
            }
            else
            {
                //Image1.Visible = false;
            }
        }
    }

    void Get_Data()
    {
        try
        {
            DataTable dt = DB.getDataTable("select * from News where NewsId=" + id);
            if (dt.Rows.Count == 1)
            {
                txtTitle.Text = dt.Rows[0]["Title"].ToString();
                txtContent.Value = DB.ConvertStringToHtml(dt.Rows[0]["Content"].ToString());
                //Image1.ImageUrl = ".." + dt.Rows[0]["PicAddress"].ToString();
            }
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "页面加载时出现异常。" + ex, "");
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
            string typename = typeid == "1" ? "系统广播" : "信息";
            string picaddress = string.Empty;
            string sql2 = string.Empty;

            if (string.IsNullOrEmpty(id))//添加
            {
                sql2 = "insert into News(Title,Content,typeid,typename) ";
                sql2 += "values('" + txtTitle.Text + "','" + DB.ConvertHtmlToString(txtContent.Value) + "','" + typeid + "','" + typename + "')";
            }
            else//修改
            {
                sql2 = "update News set Title='{0}',Content='{1}',typeid='{2}',typename='{3}' where NewsId=" + id;
                sql2 = string.Format(sql2, txtTitle.Text, DB.ConvertHtmlToString(txtContent.Value), typeid, typename);
            }

            SqlConnection cn = DB.OpenConnection();
            SqlCommand cmd = new SqlCommand(sql2, cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            cn.Dispose();
            Common.ShowMessage(this.Page, "信息保存成功！", "", "newsmanage.aspx?typeid=" + typeid);
        }
        catch (Exception ex)
        {
            Common.ShowMessage(this.Page, "信息保存失败，请稍后重试。" + ex.Message, "");
            return;
        }
    }

}
