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

namespace OA.aspx.NWorkFlow{ 
 public partial class DoWork: System.Web.UI.Page
{
    public string PiLiangSet = "";//批量设置字段的可写、保密属性
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.BLL.ERPNWorkToDo MyModel = new FTD.BLL.ERPNWorkToDo();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.WorkName;
            this.Label2.Text = MyModel.JieDianName;
            this.TextBox3.Text = MyModel.FormContent;

            FTD.Unit.PublicMethod.SetSessionValue("WenJianList", MyModel.FuJianList);
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));

            this.Label5.Text = MyModel.ShenPiYiJian;
            this.HyperLink1.NavigateUrl = "NWorkFlowReView.aspx?WorkFlowID=" + MyModel.WorkFlowID.ToString();

            //绑定常用审批
            FTD.DBUnit.DbHelperSQL.BindDropDownList2("select ContentStr from ERPShenPi where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'", this.DropDownList1, "ContentStr", "ContentStr");

            SetNodeInfoAndSet();
        }

        //刷新界面后，将label1赋值
        this.Label3.Text = this.TextBox3.Text;
    }

    /// <summary>
    /// 设置具体属性、当前判断权限、可写、保密等
    /// </summary>
    public void SetNodeInfoAndSet()
    {
        //当前开始节点是否有查看、编辑、删除按钮？当前按钮属性
        string NowNodeID = FTD.DBUnit.DbHelperSQL.GetSHSLInt("select JieDianID from ERPNWorkToDo where ID=" + Request.QueryString["ID"].ToString());
        FTD.BLL.ERPNWorkFlowNode MyJieDianNow = new FTD.BLL.ERPNWorkFlowNode();
        MyJieDianNow.GetModel(int.Parse(NowNodeID));
        if (MyJieDianNow.IFCanDel == "否")
        {
            this.iButton3.Visible = false;
        }
        if (MyJieDianNow.IFCanView == "否")
        {
            this.iButton4.Visible = false;
        }
        if (MyJieDianNow.IFCanEdit == "否")
        {
            this.iButton5.Visible = false;
        }
        if (MyJieDianNow.IFCanJump == "否")
        {
            this.Button3.Visible = false;
        }

        FTD.BLL.ERPNWorkToDo MyModelWork = new FTD.BLL.ERPNWorkToDo();
        MyModelWork.GetModel(int.Parse(Request.QueryString["ID"].ToString()));

        //获取当前表单对应的工作数据列
        string[] FormItemList = FTD.DBUnit.DbHelperSQL.GetSHSL("select top 1 ItemsList from ERPNForm where ID=" + MyModelWork.FormID.ToString()).Split('|');
        //获取当前节点的可写权限、保密权限
        string CanWriteStr = MyJieDianNow.CanWriteSet;
        string SecretStr = MyJieDianNow.SecretSet;

        for (int ItemNum = 0; ItemNum < FormItemList.Length; ItemNum++)
        {
            if (FormItemList[ItemNum].ToString().Trim().Length > 0)
            {
                if (FTD.Unit.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), CanWriteStr) == false)//不属于可写字段
                {
                    PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=true;";//readOnly
                }
                else
                {
                    PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").disabled=false;";//readOnly
                }
                if (FTD.Unit.PublicMethod.StrIFIn(FormItemList[ItemNum].ToString(), SecretStr) == true)//属于保密字段
                {
                    PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").style.visibility=\"hidden\";";
                }
                else
                {
                    PiLiangSet = PiLiangSet + "document.getElementById(\"" + FormItemList[ItemNum].ToString().Split('_')[0] + "\").style.visibility=\"visible\";";
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //找到下一节点
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',OKUserList=OKUserList+'," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?DoType="+Request.QueryString["DoType"].ToString()+"&Type=0&ID=" + Request.QueryString["ID"].ToString());
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',OKUserList=OKUserList+'," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?DoType=" + Request.QueryString["DoType"].ToString() + "&Type=0&ID=" + Request.QueryString["ID"].ToString());
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',ShenPiYiJian='" + PiShiStr + "',StateNow='已被驳回' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;

            //发邮件通知发文拟稿人
            FTD.BLL.ERPLanEmail MyMail = new FTD.BLL.ERPLanEmail();
            MyMail.EmailContent = "您的工作已经被驳回！(" + this.Label1.Text + ")";
            MyMail.EmailState = "未读";
            MyMail.EmailTitle = "您的工作已经被驳回！(" + this.Label1.Text + ")"; ;
            MyMail.FromUser = "系统消息";
            MyMail.FuJian = "";
            MyMail.TimeStr = DateTime.Now;
            MyMail.ToUser = Mymodel.UserName;
            MyMail.Add();


            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "审批操作完成！", "NowWorkFlow.aspx");
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',ShenPiYiJian='" + PiShiStr + "',StateNow='已被驳回' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;

            //发邮件通知发文拟稿人
            FTD.BLL.ERPLanEmail MyMail = new FTD.BLL.ERPLanEmail();
            MyMail.EmailContent = "您的工作已经被驳回！(" + this.Label1.Text + ")";
            MyMail.EmailState = "未读";
            MyMail.EmailTitle = "您的工作已经被驳回！(" + this.Label1.Text + ")"; ;
            MyMail.FromUser = "系统消息";
            MyMail.FuJian = "";
            MyMail.TimeStr = DateTime.Now;
            MyMail.ToUser = Mymodel.UserName;
            MyMail.Add();


            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            FTD.Unit.MessageBox.ShowAndRedirect(this, "审批操作完成！", "NowWorkFlow.aspx");
        }
    }
    protected void iButton3_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    FTD.Unit.PublicMethod.SetSessionValue("WenJianList", FTD.Unit.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Value, "").Replace("||", "|"));
                }
            }
            FTD.Unit.PublicMethod.BindDDL(this.CheckBoxList1, FTD.Unit.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
    protected void iButton4_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/ReadFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Value + "');</script>");
            }
        }
        catch
        { }
    }
    protected void iButton5_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.CheckBoxList1.SelectedItem.Text.Trim().Length > 0)
            {
                Response.Write("<script>window.open('../DsoFramer/EditFile.aspx?FilePath=" + this.CheckBoxList1.SelectedItem.Value + "');</script>");
            }
        }
        catch
        { }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        //找到下一节点
        string FileNameStr = FTD.Unit.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',OKUserList=OKUserList+'," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?DoType=" + Request.QueryString["DoType"].ToString() + "&Type=1&ID=" + Request.QueryString["ID"].ToString());
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            string PiShiStr = "<font color=#0000FF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "&nbsp;" + DateTime.Now.ToString() + "&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>" + this.Label5.Text;
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPNWorkToDo set FuJianList='" + FTD.Unit.PublicMethod.GetSessionValue("WenJianList") + "',OKUserList=OKUserList+'," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            FTD.BLL.ERPNWorkToDo Mymodel = new FTD.BLL.ERPNWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?DoType=" + Request.QueryString["DoType"].ToString() + "&Type=1&ID=" + Request.QueryString["ID"].ToString());
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PrintWork.aspx?ID=" + Request.QueryString["ID"].ToString());
    }
}
}