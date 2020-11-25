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

public partial class Yg_WyfEdit : System.Web.UI.Page
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
            //TextBox1.Text = DateTime.Now.Date.ToShortDateString();
            //初始化收费单号
            //Tdh.InnerHtml = Guid.NewGuid().ToString();
            Button1.Attributes.Add("onclick", "return confirm('确认信息是否正确?');");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int shoufei1 = 0;
        int shoufei2 = 0;
        int shoufei3 = 0;
        int shoufei4 = 0;
        int shoufei5 = 0;
        if (CheckBoxList1.Items[0].Selected)
            shoufei1 = Convert.ToInt32(CheckBoxList1.Items[0].Value);
        if (CheckBoxList1.Items[1].Selected)
            shoufei2 = Convert.ToInt32(CheckBoxList1.Items[1].Value);
        if (CheckBoxList1.Items[2].Selected)
            shoufei3 = Convert.ToInt32(CheckBoxList1.Items[2].Value);
        if (CheckBoxList1.Items[3].Selected)
            shoufei4 = Convert.ToInt32(CheckBoxList1.Items[3].Value);
        if (CheckBoxList1.Items[4].Selected)
            shoufei5 = Convert.ToInt32(CheckBoxList1.Items[4].Value);
        //添加新的收费数据
        SQL.ExecData("insert into 物业费明细(住户代码,管理费,绿化养护费,道路养护费,安保费,设备折旧费,物业费缴费年度,总金额) values(" + DropDownList1.SelectedValue + "," + shoufei1 + "," + shoufei2 + "," + shoufei3 + "," + shoufei4 + "," + shoufei5 + ",'" + TextBox1.Text + "'," + TextBox3.Text + ")");
        Response.Write("<script>window.location.href='WyfList.aspx';</script>");
    }
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int sum = 0;
        for (int index = 0; index < CheckBoxList1.Items.Count; index++)
        {
            if (CheckBoxList1.Items[index].Selected)
            {
                sum += Convert.ToInt32(CheckBoxList1.Items[index].Value);
            }
        }
        TextBox3.Text = sum.ToString();
    }
}
