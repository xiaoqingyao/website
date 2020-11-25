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
        //SDLX.Common.PublicMethod.SetSessionValue("UserName", "");
        //验证序列号是否正确

        /*
        if (!Page.IsPostBack)
        {
            try
            {
                //当前序列号---------------------------------------------------------------------------
                string NowSerils = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 SerilsStr from ERPSerils");
                if (SDLX.Common.DEncrypt.DESEncrypt.Encrypt(GetMoAddress()).ToString() != NowSerils)
                {
                    //序列号错误
                    SDLX.Common.MessageBox.ShowAndRedirect(this, "验证系统序列号时发生错误！请重新获取序列号！", "SerilsSetting.aspx");
                }
            }
            catch
            {
                //SDLX.Common.MessageBox.ShowAndRedirect(this, "验证系统序列号时发生错误！请重新获取序列号！", "SerilsSetting.aspx");
            }

            try
            {
                //时间字符串-----------------------------------------------------------------------------
                DateTime DateStr = DateTime.Parse(SDLX.Common.DEncrypt.DESEncrypt.Decrypt(SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 DateStr from ERPSerils")));
                if (DateStr < DateTime.Now)
                {
                    //使用时间到达
                    SDLX.Common.MessageBox.ShowAndRedirect(this, "该序列号的使用时间已到，请重新获取序列号！", "SerilsSetting.aspx");
                }
            }
            catch
            {
                //SDLX.Common.MessageBox.ShowAndRedirect(this, "该序列号的使用时间已到，请重新获取序列号！", "SerilsSetting.aspx");
            }
        }
         * */

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        
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

    //获得网卡序列号----MAc地址
    public string GetMoAddress()
    {
        string MoAddress = " ";
        ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
        ManagementObjectCollection moc2 = mc.GetInstances();
        foreach (ManagementObject mo in moc2)
        {
            if ((bool)mo["IPEnabled"] == true)
                MoAddress = mo["MacAddress"].ToString();
            mo.Dispose();
        }
        return MoAddress.ToString();
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        SDLX.BLL.ERPUser MyUser = new SDLX.BLL.ERPUser();
        //if (ConfigurationManager.AppSettings["OALogin"].ToString().Trim() == "0")
        //{
        //    string UserNameStr = SDLX.DBUtility.DbHelperSQL.GetSHSL("select top 1 UserName from ERPUser where TrueName='" + ProcessSqlStr(TxtUserName.Text.Trim()) + "'");
        //    MyUser.UserLogin(UserNameStr, SDLX.Common.DEncrypt.DESEncrypt.Encrypt(TxtUserPwd.Text));
        //}
        //else
        //{
            MyUser.UserLogin(TxtUserName.Text.Trim(), SDLX.Common.DEncrypt.DESEncrypt.Encrypt(TxtUserPwd.Text));
        //}

    }
}
