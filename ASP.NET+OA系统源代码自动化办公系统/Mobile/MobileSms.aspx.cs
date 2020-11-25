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
            SDLX.Common.PublicMethod.CheckSession();
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
        SDLX.BLL.ERPMobile MyLanEmail = new SDLX.BLL.ERPMobile();
        var T = context.ERPMobile.Where(p => p.FaSongUser == SDLX.Common.PublicMethod.GetSessionValue("UserName")).OrderByDescending(p => p.ID);
        MobileList = T.ToList();
    }

    protected void Send(int id)
    {
        if (id != 0)
        {
            SDLX.BLL.ERPMobile MyModel = new SDLX.BLL.ERPMobile();
            MyModel.GetModel(id);

            if (SDLX.Common.PublicMethod.StrIFIn("内部人员：", MyModel.ToUserList) == true)
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
        SDLX.BLL.ERPRiZhi MyRiZhi = new SDLX.BLL.ERPRiZhi();
        MyRiZhi.UserName = SDLX.Common.PublicMethod.GetSessionValue("UserName");
        MyRiZhi.DoSomething = "用户发送已发送手机短信中的信息";
        MyRiZhi.IpStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();
        MyRiZhi.Add();
        Response.Write("<script>alert(手机短信发送完毕！');</script>");
    }
}