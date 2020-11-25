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

public partial class Yg_ZhtsEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request["role"] != null && Request["role"].ToString() == "yz")
            {
                //业主自己添加
                DropDownList1.DataTextField = "信息";
                DropDownList1.DataValueField = "住户代码";
                DropDownList1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.住户代码='" + Session["UserCode"].ToString() + "'");
                DropDownList1.DataBind();
                TextBox1.Text = DateTime.Now.Date.ToShortDateString();
                trCanYuRenYuan.Style.Add("display", "none");
                trJieJue.Style.Add("display", "none");
                this.Button2.Visible = false;
            }
            else
            {
                //物业管理人员添加
                //绑定逐户列表
                DropDownList1.DataTextField = "信息";
                DropDownList1.DataValueField = "住户代码";
                DropDownList1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.员工代码='" + Session["员工代码"].ToString() + "'");
                DropDownList1.DataBind();
                TextBox1.Text = DateTime.Now.Date.ToShortDateString();
            }
            //显示当前的报修信息
            if (Request.QueryString["ID"] != null)
            {
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 住户投诉 where 投诉代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["住户代码"].ToString();
                    TextBox1.Text = dt.Rows[0]["投诉日期"].ToString();
                    TextBox4.Text = dt.Rows[0]["投诉内容"].ToString();
                    TextBox2.Text = dt.Rows[0]["参与人员"].ToString();
                    for (int i = 0; i < DropDownList2.Items.Count; i++)
                    {
                        if (DropDownList2.Items[i].Text == dt.Rows[0]["是否处理"].ToString())
                        {
                            DropDownList2.SelectedIndex = i;
                        }
                    }
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("ZhtsList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //根据不同的标志  添加或修改 住户报修
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 住户投诉 set 住户代码=" + DropDownList1.SelectedValue + ",投诉内容='" + this.TextBox4.Text + "',是否处理='" + DropDownList2.SelectedItem.Text + "',参与人员='" + TextBox2.Text + "' where 投诉代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            if (Request["role"] != null && Request["role"].ToString() == "yz")
            {
                //业主自己添加
                SQL.ExecData("insert into 住户投诉(投诉日期,住户代码,投诉内容,是否处理,参与人员,员工代码) select '" + TextBox1.Text + "'," + DropDownList1.SelectedValue + ",'" + TextBox4.Text + "','" + DropDownList2.SelectedItem.Text + "','" + TextBox2.Text + "',(select 员工代码 from 住户 where 住户代码='" + Session["UserCode"] + "') as ygdm ");
                Response.Redirect("../Complaint.aspx");
            }
            else
            {
                SQL.ExecData("insert into 住户投诉(投诉日期,住户代码,投诉内容,是否处理,参与人员,员工代码) values('" + TextBox1.Text + "'," + DropDownList1.SelectedValue + ",'" + TextBox4.Text + "','" + DropDownList2.SelectedItem.Text + "','" + TextBox2.Text + "','" + Session["员工代码"].ToString() + "')");
                Response.Redirect("ZhtsList.aspx");
            }

        }

    }
}