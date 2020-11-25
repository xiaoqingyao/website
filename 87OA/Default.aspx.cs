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

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //需要真正清空登录用户时，请启用下面这句代码。考虑到部分用户不需要真正清空用户信息，只是转回登陆页。此处，留待自定义启用
        //ZWL.Common.PublicMethod.SetSessionValue("UserName", null);
        //验证序列号是否正确

        if (!Page.IsPostBack)
        {
            TxtUserName.Text = ZWL.Common.PublicMethod.GetCookie("DTRememberName");
            try
            {
                //当前序列号---------------------------------------------------------------------------
                string NowSerils = ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 SerilsStr from ERPSerils");
                //string aaa = ZWL.Common.DEncrypt.DESEncrypt.Encrypt(GetMoAddress(), "www.cnsoftweb.com-13696432490").ToString();
                ////解密后的用户数量及单位名称
                //string bbb = ZWL.Common.DEncrypt.DESEncrypt.Decrypt(ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 DateStr from ERPSerils"), "www.cnsoftweb.com-13696432490").ToString();
                //string ccc = ZWL.Common.DEncrypt.DESEncrypt.Decrypt(ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 UserNum from ERPSerils"), "www.cnsoftweb.com-13696432490").ToString();
                //string ddd = ZWL.Common.DEncrypt.DESEncrypt.Decrypt(ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 DanWeiStr from ERPSerils"), "www.cnsoftweb.com-13696432490").ToString();
                if (ZWL.Common.DEncrypt.DESEncrypt.Encrypt(GetMoAddress(), "www.cnsoftweb.com-13696432490").ToString() != NowSerils)
                {
                    //序列号错误
                    //ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码验证无效！请联系佰鼎科技重新获取授权！", "SerilsSetting.aspx");
                }
            }
            catch
            {
                //ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码验证无效！请联系佰鼎科技重新获取授权！", "SerilsSetting.aspx");
            }

            try
            {
                //时间字符串-----------------------------------------------------------------------------
                //DateTime DateStr = DateTime.Parse(ZWL.Common.DEncrypt.DESEncrypt.Decrypt(ZWL.DBUtility.DbHelperSQL.GetSHSL("select top 1 DateStr from ERPSerils"), "www.cnsoftweb.com-13696432490"));
                //if (DateStr < DateTime.Now)
                //{
                    //使用时间到达
                    //ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码过期！请联系佰鼎科技重新获取授权！", "SerilsSetting.aspx");
                //}
            }
            catch
            {
                //ZWL.Common.MessageBox.ShowAndRedirect(this, "系统授权码过期！请联系佰鼎科技重新获取授权！", "SerilsSetting.aspx");
            }
        }


        //判断系统的IP限制
        PassORNo();
    }

    private void PassORNo()
    {
        string NowIPStr = System.Web.HttpContext.Current.Request.UserHostAddress.ToString();//访问者IP
        string[] OAIPStr = ConfigurationManager.AppSettings["OAIP"].ToString().Trim().Split('|');//允许的IP字符串组数组

        for (int i = 0; i < OAIPStr.Length; i++)
        {
            if (ZWL.Common.PublicMethod.StrIFIn(OAIPStr[i].ToString(), NowIPStr) == true || OAIPStr[i].ToString()=="*")
            {
                return;
            }
        }
        //执行到最后，不允许访问！
        this.TxtUserName.Enabled = false;
        this.TxtUserPwd.Enabled = false;
        this.ImageButton1.Enabled = false;

        ZWL.Common.MessageBox.Show(this, "您的访问IP不在系统允许范围内，您不能登录系统，请联系管理员！");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string IFPop="否";
        if (this.CheckBox1.Checked == true)
        {
            IFPop = "是";
        }
        ZWL.BLL.ERPUser MyUser = new ZWL.BLL.ERPUser();
        MyUser.UserLogin(TxtUserName.Text.Trim(), ZWL.Common.DEncrypt.DESEncrypt.Encrypt(TxtUserPwd.Text), IFPop, ConfigurationManager.AppSettings["OALogin"].ToString().Trim(), "Main/Main.aspx", cbRememberId.Checked);
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
}
