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

namespace OA.aspx.Main{ 
 public partial class SelectYinZhang: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //绑定所有印章
            DataSet MYDT = FTD.DBUnit.DbHelperSQL.GetDataSet("select * from ERPYinZhang where YinZhangLeiBie='公共印章' or (YinZhangLeiBie='私人印章' and UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "')  order by YinZhangLeiBie asc");
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
        if (FTD.DBUnit.DbHelperSQL.GetSHSL("select YinZhangMiMa from ERPYinZhang where ImgPath='"+this.DropDownList1.SelectedValue.ToString()+"'") == this.TextBox1.Text)
        {
            //写入印章使用日志
            FTD.BLL.ERPYinZhangLog MyModel = new FTD.BLL.ERPYinZhangLog();
            MyModel.DoSomething = "用户使用印章：" + this.DropDownList1.SelectedItem.Text;
            MyModel.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyModel.TimeStr = DateTime.Now;
            MyModel.TypeStr = FTD.DBUnit.DbHelperSQL.GetSHSL("select YinZhangLeiBie from ERPYinZhang where ImgPath='" + this.DropDownList1.SelectedValue.ToString() + "'");
            MyModel.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyModel.Add();

            //Response.Write("<script language=javascript>window.returnValue =\"" + this.DropDownList1.SelectedValue.ToString() + "\";window.close();</script>");

            Response.Write("<script language=javascript>if(window.opener != undefined){window.opener.returnValue=\"" + this.DropDownList1.SelectedValue.ToString() + "\";window.opener.close();}else{window.returnValue =\"" + this.DropDownList1.SelectedValue.ToString() + "\";}window.close();</script>");

            //for chrome 
            //if (window.opener != undefined)
            //{ //window.opener的值在谷歌浏览器下面不为空，在IE/火狐下面是未定义，由此判断是否是谷歌浏览器 
                //window.opener.returnValue = flag; //谷歌浏览器下给返回值赋值的方法window.opener.close(); //这里必须关闭一次，否则执行下面的window.close()无法关闭弹出窗口，因为谷歌浏览器下弹出窗口是个新的window 
            //}
            //else
            //{
            //    window.returnValue = flag; //这种赋值方法兼容IE/火狐，但不支持谷歌浏览器 
            //}
            //window.close(); 
        }
        else
        {
            Response.Write("<script>alert('印章密码错误！');</script>");
            Response.Write("<script language=javascript> window.returnValue =\"\";</script>");
        }
    }
}
}