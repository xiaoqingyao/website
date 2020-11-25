using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Yg_CwInfoEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定楼栋列表
            DropDownList1.DataTextField = "信息";
            DropDownList1.DataValueField = "楼栋代码";
            DropDownList1.DataSource = SQL.GetTable("select *,(楼栋名称 + '-' + 楼栋备注) as 信息 from 楼栋");
            DropDownList1.DataBind();
            if (Request.QueryString["ID"] != null)
            {
                //显示当前的住户信息
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 车位信息 where ID=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["楼栋代码"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[0]["车位"].ToString();
                    TextBox3.Text = dt.Rows[0]["车位名称"].ToString();
                    TextBox1.Text = dt.Rows[0]["车位大小"].ToString();
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        //根据不同的标志 添加或修改 住户信息
        if (Request.QueryString["ID"] != null)
        {
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select * from 车位信息 where ID=" + Request.QueryString["ID"] + "");
            if (dt.Rows.Count == 1)
            {
                SQL.ExecData("update 车位信息 set 楼栋代码=" + DropDownList1.SelectedValue + ",车位名称='" + TextBox3.Text + "',车位大小='" + TextBox1.Text + "',车位='" + DropDownList2.SelectedValue + "' where ID=" + Request.QueryString["ID"] + "");
            }
            else
            {
                Response.Write("<script>window.alert('不存在此车位！')</script>");
            }
        }
        else
        {
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select * from 车位信息 where 楼栋代码=" + DropDownList1.SelectedValue + " and 车位 = '" + DropDownList2.SelectedValue + "'");
            if (dt.Rows.Count == 0)
            {
                SQL.ExecData("insert into 车位信息(楼栋代码,车位, 车位名称,车位大小) values(" + DropDownList1.SelectedValue + ",'" + DropDownList2.SelectedValue + "','" + TextBox3.Text + "','" + TextBox1.Text + "')");
            }
            else
            {
                Response.Write("<script>window.alert('此车位已经存在！')</script>");
            }
        }
        Response.Redirect("CwInfoList.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //传递修改的标志 跳转页面
        Response.Redirect("CwInfoList.aspx");
    }
}
