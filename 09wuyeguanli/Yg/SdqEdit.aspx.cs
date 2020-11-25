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

public partial class Yg_SdqEdit : System.Web.UI.Page
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
            DropDownList1.Items.Add(" ");
            DropDownList1.Items[this.DropDownList1.Items.Count - 1].Value = " ";
            DropDownList1.SelectedIndex = this.DropDownList1.Items.Count - 1;
            TextBox1.Text = DateTime.Now.Date.ToShortDateString();
            //初始化收费单号
            Tdh.InnerHtml = Guid.NewGuid().ToString();
            Button1.Attributes.Add("onclick", "return confirm('确认信息是否正确?');");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != this.DropDownList1.Items.Count - 1)
        {
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select 收费单号 from 水电气费 where 住户代码=" + DropDownList1.SelectedValue + " and 是否缴费=0");
            if (dt.Rows.Count > 0)
            {
                SQL.ExecData("UPDATE 水电气费 SET 是否缴费 = 1 WHERE 收费单号='" + dt.Rows[0][0].ToString()+"'");
                Response.Write("<script>alert('交费成功!');window.location.href='SdqEdit.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('没有住户的收费数据!');</script>");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //计算 水电气费的总和
        TextBox7.Text = Convert.ToString(Convert.ToDouble(TextBox2.Text) + Convert.ToDouble(TextBox3.Text) + Convert.ToDouble(TextBox5.Text));
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != this.DropDownList1.Items.Count - 1)
        {
            //显示当前的住户未缴费信息
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select * from 水电气费 where 住户代码=" + DropDownList1.SelectedValue + " and 是否缴费=0");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["水费金额"].ToString() != "0")
                {
                    TextBox3.Text = dt.Rows[0]["水费金额"].ToString();
                }
                if (dt.Rows[0]["电费金额"].ToString() != "0")
                {
                    TextBox2.Text = dt.Rows[0]["电费金额"].ToString();
                }
                if (dt.Rows[0]["气费金额"].ToString() != "0")
                {
                    TextBox5.Text = dt.Rows[0]["气费金额"].ToString();
                }
                if (dt.Rows[0]["收费总额"].ToString() != "0")
                {
                    TextBox7.Text = dt.Rows[0]["收费总额"].ToString();
                }
            }
            else
            {
                TextBox3.Text = "0";
                TextBox2.Text = "0";
                TextBox5.Text = "0";
                TextBox7.Text = "0";
            }
        }
        else
        {
            TextBox3.Text = "0";
            TextBox2.Text = "0";
            TextBox5.Text = "0";
            TextBox7.Text = "0";
        }
    }
}
