using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GoodsD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request.QueryString["ID"].ToString();
        string sql = "delete from tb_Goods where GoodsID='" + ID + "'";
        bool b = DBHelper.ExecSql(sql);
        if (b)
        {
            Response.Write("<script>javascript:alert('操作成功');window.navigate('Goods_List.aspx');</script>");
        } 
        else
        {
            Response.Write("<script>javascript:alert('操作失败');window.navigate('Goods_List.aspx');</script>");
        } 
    } 
} 