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

public partial class Yg_SdfEdit : System.Web.UI.Page
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
            TextBox1.Text = DateTime.Now.Date.ToShortDateString();
            //初始化收费单号
            Tdh.InnerHtml = Guid.NewGuid().ToString();
            Button1.Attributes.Add("onclick", "return confirm('确认信息是否正确?');");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.TextBox2.Text == string.Empty)
        {
            Response.Write("<script>alert('请输入电费的缴费金额！!');</script>");
        }
        else if (this.TextBox3.Text == string.Empty)
        {
            Response.Write("<script>alert('请输入水费的缴费金额！!');</script>");
        }
        else if (this.TextBox5.Text == string.Empty)
        {
            Response.Write("<script>alert('请输入气费的缴费金额！!');</script>");
        }
        else
        {
            //保存收费数据 提示成功
            Button2_Click(sender, e);
            SQL.ExecData("insert into 水电气费(收费单号,收费时间,住户代码,水费金额,电费金额,气费金额,收费月份,收费总额,员工代码) values('" + Tdh.InnerHtml + "','" + TextBox1.Text + "'," + DropDownList1.SelectedValue + "," + TextBox3.Text + "," + TextBox2.Text + "," + TextBox5.Text + ",'" + TextBox6.Text + "'," + TextBox7.Text + ",'" + Session["员工代码"].ToString() + "')");
            Response.Write("<script>alert('交费成功!');window.location.href='SdqEdit.aspx';</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            //计算 水电气费的总和
            TextBox7.Text = Convert.ToString(Convert.ToDouble(TextBox2.Text) + Convert.ToDouble(TextBox3.Text) + Convert.ToDouble(TextBox5.Text));
        }
    catch
    { 
    Response.Write("qingshuruzhengqugeshi");
}
}
}
