using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

namespace OA.aspx.Moa.NetMail{ 
 public partial class NetMailShou: System.Web.UI.Page
{
    public List<ERPNetEmail> EmailList = new List<ERPNetEmail>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();
            if (!String.IsNullOrEmpty(Request.QueryString["method"]))
            {
                //收取Internet中的邮件
                DateTime MaxDate = DateTime.MinValue;
                try
                {
                    MaxDate = DateTime.Parse(FTD.DBUnit.DbHelperSQL.GetSHSL("select max(TimeStr) from ERPNetEmail where ToUser='" + FTD.Unit.PublicMethod.GetSessionValue("UserName") + "'"));
                }
                catch
                { }
                //获取现有设置
                FTD.BLL.ERPPOPAndSMTP MyModel = new FTD.BLL.ERPPOPAndSMTP();
                MyModel.GetModel(int.Parse(FTD.Unit.PublicMethod.GetSessionValue("UserID")));
                try
                {
                    Pop3ForJmail.GetNewMailIntoDataBase(MyModel.POP3UserName, MyModel.POP3UserPwd, MyModel.POP3Server, int.Parse(MyModel.POP3Port), MaxDate);
                    Response.Write("<script>alert('邮件收取完毕！');</script>");
                }
                catch (Exception ee)
                {
                    string ErrMsg = ee.Message.ToString();
                    Response.Write("<script>alert('" + ErrMsg + "');</script>");
                }

                DataBindToGridview();
            }
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPNetEmail MyLanEmail = new FTD.BLL.ERPNetEmail();
        var T = context.ERPNetEmail.Where(p => p.ToUser == FTD.Unit.PublicMethod.GetSessionValue("UserName") && (p.EmailState == "未读" || p.EmailState == "已读")).OrderByDescending(p => p.ID);
        EmailList = T.ToList();
    }
    protected void iButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("NetEmailAdd.aspx");
    }

    protected void iButton5_Click(object sender, EventArgs e)
    {

    }
}}