using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_LiuYanD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string ID = Request.QueryString["ID"].ToString();
         string sql = "delete from TB_LiuYan where MessageID=" + ID;
        bool b = DBHelper.ExecSql(sql);
        if (b)
        {
            Response.Write("<script>javascript:alert('操作成功');window.navigate('LiuYanMangager.aspx');</script>");
        }
        else
        {
            Response.Write("<script>javascript:alert('操作失败');window.navigate('LiuYanMangager.aspx');</script>");
        }
    }
}