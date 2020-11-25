using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Management;
using Microsoft.Win32;


namespace OA.aspx{ 
 public partial class Login: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["TxtUserName"]) == false && string.IsNullOrEmpty(Request["TxtUserPwd"]) == false)
        {
            LoginSubmit(Request["TxtUserName"], Request["TxtUserPwd"]);
        }
        this.TxtUserName.Value = FTD.Unit.PublicMethod.GetCookie("DTRememberName");


        //判断系统的IP限制
        PassORNo();
    }
    /// <summary>
    /// IP黑名单
    /// </summary>
    private void PassORNo()
    {
        string NowIPStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();//访问者IP
        string[] OAIPStr = ConfigurationManager.AppSettings["OAIP"].ToString().Trim().Split('|');//允许的IP字符串组数组

        for (int i = 0; i < OAIPStr.Length; i++)
        {
            if (FTD.Unit.PublicMethod.StrIFIn(OAIPStr[i].ToString(), NowIPStr) == true || OAIPStr[i].ToString() == "*")
            {
                return;
            }
        }
        //执行到最后，不允许访问！
        this.TxtUserName.Disabled = true;
        this.TxtUserPwd.Disabled = true;
        //this.btnSubmit.Disabled = true;

        FTD.Unit.MessageBox.Show(this, "您的访问IP不在系统允许范围内，您不能登录系统，请联系管理员！");
    }
    /// <summary>
    /// 用户登录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void LoginSubmit(string userName, string pwd)
    {
        string IFPop = "否";
        FTD.BLL.ERPUser MyUser = new FTD.BLL.ERPUser();
        MyUser.UserLogin(userName.Trim(), FTD.Unit.DEncrypt.DESEncrypt.Encrypt(pwd), IFPop, ConfigurationManager.AppSettings["OALogin"].ToString().Trim(), "index.aspx", true);
    }
    //获得网卡序列号----MAc地址
    public string GetMoAddress()
    {
        try
        {
            //读取硬盘序列号
            ManagementObject disk;
            disk = new ManagementObject("win32_logicaldisk.deviceid=\"c:\"");
            disk.Get();



            string MoAddress = "BD-CNSOFTWEB";
            ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc2 = mc.GetInstances();
            foreach (ManagementObject mo in moc2)
            {
                if ((bool)mo["IPEnabled"] == true)
                {
                    string a = mo["MacAddress"].ToString();
                    string c = disk.GetPropertyValue("VolumeSerialNumber").ToString();
                    MoAddress = "BD-" + a + "-" + c + "-CNSOFTWEB";
                    break;
                }
            }
            return MoAddress.ToString().Replace(":", "");
        }
        catch
        {
            return "BD-ERR-CNSOFTWEB";
        }
    }

    /**/
    /// <summary>
    /// 分析用户请求是否正常
    /// </summary>
    /// <param name="Str">传入用户提交数据</param>
    /// <returns>返回是否含有SQL注入式攻击代码</returns>
    public string ProcessSqlStr(string Str)
    {
        string SqlStr = "exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare";
        string ReturnValue = Str;
        try
        {
            if (Str != "")
            {
                string[] anySqlStr = SqlStr.Split('|');
                foreach (string ss in anySqlStr)
                {
                    if (Str.ToLower().IndexOf(ss) >= 0)
                    {
                        ReturnValue = "";
                    }
                }
            }
        }
        catch
        {
            ReturnValue = "";
        }
        if (Str.Length > 20)
        {
            ReturnValue = "";
        }
        return ReturnValue;
    }  
}}