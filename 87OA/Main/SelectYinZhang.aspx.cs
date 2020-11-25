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

public partial class Main_SelectYinZhang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定所有印章
            DataSet MYDT = ZWL.DBUtility.DbHelperSQL.GetDataSet("select * from ERPYinZhang where YinZhangLeiBie='公共印章' or (YinZhangLeiBie='私人印章' and UserName='" + ZWL.Common.PublicMethod.GetSessionValue("UserName") + "')  order by YinZhangLeiBie asc");
            for (int i = 0; i < MYDT.Tables[0].Rows.Count; i++)
            {
                ListItem MyList = new ListItem();
                MyList.Text = MYDT.Tables[0].Rows[i]["YinZhangName"].ToString() + "(" + MYDT.Tables[0].Rows[i]["YinZhangLeiBie"].ToString() + ")";
                MyList.Value = MYDT.Tables[0].Rows[i]["ImgPath"].ToString();
                this.DropDownList1.Items.Add(MyList);
            }            
        }
        this.TextBox1.Focus();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ZWL.DBUtility.DbHelperSQL.GetSHSL("select YinZhangMiMa from ERPYinZhang where ImgPath='"+this.DropDownList1.SelectedValue.ToString()+"'") == this.TextBox1.Text)
        {
            //写入印章使用日志
            ZWL.BLL.ERPYinZhangLog MyModel = new ZWL.BLL.ERPYinZhangLog();
            MyModel.DoSomething = "用户使用印章：" + this.DropDownList1.SelectedItem.Text;
            MyModel.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyModel.TimeStr = DateTime.Now;
            MyModel.TypeStr = ZWL.DBUtility.DbHelperSQL.GetSHSL("select YinZhangLeiBie from ERPYinZhang where ImgPath='" + this.DropDownList1.SelectedValue.ToString() + "'");
            MyModel.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
            MyModel.Add();

            Response.Write("<script language=javascript>window.returnValue =\"" + this.DropDownList1.SelectedValue.ToString() + "\";window.close();</script>");
        }
        else
        {
            Response.Write("<script>alert('印章密码错误！');</script>");
            Response.Write("<script language=javascript> window.returnValue =\"\";</script>");
        }
    }
}
