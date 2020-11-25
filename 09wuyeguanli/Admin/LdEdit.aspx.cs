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

public partial class Admin_LdEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                //显示楼栋信息
                DataTable dt = new DataTable();
                dt = SQL.GetTable("select * from 楼栋 where 楼栋代码=" + Request.QueryString["ID"] + "");
                if (dt.Rows.Count > 0)
                {
                    TextBox2.Text = dt.Rows[0]["楼栋名称"].ToString();
                    TextBox1.Text = dt.Rows[0]["楼栋备注"].ToString();
                    TextBox4.Text = dt.Rows[0]["楼栋电梯数量"].ToString();
                    TextBox5.Text = dt.Rows[0]["楼栋住户数量"].ToString();
                    TextBox3.Text = dt.Rows[0]["楼层数量"].ToString();
                  
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //跳转页面
        Response.Redirect("LdList.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断楼栋名称不能为空
        if (TextBox2.Text == "")
        {
            Terr.InnerHtml = "<font color='red'>楼栋名称不能为空</font>";
            return;
        }
        //根据标志  添加或修改 楼栋信息
        if (Request.QueryString["ID"] !=null)
        {
            //楼栋信息是否重复
            if (SQL.GetTable("select * from 楼栋 where 楼栋名称='" + TextBox2.Text + "' and 楼栋代码<>" + Request.QueryString["ID"] + "").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>楼栋名称重复</font>";
                return;
            }
          
            SQL.ExecData("update 楼栋 set 楼栋名称='" + TextBox2.Text + "',楼栋备注='" + TextBox1.Text + "',楼层数量='" + TextBox3.Text + "',楼栋住户数量='" + TextBox5.Text + "', 楼栋电梯数量='" + TextBox4.Text + "' where 楼栋代码=" + Request.QueryString["ID"] + "");
        }
        else
        {
            //楼栋信息是否重复
            if (SQL.GetTable("select * from 楼栋 where 楼栋名称='" + TextBox2.Text + "'").Rows.Count > 0)
            {
                Terr.InnerHtml = "<font color='red'>楼栋名称重复</font>";
                return;
            }
            SQL.ExecData("insert into 楼栋(楼栋名称,楼栋备注,楼层数量,楼栋电梯数量,楼栋住户数量) values('" + TextBox2.Text + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "')");
            // SQL.ExecData("insert into 楼栋(楼栋名称,楼栋备注,楼层数量,楼栋电梯数量,楼栋住户数量) values('" + TextBox2.Text + "','" + TextBox1.Text + "'，'" + TextBox3.Text + "','" + TextBox5.Text + "','" + TextBox4.Text + "')");
        }
        Response.Redirect("LdList.aspx");
    }
}
