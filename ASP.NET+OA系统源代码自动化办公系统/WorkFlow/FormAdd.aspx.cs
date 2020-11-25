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

public partial class WorkFlow_FormAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            //设置条件字段列表为空
            SDLX.Common.PublicMethod.SetSessionValue("TiaoJiaoList", "");
            SDLX.Common.PublicMethod.BindDDL(this.DropDownList3, SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 FormTypeList from ERPFormType")); //绑定表单类别
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //判断名称是否唯一性
        if (SDLX.Common.PublicMethod.IFExists("FormName", "ERPForm",0, this.TextBox1.Text) == false)
        {
            SDLX.Common.MessageBox.Show(this, "该表单名称已经存在！");
            return;
        }

        if (this.TextBox1.Text.Trim().Length > 0)
        {
            SDLX.BLL.ERPForm Model = new SDLX.BLL.ERPForm();
            Model.ContentStr = this.TxtContent.Text;
            Model.FormName = this.TextBox1.Text;
            Model.FormType = this.DropDownList3.SelectedItem.Text;
            Model.ShiYongUserList = this.TextBox3.Text;
            Model.TiaoJianList = SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList");
            Model.TimeStr = DateTime.Now;
            Model.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            Model.Add();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户添加表单信息(" + this.TextBox1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            SDLX.Common.MessageBox.ShowAndRedirect(this, "表单信息添加成功！", "DesignForm.aspx");
        }
        else
        {
            SDLX.Common.MessageBox.Show(this, "表单标题不可以为空！");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (this.TextBox4.Text.Trim().Length > 0)
        {
            if (SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList").Trim() == "")
            {
                SDLX.Common.PublicMethod.SetSessionValue("TiaoJiaoList", this.TextBox4.Text + this.DropDownList2.SelectedItem.Text);
            }
            else
            {
                SDLX.Common.PublicMethod.SetSessionValue("TiaoJiaoList", SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList") + "|" + this.TextBox4.Text + this.DropDownList2.SelectedItem.Text);
            }
            SDLX.Common.PublicMethod.BindDDL(this.DropDownList1, SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList"));
            this.TextBox4.Text = "";
        }
        else
        {
            SDLX.Common.MessageBox.Show(this, "未填写字段名称！");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SDLX.Common.PublicMethod.SetSessionValue("TiaoJiaoList", SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList").Replace(this.DropDownList1.SelectedItem.Text, "").Replace("||", "|"));
            SDLX.Common.PublicMethod.BindDDL(this.DropDownList1, SDLX.Common.PublicMethod.GetSessionValue("TiaoJiaoList"));
        }
        catch
        { }
    }
}