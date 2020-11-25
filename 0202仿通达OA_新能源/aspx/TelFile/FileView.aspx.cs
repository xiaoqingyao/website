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

namespace OA.aspx.TelFile{ 
 public partial class FileView: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            FTD.DBUnit.DbHelperSQL.BindDropDownList2("select * from ERPJSDIC where UserName='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'", this.DropDownList1, "DicName", "ID");


            FTD.BLL.ERPTelFile MyModel = new FTD.BLL.ERPTelFile();
            MyModel.GetModel(int.Parse(Request.QueryString["ID"].ToString().Trim()));
            this.Label1.Text=MyModel.TitleStr;
            this.Label2.Text=MyModel.FromUser;
            this.Label3.Text=MyModel.TimeStr.ToString();
            this.Label4.Text=MyModel.ToUser;
            this.Label5.Text=MyModel.YiJieShouRen;
            this.Label6.Text=MyModel.FileType;
            this.Label7.Text = FTD.Unit.PublicMethod.GetWenJian(MyModel.FuJianStr, "../../UploadFile/");
            this.Label8.Text=MyModel.ContentStr;
            this.Label9.Text = MyModel.ChuanYueYiJian;

            //写系统日志
            FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
            MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
            MyRiZhi.DoSomething = "用户查看文件(" + this.Label1.Text + ")";
            MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
            MyRiZhi.Add();            
        }
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPTelFile set ChuanYueYiJian='" + this.Label9.Text + "<font color=#001EFF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "(" + DateTime.Now.ToString() + ")：</font>" + this.TextBox1.Text.Trim() + "<hr height=1px>" + "' where ID=" + Request.QueryString["ID"].ToString().Trim());
        this.Label9.Text = this.Label9.Text + "<font color=#001EFF>" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "(" + DateTime.Now.ToString() + ")：</font>" + this.TextBox1.Text.Trim() + "<hr height=1px>";
        this.TextBox1.Text = "";
        FTD.Unit.MessageBox.Show(this, "传阅意见添加成功！");
    }
    protected void iButton2_Click(object sender, EventArgs e)
    {
        if (this.Label5.Text.Trim().Length > 0)
        {
            //判断是否在"已接收人"列表中存在
            if (FTD.Unit.PublicMethod.StrIFIn("," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + ",", "," + this.Label5.Text + ",") == false)
            {
                FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPTelFile set QianShouHouIDList=QianShouHouIDList+'," + this.DropDownList1.SelectedItem.Value.ToString() + "',YiJieShouRen=YiJieShouRen+'," + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' where ID=" + Request.QueryString["ID"].ToString().Trim());
            }
            else
            {
                FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPTelFile set QianShouHouIDList=QianShouHouIDList+'," + this.DropDownList1.SelectedItem.Value.ToString() + "' where ID=" + Request.QueryString["ID"].ToString().Trim());
            }
        }
        else
        {
            FTD.DBUnit.DbHelperSQL.ExecuteSQL("update ERPTelFile set  QianShouHouIDList=QianShouHouIDList+'," + this.DropDownList1.SelectedItem.Value.ToString() + "',YiJieShouRen='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "' where ID=" + Request.QueryString["ID"].ToString().Trim());
        }
        FTD.Unit.MessageBox.Show(this, "传阅文件签收成功！");
    }

    public void btnDownloadFile_Click(object sender, EventArgs e)
    {
        try
        {
            FTD.Unit.PublicMethod.DownloadFile(Server.MapPath("~"), this.hdnFileURL.Value.Trim());
        }
        catch
        {
        }
    }
}}