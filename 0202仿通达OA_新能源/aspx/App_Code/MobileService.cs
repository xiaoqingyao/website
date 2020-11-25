using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using FTD.BLL;

/// <summary>
///MobileService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
// [System.Web.Script.Services.ScriptService]
public class MobileService : System.Web.Services.WebService
{

    public MobileService()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string Login(string uname, string pass)
    {
        string dpass = FTD.Unit.DEncrypt.DESEncrypt.Encrypt(pass);
        FTD.BLL.ERPUser erpuser = new FTD.BLL.ERPUser();
        string result = erpuser.UserLogin(uname, dpass);
        return result;
    }

}
