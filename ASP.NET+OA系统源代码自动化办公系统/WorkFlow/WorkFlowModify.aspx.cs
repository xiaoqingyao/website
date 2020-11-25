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

public partial class WorkFlow_WorkFlowModify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //绑定表单、归档类型
            SDLX.DBUtility.DbHelperSQL.BindDropDownList("select FormName from ERPForm", this.DropDownList1, "FormName", "FormName");
            SDLX.Common.PublicMethod.BindDDL(this.DropDownList2, SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 FormTypeList from ERPFormType"));

            SDLX.BLL.ERPWorkFlow MyModel = new SDLX.BLL.ERPWorkFlow();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            DropDownList1.SelectedValue = MyModel.FormName;
            DropDownList2.SelectedValue = MyModel.GuiDangType;
            this.TextBox3.Text = MyModel.JianJie;
            this.TextBox2.Text = MyModel.UserList;
            this.TextBox1.Text = MyModel.WorkFlowName;
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //判断工作流名称是否唯一性
        if (SDLX.Common.PublicMethod.IFExists("WorkFlowName", "ERPWorkFlow", int.Parse(Request.QueryString["ID"].ToString()), this.TextBox1.Text) == false)
        {
            SDLX.Common.MessageBox.Show(this, "该工作流名称已经存在！");
            return;
        }

        SDLX.BLL.ERPWorkFlow Model = new SDLX.BLL.ERPWorkFlow();
        Model.ID = int.Parse(Request.QueryString["ID"].ToString());
        Model.FormName = this.DropDownList1.SelectedItem.Text;
        Model.GuiDangType = this.DropDownList2.SelectedItem.Text;
        Model.JianJie = this.TextBox3.Text;
        Model.TimeStr = DateTime.Now;
        Model.UserList = this.TextBox2.Text;
        Model.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        Model.WorkFlowName = this.TextBox1.Text;
        Model.Update();

        //写系统日志
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户修改工作流程信息(" + this.TextBox1.Text + ")";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();

        SDLX.Common.MessageBox.ShowAndRedirect(this, "工作流程修改成功！", "WorkFlowManage.aspx");
    }
}