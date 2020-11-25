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

public partial class Yg_ZhEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定楼栋列表
            DropDownList1.DataTextField = "信息";
            DropDownList1.DataValueField = "楼栋代码";
            DropDownList1.DataSource=SQL.GetTable("select *,(楼栋名称 + '-' + 楼栋备注) as 信息 from 楼栋");
            DropDownList1.DataBind();
            if (Request.QueryString["ID"] != null)
            {
                //显示当前的住户信息
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 住户 where 住户代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["楼栋代码"].ToString();
                    TextBox10.Text = dt.Rows[0]["房间号"].ToString();
                    TextBox1.Text = dt.Rows[0]["户主"].ToString();
                    TextBox3.Text = dt.Rows[0]["房屋面积"].ToString();
                    TextBox4.Text = dt.Rows[0]["联系方式"].ToString();
                    if (dt.Rows[0]["房屋用途"].ToString() == "民用")
                    {
                        DropDownList2.SelectedIndex = 0;
                    }
                    else
                    {
                        DropDownList2.SelectedIndex = 1;
                    }
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("ZhList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //根据不同的标志 添加或修改 住户信息
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 住户 set 户主='"+ TextBox1.Text  +"',楼栋代码="+ DropDownList1.SelectedValue  +",房间号='"+ TextBox10.Text  +"',房屋面积='"+ TextBox3.Text  +"',联系方式='"+ TextBox4.Text  +"',房屋用途='"+ DropDownList2.SelectedItem.Text  +"' where 住户代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            SQL.ExecData("insert into 住户(户主,楼栋代码,房间号,房屋面积,联系方式,房屋用途,员工代码, 密码) values('" + TextBox1.Text + "',"+ DropDownList1.SelectedValue  +",'" + TextBox10.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','"+ DropDownList2.SelectedItem.Text  +"','"+ Session["员工代码"].ToString() +"', '123456')");
        }
        Response.Redirect("ZhList.aspx");
    }
}
