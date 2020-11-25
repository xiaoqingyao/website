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
 public partial class SystemJiaoSeModify: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();

            //加载节点进入CheCkBoxList中
            FTD.Unit.PublicMethod.AddItmesInCheCKList(this.CheckBoxList1);

            FTD.BLL.ERPJiaoSe MyModel = new FTD.BLL.ERPJiaoSe();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.TextBox1.Text = MyModel.JiaoSeName;
            this.TextBox2.Text = MyModel.BackInfo;
            FTD.Unit.PublicMethod.GetCheckList(this.CheckBoxList1, MyModel.QuanXian);

            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Text.Trim() == "")
                {
                    this.CheckBoxList1.Items[i].Enabled = false;
                    this.CheckBoxList1.Items[i].Attributes.CssStyle.Add("DISPLAY", "none");
                }
            }
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        if (FTD.Unit.PublicMethod.IFExists("JiaoSeName", "ERPJiaoSe", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox1.Text) == true)
        {
            FTD.BLL.ERPJiaoSe MyModel = new FTD.BLL.ERPJiaoSe();
            MyModel.ID = int.Parse(Request.QueryString["ID"].ToString());
            MyModel.JiaoSeName = this.TextBox1.Text;
            MyModel.BackInfo = this.TextBox2.Text;
            MyModel.QuanXian = FTD.Unit.PublicMethod.GetStringFromCheckList(this.CheckBoxList1);
            MyModel.Update();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户修改角色信息(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "角色信息修改成功！", "SystemJiaoSe.aspx");
        }
        else
        {
            FTD.Unit.MessageBox.Show(this, "该角色名已经存在，请更换其他名称！");
        }
    }
}
}