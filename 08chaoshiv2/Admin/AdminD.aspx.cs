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

public partial class AdminD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int ID = Convert.ToInt32(Request.QueryString["ID"].ToString());
        string sql = "delete from TB_Admin where ID='" + ID + "'";
       bool B = DBHelper.ExecSql(sql);
       if (B)
        {
            Response.Write("<script>javascript:alert('操作成功');window.navigate('Admin_List.aspx');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('操作失败');window.navigate('Admin_List.aspx');</script>");
        }
    }
}
