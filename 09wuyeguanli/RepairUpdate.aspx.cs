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

public partial class RepairUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定逐户列表
            DropDownList1.DataTextField = "信息";
            DropDownList1.DataValueField = "住户代码";
            DropDownList1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 and 住户.户主='" + Session["UserName"].ToString() + "'");
            DropDownList1.DataBind();
            TextBox1.Text = DateTime.Now.Date.ToShortDateString();
            //显示当前的报修信息
            if (Request.QueryString["ID"] != null)
            {
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 住户报修 where 报修代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["住户代码"].ToString();
                    TextBox1.Text = Convert.ToDateTime(dt.Rows[0]["报修时间"].ToString()).Date.ToShortDateString();
                    TextBox4.Text = dt.Rows[0]["问题描述"].ToString();
                    TextBox2.Text = dt.Rows[0]["参与的人员"].ToString();
                    for (int i = 0; i < DropDownList2.Items.Count; i++)
                    {
                        if (DropDownList2.Items[i].Text == dt.Rows[0]["是否解决"].ToString())
                        {
                            DropDownList2.SelectedIndex = i;
                        }
                    }
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //根据不同的标志  添加或修改 住户报修
        if (Request.QueryString["ID"] != null)
        {
            SQL.ExecData("update 住户报修 set 住户代码=" + DropDownList1.SelectedValue + ",问题描述='" + this.TextBox4.Text + "',是否解决='" + DropDownList2.SelectedItem.Text + "',参与的人员='" + TextBox2.Text + "' where 报修代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            SQL.ExecData("insert into 住户报修(报修时间,住户代码,问题描述,是否解决,参与的人员,员工代码) values('" + TextBox1.Text + "'," + DropDownList1.SelectedValue + ",'" + TextBox4.Text + "','" + DropDownList2.SelectedItem.Text + "','" + TextBox2.Text + "','" + Session["员工代码"].ToString() + "')");
        }
        Response.Redirect("Repair.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("Repair.aspx");
    }
}
