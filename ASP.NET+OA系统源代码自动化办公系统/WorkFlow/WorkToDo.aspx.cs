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

public partial class WorkFlow_WorkToDo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SDLX.Common.PublicMethod.CheckSession();
            SDLX.BLL.ERPWorkToDo MyModel = new SDLX.BLL.ERPWorkToDo();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            this.Label1.Text = MyModel.WorkName;
            this.Label2.Text = MyModel.JieDianName;
            this.Label3.Text = MyModel.FormContent;

            SDLX.Common.PublicMethod.SetSessionValue("WenJianList", MyModel.FuJianList);
            SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));

            this.Label5.Text = MyModel.ShenPiYiJian;

            //绑定常用审批
            SDLX.DBUtility.DbHelperSQL.BindDropDownList2("select ContentStr from ERPShenPi where UserName='"+SDLX.Common.PublicMethod.GetSessionValue("UserName")+"'", this.DropDownList1, "ContentStr", "ContentStr");
            if (SDLX.DBUtility.DbHelperSQL.GetSHSL("select IFDelFile from ERPWorkFlowJieDian where ID=" + MyModel.JieDianID.ToString()) == "否")
            {
                this.ImageButton3.Visible = false;
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //找到下一节点
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',TongGuoRenList=TongGuoRenList+'," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());
            
            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?Type=0&ID=" + Request.QueryString["ID"].ToString());            
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>" + this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',TongGuoRenList=TongGuoRenList+'," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?Type=0&ID=" + Request.QueryString["ID"].ToString());
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',ShenPiYiJian='" + PiShiStr + "',StateNow='已被驳回' where ID=" + Request.QueryString["ID"].ToString());

            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            SDLX.Common.MessageBox.ShowAndRedirect(this, "审批操作完成！", "../Main/Main.aspx");
        }
        else if(FileUpload1.PostedFile.FileName.Trim().Length<=0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>"+this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',ShenPiYiJian='" + PiShiStr + "',StateNow='已被驳回' where ID=" + Request.QueryString["ID"].ToString());

            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            SDLX.Common.MessageBox.ShowAndRedirect(this, "审批操作完成！", "../Main/Main.aspx");
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    SDLX.Common.PublicMethod.SetSessionValue("WenJianList", SDLX.Common.PublicMethod.GetSessionValue("WenJianList").Replace(this.CheckBoxList1.Items[i].Text, "").Replace("||", "|"));
                }
            }
            SDLX.Common.PublicMethod.BindDDL(this.CheckBoxList1, SDLX.Common.PublicMethod.GetSessionValue("WenJianList"));
        }
        catch
        { }
    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {

        //找到下一节点
        string FileNameStr = SDLX.Common.PublicMethod.UploadFileIntoDir(this.FileUpload1, DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName));
        if (FileNameStr.Trim().Length > 0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<br>审批附件：<a href=../UploadFile/" + FileNameStr + ">[右键下载]</a><hr>" + this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',TongGuoRenList=TongGuoRenList+'," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?Type=1&ID=" + Request.QueryString["ID"].ToString());
        }
        else if (FileUpload1.PostedFile.FileName.Trim().Length <= 0)
        {
            string PiShiStr = "<font color=#0000FF>" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "&nbsp;&nbsp;" + DateTime.Now.ToString() + "&nbsp;&nbsp;</font><BR>" + this.TextBox1.Text.ToString() + "<hr>" + this.Label5.Text;
            SDLX.DBUtility.DbHelperSQL.ExecuteSQL("update ERPWorkToDo set FuJianList='" + SDLX.Common.PublicMethod.GetSessionValue("WenJianList") + "',TongGuoRenList=TongGuoRenList+'," + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "',ShenPiYiJian='" + PiShiStr + "' where ID=" + Request.QueryString["ID"].ToString());

            SDLX.BLL.ERPWorkToDo Mymodel = new SDLX.BLL.ERPWorkToDo();
            Mymodel.GetModel(int.Parse(Request.QueryString["ID"].ToString()));
            Mymodel.ID = int.Parse(Request.QueryString["ID"].ToString());
            Mymodel.FormContent = this.TextBox3.Text;
            Mymodel.UpdateBD();

            //写系统日志
            SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
            MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户审批工作信息(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();

            Response.Redirect("GoToNextNode.aspx?Type=1&ID=" + Request.QueryString["ID"].ToString());
        }
    }
}
