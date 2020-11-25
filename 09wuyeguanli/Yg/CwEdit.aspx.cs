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

public partial class Yg_CwEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定住户列表
            DropDownList1.DataTextField = "信息";
            DropDownList1.DataValueField = "住户代码";
            DropDownList1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.员工代码='" + Session["员工代码"].ToString() + "'");
            DropDownList1.DataBind();
            //绑定车位列表
            DropDownList2.DataTextField = "车位名称";
            DropDownList2.DataValueField = "ID";
            DropDownList2.DataSource = SQL.GetTable("select * from 车位信息 where 车位名称 not in (SELECT 车位名称 from 车位管理)");
            DropDownList2.DataBind();
            //显示当前的车位信息
            if (Request.QueryString["ID"] != null)
            {
                //绑定车位列表
                DropDownList2.DataTextField = "车位名称";
                DropDownList2.DataValueField = "ID";
                DropDownList2.DataSource = SQL.GetTable(@"select * from 车位信息 
                                      where 车位名称 not in (SELECT 车位名称 from 车位管理) 
                                      or 车位名称 = (SELECT 车位名称 from 车位管理 where 车位代码 = " + Request.QueryString["ID"] + ") ");
                DropDownList2.DataBind();
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 车位管理 where 车位代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["住户代码"].ToString();
                    DropDownList2.SelectedValue = SQL.GetTable(@"select ID from 车位信息 where 车位名称 = (SELECT 车位名称 from 车位管理 where 车位代码 = " + Request.QueryString["ID"] + ")").Rows[0][0].ToString();
                    TextBox3.Text = dt.Rows[0]["车牌号"].ToString();
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //根据标志 添加或修改 车位信息
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 车位管理 set 车位名称='" + DropDownList2.SelectedItem.Text + "',车牌号='" + TextBox3.Text + "' where 车位代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            SQL.ExecData("insert into 车位管理(车位名称,车牌号,住户代码,员工代码) values('" + DropDownList2.SelectedItem.Text + "','" + TextBox3.Text + "'," + DropDownList1.SelectedValue + ",'" + Session["员工代码"].ToString() + "')");
        }
        Response.Redirect("CwList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("CwList.aspx");
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
