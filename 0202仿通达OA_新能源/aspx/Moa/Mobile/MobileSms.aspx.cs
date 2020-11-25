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

namespace OA.aspx.Moa.Mobile{ 
 public partial class MobileSms: System.Web.UI.Page
{
    public List<ERPMobile> MobileList = new List<ERPMobile>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FTD.Unit.PublicMethod.CheckSession();
            DataBindToGridview();
          
        }
        if (!string.IsNullOrEmpty(Request.QueryString["MsgID"]))
        {
            Send(int.Parse(Request.QueryString["MsgID"]));
        }
    }
    public void DataBindToGridview()
    {
        DataEntityDataContext context = new DataEntityDataContext();
        FTD.BLL.ERPMobile MyLanEmail = new FTD.BLL.ERPMobile();
        var T = context.ERPMobile.Where(p => p.FaSongUser == FTD.Unit.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        MobileList = T.ToList();
    }

    protected void Send(int id)
    {
        if (id != 0)
        {
            FTD.BLL.ERPMobile MyModel = new FTD.BLL.ERPMobile();
            MyModel.GetModel(id);

            if (FTD.Unit.PublicMethod.StrIFIn("内部人员：", MyModel.ToUserList) == true)
            {
                //内部
                OA.App_Code.Mobile.SendSMS(MyModel.FaSongUser, MyModel.ToUserList.Replace("内部人员：", ""), MyModel.ContentStr);
            }
            else
            {
                //外部
                OA.App_Code.Mobile.SendSMS2(MyModel.FaSongUser, MyModel.ToUserList.Replace("外部人员：", ""), MyModel.ContentStr);
            }
        }

        DataBindToGridview();
        //写系统日志
        FTD.BLL.ERPRiZhi MyRiZhi = new FTD.BLL.ERPRiZhi();
        MyRiZhi.UserName = FTD.Unit.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户发送已发送手机短信中的信息";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        Response.Write("<script>alert(手机短信发送完毕！');</script>");
    }
}}