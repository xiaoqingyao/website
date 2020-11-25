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

public partial class Admin_WyfSee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定住户信息
            DropDownList1.DataTextField = "信息";
            DropDownList1.DataValueField = "住户代码";
            DropDownList1.DataSource = SQL.GetTable("select (楼栋名称 + 房间号 + '--' + 户主 + '--面积：' +  房屋面积 + '--' + 房屋用途) as 信息,* from 住户,楼栋 where 住户.楼栋代码=楼栋.楼栋代码 ");
            DropDownList1.DataBind();
            if (Request.QueryString["ID"] != null)
            {
                //显示当前的物业费信息
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 物业费 where 收费单号 ='"+ Request.QueryString["ID"] +"'");
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.SelectedValue = dt.Rows[0]["住户代码"].ToString();
                    TextBox1.Text = Convert.ToDateTime(dt.Rows[0]["收费时间"].ToString()).Date.ToShortDateString(); 
                    TextBox3.Text  = dt.Rows[0]["收费金额"].ToString();
                    TextBox4.Text  = dt.Rows[0]["收费内容"].ToString();
                    Tdh.InnerHtml = dt.Rows[0]["收费单号"].ToString(); 
                }
                Button1.Attributes.Add ("onclick","return confirm('您确实要作废此单据么?');"); 
            }

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("WyfList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //删除当前的物业费信息
        SQL.ExecData("delete from 物业费 where 收费单号='" + Request.QueryString["ID"] + "'");
        Response.Redirect("WyfList.aspx");
    }
}
