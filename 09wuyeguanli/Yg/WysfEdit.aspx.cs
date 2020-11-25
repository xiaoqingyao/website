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

public partial class Yg_WysfEdit : System.Web.UI.Page
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
            dt = SQL.GetTable("select ID from 物业费明细 where 住户代码=" + DropDownList1.SelectedValue + " and 是否缴费=0");
            if (dt.Rows.Count > 0)
            {
                //添加新的收费数据
                SQL.ExecData("insert into 物业费(收费单号,收费时间,住户代码,收费金额,收费内容,员工代码) values('" + Tdh.InnerHtml + "','" + TextBox1.Text + "'," + DropDownList1.SelectedValue + "," + TextBox3.Text + ",'" + TextBox4.Text + "','" + Session["员工代码"].ToString() + "')");
                SQL.ExecData("UPDATE 物业费明细 SET 是否缴费 = 1 WHERE ID=" + dt.Rows[0][0].ToString());
                Response.Write("<script>alert('交费成功!');window.location.href='WysfEdit.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('没有住户的收费数据!');</script>");
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != this.DropDownList1.Items.Count - 1)
        {
            //显示当前的住户未缴费信息
            DataTable dt = new DataTable();
            dt = SQL.GetTable("select * from 物业费明细 where 住户代码=" + DropDownList1.SelectedValue + " and 是否缴费=0");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["管理费"].ToString() != "0")
                {
                    CheckBoxList1.Items[0].Selected = true;
                    TextBox3.Text = (Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(CheckBoxList1.Items[0].Value)).ToString();
                }
                if (dt.Rows[0]["绿化养护费"].ToString() != "0")
                {
                    CheckBoxList1.Items[1].Selected = true;
                    TextBox3.Text = (Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(CheckBoxList1.Items[1].Value)).ToString();
                }
                if (dt.Rows[0]["道路养护费"].ToString() != "0")
                {
                    CheckBoxList1.Items[2].Selected = true;
                    TextBox3.Text = (Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(CheckBoxList1.Items[2].Value)).ToString();
                }
                if (dt.Rows[0]["安保费"].ToString() != "0")
                {
                    CheckBoxList1.Items[3].Selected = true;
                    TextBox3.Text = (Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(CheckBoxList1.Items[3].Value)).ToString();
                }
                if (dt.Rows[0]["设备折旧费"].ToString() != "0")
                {
                    CheckBoxList1.Items[4].Selected = true;
                    TextBox3.Text = (Convert.ToInt32(TextBox3.Text) + Convert.ToInt32(CheckBoxList1.Items[4].Value)).ToString();
                }
            }
            else
            {
                CheckBoxList1.Items[0].Selected = false;
                CheckBoxList1.Items[1].Selected = false;
                CheckBoxList1.Items[2].Selected = false;
                CheckBoxList1.Items[3].Selected = false;
                CheckBoxList1.Items[4].Selected = false;
                TextBox3.Text = "0";
            }
        }
        else
        {
            CheckBoxList1.Items[0].Selected = false;
            CheckBoxList1.Items[1].Selected = false;
            CheckBoxList1.Items[2].Selected = false;
            CheckBoxList1.Items[3].Selected = false;
            CheckBoxList1.Items[4].Selected = false;
            TextBox3.Text = "0";
        }
    }
}
