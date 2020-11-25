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

public partial class Admin_CopmanyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //查询物业公司信息显示在页面
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select * from 物业公司信息");
            if (dt.Rows.Count > 0)
            {
                TextBox9.Text = dt.Rows[0]["公司名称"].ToString();
                TextBox10.Text = dt.Rows[0]["负责人"].ToString();
                TextBox4.Text = dt.Rows[0]["公司规模"].ToString();
                TextBox1.Text = dt.Rows[0]["联系电话"].ToString();
                TextBox2.Text = dt.Rows[0]["公司地址"].ToString();
                TextBox8.Text = dt.Rows[0]["物业公司介绍"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //更新物业公司信息
        SQL.ExecData("update 物业公司信息 set 公司名称='" + TextBox9.Text + "',负责人='" + TextBox10.Text + "',公司规模='" + TextBox4.Text + "',联系电话='" + TextBox1.Text + "',公司地址='" + TextBox2.Text + "',物业公司介绍='" + TextBox8.Text + "'");
        Response.Write("<script>alert('保存成功');</script>");
    }
}
