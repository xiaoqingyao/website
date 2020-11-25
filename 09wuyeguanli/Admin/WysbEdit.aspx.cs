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

public partial class Admin_WysbEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                //显示当前的物业设备信息
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 物业设备 where 设备代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    TextBox2.Text = dt.Rows[0]["设备名称"].ToString();
                    TextBox1.Text = Convert.ToDateTime(dt.Rows[0]["购买时间"].ToString()).Date.ToShortDateString();
                    TextBox3.Text = dt.Rows[0]["数量"].ToString();
                    TextBox4.Text = dt.Rows[0]["设备描述"].ToString();
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("WysbList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //根据标志  添加或修改 物业设备
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 物业设备 set 设备名称='" + TextBox2.Text + "',购买时间='" + TextBox1.Text + "',数量=" + TextBox3.Text + ",设备描述='" + TextBox4.Text + "' where 设备代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            SQL.ExecData("insert into 物业设备(设备名称,购买时间,数量,设备描述) values('" + TextBox2.Text + "','" + TextBox1.Text + "',"+ TextBox3.Text  +",'"+ TextBox4.Text  +"')");
        }
        Response.Redirect("WysbList.aspx");
    }
}
