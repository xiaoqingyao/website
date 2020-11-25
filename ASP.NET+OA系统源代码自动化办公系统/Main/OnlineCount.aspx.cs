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
using SDLX.DBUtility;
using System.Data.SqlClient;

public partial class OnlineCount : System.Web.UI.Page
{
    public string TiXingJianGe = "30";
    public string TanChuStr = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //检测需要发送信息提醒的项，如日程安排
            CheckRiCheng();

            //检测采购订单中的提醒            
            CheckCaiGou();

            //检测联系记录和送样记录中的提醒
            CheckLinkLog();
            CheckSongYang();

            //检测“CRM中的预计订单时间”，到日期则提醒，只提醒一次
            CheckCRMDingDan();

            //检测项目管理模块中的“项目提醒”和“收款提醒”
            CheckXiangMu();
            CheckShouKuan();

            SDLX.Common.PublicMethod.CheckSession();
            //刷新当前用户的激活时间
            DbHelperSQL.ExecuteSQL("update ERPUser set ActiveTime=getdate() where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "'");
            this.HyperLink1.Text = DbHelperSQL.GetSHSL("select count(*) from ERPUser where datediff(minute,ActiveTime,getdate())<10");

            //获得提醒的间隔时间，是否提醒
            SDLX.BLL.ERPTiXing MyModel = new SDLX.BLL.ERPTiXing();
            MyModel.GetModel(int.Parse(SDLX.Common.PublicMethod.GetSessionValue("UserID")));
            TiXingJianGe = MyModel.TiXingTime;

            //是否需要提醒
            string IFTanChu = MyModel.IfTiXing;
            //获取新邮件个数
            int NewMailCount = int.Parse(SDLX.DBUtility.DbHelperSQL.GetSHSLInt("select count(*) from ERPLanEmail where ToUser='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and EmailState='未读'"));
            this.HyperLink2.Text = NewMailCount.ToString();

            //需要提醒，弹出提醒窗口
            if (IFTanChu.Trim() == "是")
            {
                if (NewMailCount > 0)
                {
                    TanChuStr = "<script language=\"javascript\">var num=Math.random();var abc=screen.height-250;focusid=setTimeout(\"focus();window.showModelessDialog('SmsShow.aspx?rad=\" + num + \"','','scroll:1;status:0;help:0;resizable:0;dialogLeft:3px;dialogTop:\"+abc+\"px;dialogWidth:350px;dialogHeight:200px')\",0000)</script>";                    
                }
            }
        }
        catch
        { }
    }

    protected void CheckCaiGou()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPBuyOrder where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and TiXingDate='" + ToDayStr + "'");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "您在采购订单中安排的提醒时间到。采购合同名称：" + MyDataSet.Tables[0].Rows[j]["OrderName"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "您在采购订单中安排的提醒时间到。采购合同名称：" + MyDataSet.Tables[0].Rows[j]["OrderName"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }
    }

    protected void CheckXiangMu()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPProject where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and TiXingDate='" + ToDayStr + "'");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "您在项目管理模块中安排的提醒时间到。项目名称：" + MyDataSet.Tables[0].Rows[j]["ProjectName"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "您在项目管理模块中安排的提醒时间到。项目名称：" + MyDataSet.Tables[0].Rows[j]["ProjectName"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }
    }
    protected void CheckShouKuan()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPShouKuan where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and ShouKuanDate='" + ToDayStr + "'");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "项目管理中设置的收款提醒时间到。项目名称：" + MyDataSet.Tables[0].Rows[j]["ProjectName"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "项目管理中设置的收款提醒时间到。项目名称：" + MyDataSet.Tables[0].Rows[j]["ProjectName"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }
    }

    protected void CheckRiCheng()
    { 
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPAnPai where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and datediff(minute,getdate(),TimeTiXing)<2 and datediff(minute,getdate(),TimeTiXing)>0");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "您所制定的日程安排提醒时间到。(" + MyDataSet.Tables[0].Rows[j]["TitleStr"].ToString() + ")";
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "您所制定的日程安排提醒时间到。(" + MyDataSet.Tables[0].Rows[j]["TitleStr"].ToString() + ")";
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }    
    }

    protected void CheckLinkLog()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPLinkLog where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and CusBakE='" + ToDayStr + "'");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "联系记录中设置的提醒时间到。联系主题：" + MyDataSet.Tables[0].Rows[j]["LinkTitle"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "联系记录中设置的提醒时间到。联系主题：" + MyDataSet.Tables[0].Rows[j]["LinkTitle"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }
    }

    protected void CheckSongYang()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPSongYang where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and CusBakE='" + ToDayStr + "'");
        for (int j = 0; j < MyDataSet.Tables[0].Rows.Count; j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "送样记录中设置的提醒时间到。客户名：" + MyDataSet.Tables[0].Rows[j]["CustomName"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "送样记录中设置的提醒时间到。客户名：" + MyDataSet.Tables[0].Rows[j]["CustomName"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }
    }

    protected void CheckCRMDingDan()
    {
        string ToDayStr = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Day.ToString();
        DataSet MyDataSet = SDLX.DBUtility.DbHelperSQL.GetDataSet("select * from ERPCustomInfo where UserName='" + SDLX.Common.PublicMethod.GetSessionValue("UserName") + "' and YuJiTiXing='" + ToDayStr + "'");
        for(int j=0;j<MyDataSet.Tables[0].Rows.Count;j++)
        {
            SDLX.BLL.ERPLanEmail MyModel = new SDLX.BLL.ERPLanEmail();
            MyModel.EmailContent = "客户信息中预计订单提醒时间到。客户名称：" + MyDataSet.Tables[0].Rows[j]["CustomName"].ToString();
            MyModel.EmailState = "未读";
            MyModel.EmailTitle = "客户信息中预计订单提醒时间到。客户名称：" + MyDataSet.Tables[0].Rows[j]["CustomName"].ToString();
            MyModel.FromUser = "系统消息";
            MyModel.FuJian = "";
            MyModel.TimeStr = DateTime.Now;
            MyModel.ToUser = SDLX.Common.PublicMethod.GetSessionValue("UserName");
            if (SDLX.Common.PublicMethod.IFExists("EmailTitle", "ERPLanEmail", 0, MyModel.EmailTitle) == true)
            {
                MyModel.Add();
            }
        }        
    }
}
