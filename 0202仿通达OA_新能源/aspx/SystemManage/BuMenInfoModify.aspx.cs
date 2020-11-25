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

namespace OA.aspx.SystemManage{ 
 public partial class BuMenInfoModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPBuMen MyBuMen = new FTD.BLL.ERPBuMen();
            MyBuMen.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyBuMen.BuMenName;
            this.TextBox2.Text = MyBuMen.ChargeMan;
            this.TextBox3.Text = MyBuMen.TelStr;
            this.TextBox4.Text = MyBuMen.ChuanZhen;
            this.TextBox5.Text = MyBuMen.BackInfo;
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        if (FTD.Unit.PublicMethod.IFExists("BuMenName", "ERPBuMen", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox1.Text) == true)
        {
            FTD.BLL.ERPBuMen MyBuMen = new FTD.BLL.ERPBuMen();
            MyBuMen.ID = int.Parse(Request.QueryString["ID"].ToString());
            MyBuMen.BuMenName = this.TextBox1.Text;
            MyBuMen.ChargeMan = this.TextBox2.Text;
            MyBuMen.TelStr = this.TextBox3.Text;
            MyBuMen.ChuanZhen = this.TextBox4.Text;
            MyBuMen.BackInfo = this.TextBox5.Text;
            MyBuMen.DirID = int.Parse(Request.QueryString["DirID"].ToString());
            MyBuMen.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改部门信息(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "部门信息添加成功！", "BuMenInfo.aspx?View="+Request.QueryString["View"].ToString()+"&Type=" + Request.QueryString["Type"].ToString() + "&DirID=" + Request.QueryString["DirID"].ToString());
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该部门已经存在，请更换名称！");
        }
    }
}
}