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

public partial class Mobile_MobileSms : System.Web.UI.Page
{
    public List<ERPMobile> MobileList = new List<ERPMobile>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ZWL.Common.PublicMethod.CheckSession();
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
        ZWL.BLL.ERPMobile MyLanEmail = new ZWL.BLL.ERPMobile();
        var T = context.ERPMobile.Where(p => p.FaSongUser == ZWL.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        MobileList = T.ToList();
    }

    protected void Send(int id)
    {
        if (id != 0)
        {
            ZWL.BLL.ERPMobile MyModel = new ZWL.BLL.ERPMobile();
            MyModel.GetModel(id);

            if (ZWL.Common.PublicMethod.StrIFIn("内部人员：", MyModel.ToUserList) == true)
            {
                //内部
                Mobile.SendSMS(MyModel.FaSongUser, MyModel.ToUserList.Replace("内部人员：", ""), MyModel.ContentStr);
            }
            else
            {
                //外部
                Mobile.SendSMS2(MyModel.FaSongUser, MyModel.ToUserList.Replace("外部人员：", ""), MyModel.ContentStr);
            }
        }

        DataBindToGridview();
        //写系统日志
        ZWL.BLL.ERPRiZhi MyRiZhi = new ZWL.BLL.ERPRiZhi();
        MyRiZhi.UserName = ZWL.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户发送已发送手机短信中的信息";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        Response.Write("<script>alert(手机短信发送完毕！');</script>");
    }
}