using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AllPower.Common;
using AllPower.Model.SysManage;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 八零源码
    作者:      Tony
    创建时间： 2010年3月20日
    功能描述： 登陆界面 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ////int getcheckclientinfo=Utils.CheckClientInfo();
                ////switch  (getcheckclientinfo)
                ////{
                ////    case 0:
                ////        Response.Write("您使用的版本是试用版，现在已过期，请联系供应商获取正式版") ;
                ////        Response.End();
                ////        break;
                ////    case -1:
                ////        Response.Write("您使用的版本是试用版，现在已过期，请联系供应商获取正式版");
                ////        Response.End();
                ////        break;
                ////    case -2:
                ////        Response.Write("您使用的版本已过期，请联系供应商");
                ////        Response.End();
                ////        break;
                ////}
                
                if (Request.Cookies[SystemConst.SYSTEM_COOKIES] != null && Request.Cookies[SystemConst.SYSTEM_COOKIES].Value.ToString().Length > 0)
                {
                    //客户端有cookies
                    this.AccountName.Text = Request.Cookies[SystemConst.SYSTEM_COOKIES].Value;
                    this.SaveLoginInfo.Checked = true;
                }
                else
                {
                    this.SaveLoginInfo.Checked = false;
                }
                //站点下拉列表
                BindWebSite();
            }            
        }
        private void BindWebSite()
        {
            AllPower.BLL.SysManage.SysWebSite objWebSite = new AllPower.BLL.SysManage.SysWebSite();
            DataTable dtWebSite = objWebSite.GetList("ALL", Utils.getTwoParams("0", ""));
            DDLSite.DataSource = dtWebSite;
            DDLSite.DataTextField = "SiteName";
            DDLSite.DataValueField = "SiteID";
            DDLSite.DataBind();

            string xml = Server.MapPath("~/sysadmin/Configuraion/siteinfomanage.config");
            string isEnableManageCode = Utils.XmlRead(xml, "/SiteInfoManage/IsEnableManageCode", "");
            ViewState["IsEnableManageCode"] = isEnableManageCode.Trim();
            ViewState["ManageCode"] = Utils.XmlRead(xml, "/SiteInfoManage/ManageCode", "").Trim();

            if (isEnableManageCode == "0")
            {
                this.przm.Visible = false;
            }

            if (Session["IsShowYZM"] == null)
            {
                this.pyzm.Visible = false;
            }
        }

        protected void SetCookies()
        {
            //客户端还没有cookies，在客户端加入cookies
            Response.Cookies[SystemConst.SYSTEM_COOKIES].Value = this.AccountName.Text;
            Response.Cookies[SystemConst.SYSTEM_COOKIES].Expires = DateTime.MaxValue;
        }

        protected void RemoveCookies()
        {
            //移除客户端Cookies
            Response.Cookies[SystemConst.SYSTEM_COOKIES].Value = "";
            Response.Cookies[SystemConst.SYSTEM_COOKIES].Expires = DateTime.MaxValue;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Session["IsShowRZM"] != null&&(Session[SystemConst.SESSION_VALIDATECODE] == null || txtValidate.Text.ToLower() != Session[SystemConst.SESSION_VALIDATECODE].ToString().ToLower()))
            {
                txtValidate.Text = "";
                Utils.RunJavaScript(this, "alert({msg:'验证码输入错误，请重新输入！',title:'提示信息'})");
                return;
            }
            else if (ViewState["IsEnableManageCode"].ToString() == "1" && ViewState["ManageCode"].ToString() != txtRZM.Text)
            {
                txtValidate.Text = "";
                Utils.RunJavaScript(this, "alert({msg:'认证码输入错误，请重新输入！',title:'提示信息'})");
                return;
            }
            int UID = 0;
            string SuperUser = ConfigurationManager.AppSettings[SystemConst.CONFIG_SUPERUSER];
            Session["SiteDir"] = null;
            //先判断是不是超级用户
            if (SuperUser != null && SuperUser.Equals(AccountName.Text))
            {
                string SuperUserPassword = ConfigurationManager.AppSettings[SystemConst.CONFIG_SUPERUSER_PASSWORD];
                if (SuperUserPassword != null && SuperUserPassword.Equals(SecurityHelper.MD5(this.AccountPwd.Text)))
                {
                    Account super = new Account();
                    super.UserName = SuperUser;
                    super.UserID = 0;
                    super.PassWord = SecurityHelper.MD5(SuperUserPassword);
                    super.IsValid = true;
                    UID = super.UserID;

                    if (SaveLoginInfo.Checked)
                    {
                        SetCookies(); //设置cookies
                    }
                    else
                    {
                        RemoveCookies();
                    }

                    //把用户信息存到Session中

                    Session[SystemConst.SYSTEM_SESSION_LOGININFO] = super;                    
                    //把站点ID保存到Session中

                    Session["SiteID"] = DDLSite.SelectedValue;
                    //增加日志
                    AllPower.Web.Admin.AdminPage adminpage = new AllPower.Web.Admin.AdminPage();
                    adminpage.WriteLog(AccountName.Text+ "登陆系统成功！", "", 1);
                    //更新登录信息
                    UpdateLoginInfo(super.UserID, Utils.ParseInt(DDLSite.SelectedValue,0));
                    this.Response.Redirect(GetManageDir()+"console/Index1.aspx");
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'密码错误！',title:'提示信息'})");
                }
            }
            else
            {
                AllPower.BLL.SysManage.Account baccount = new AllPower.BLL.SysManage.Account();

                AllPower.Model.SysManage.Account sa = baccount.GetAccountByName(this.AccountName.Text, DDLSite.SelectedValue);
                UID = sa.UserID;
                string department = sa.DepartMent;

                if (string.IsNullOrEmpty(sa.UserName))
                {
                    Utils.RunJavaScript(this, "alert({msg:'该用户不存在',title:'提示信息'})");
                    return;
                }
                else
                {
                    if (sa.IsValid == null || sa.IsValid.Equals('0'))
                    {
                        Utils.RunJavaScript(this, "alert({msg:'该用户已被系统管理员禁用！',title:'提示信息'})");
                        return;
                    }
                    else
                    {
                        if (SecurityHelper.MD5(this.AccountPwd.Text).Equals(sa.PassWord))
                        {
                            if (SaveLoginInfo.Checked)
                            {
                                SetCookies(); //设置cookies
                            }
                            else
                            {
                                RemoveCookies(); //移除cookies
                            }

                            //把用户信息存到Session中

                            Session[SystemConst.SYSTEM_SESSION_LOGININFO] = sa;                           
                            //把站点ID保存到Session中

                            Session["SiteID"] = DDLSite.SelectedValue;
                            //增加日志
                            AllPower.Web.Admin.AdminPage adminpage = new AllPower.Web.Admin.AdminPage();
                            adminpage.WriteLog(AccountName.Text + "登陆系统成功！", "", 1);
                            //更新登录信息
                            UpdateLoginInfo(sa.UserID,Utils.ParseInt(DDLSite.SelectedValue,0));
                            this.Response.Redirect(GetManageDir()+"console/Index1.aspx");

                        }
                        else
                        {
                            Utils.RunJavaScript(this, "alert({msg:'密码错误！',title:'提示信息'})");
                        }
                    }
                }
            }
            //如果密码错误，则显示验证码
            Session["IsShowRZM"] = "1";
            this.pyzm.Visible = true;
        }

        //更新登录信息
        protected void UpdateLoginInfo(int UserID,int SiteID)
        {
            if (SiteID != 0)
            {
                //admin登陆
                if (UserID == 0)
                {
                    string xml = Server.MapPath("~/sysadmin/Configuraion/adminLoginInfo.xml");
                    //更新上次登陆信息
                    string strLoginDate = Utils.XmlRead(xml, "/root/LoginDate", "");
                    string strLoginIp = Utils.XmlRead(xml, "/root/Ip", "");
                    Utils.XmlUpdate(xml, "/root/LastLoginDate", "", strLoginDate);
                    Utils.XmlUpdate(xml, "/root/LastLoginIp", "", strLoginIp);
                    //更新本次登陆信息
                    Utils.XmlUpdate(xml, "/root/LoginDate", "", DateTime.Now.ToString());
                    Utils.XmlUpdate(xml, "/root/Ip", "", Utils.GetIP());
                    int intLoginCount = Utils.ParseInt(Utils.XmlRead(xml, "/root/LoginCount", ""), 0)+1;
                    Utils.XmlUpdate(xml, "/root/LoginCount", "", intLoginCount.ToString());
                }
                else
                {
                    AccountSite modelAccountSite = new AccountSite();
                    AllPower.BLL.SysManage.AccountSite bllAccountSite = new AllPower.BLL.SysManage.AccountSite();
                    modelAccountSite.UserID = UserID;
                    modelAccountSite.SiteID = SiteID;
                    modelAccountSite.IP = Utils.GetIP();
                    modelAccountSite.LoginDate = DateTime.Now;
                    bllAccountSite.Save("UpdateLoginInfo", modelAccountSite);
                }
            }
        }

        public string GetManageDir()
        {
            string re = "";
            if (AppCache.IsExist("CacheManageDir"))
            {
                re = AllPower.Common.AppCache.Get("CacheManageDir").ToString();
            }
            else
            {
                string siteParamPath = Server.MapPath("/sysadmin/Configuraion/SiteInfoManage.config");
                re = Utils.XmlRead(siteParamPath, "/SiteInfoManage/ManageDir", "").ToLower();
                AppCache.AddCache("CacheManageDir", re, 144000);
            }

            if (re != "")
            {
                re = "../" + re + "/";
            }

            return re;
        }

       
    }
}
