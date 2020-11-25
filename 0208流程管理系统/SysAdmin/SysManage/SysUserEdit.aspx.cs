using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AllPower.BLL.SysManage;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Web.Services;

/*==========================================
Copyright (C) 2010 华强北在线

作者:肖丹
创建时间：2010-03-27
功能描述：修改和添加用户
更新日期        更新人      更新原因/内容
4/29            陈顺      BUG修改/代码优化
--=========================================*/

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SysUserEdit : AdminPage
    {
        #region  URL参数
        private string _userid = string.Empty;
        public string UserID
        {
            get
            {
                if (Utils.ReqUrlParameter("UserId") != "")
                {
                    this._userid = Utils.ReqUrlParameter("UserId");
                }
                return this._userid;
            }
            set
            {
                this._userid = value;
            }
        }
        #endregion

        //用户逻辑类

        Account BllAccount = new Account();
        //用户实体类

        AllPower.Model.SysManage.Account MAccount = new AllPower.Model.SysManage.Account();
        DataTable dtUserGroup = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDll();
                hdSiteID.Value = SiteID.ToString();
                ViewState["StrPageParams"] = StrPageParams;
                #region 初始化页面

                if (this.Action == "EDIT")
                {
                    span1.Visible = false;
                    //按钮文本为“修改”

                    BtnSave.Text = Utils.GetResourcesValue("Common", "Update");
                    DataTable DtAccount = BllAccount.GetList("ONE", Utils.getOneParams(this.UserID));

                    if (DtAccount.Rows.Count > 0) //如果当前行存在,则绑定行
                    {
                        foreach (DataRow dr in DtAccount.Rows)
                        {
                            txtAccountName.Value = dr["UserName"].ToString();
                            hidLogTitle.Value = dr["UserName"].ToString();
                            txtAccountName.Disabled = true;
                            txtAccountOrder.Text = dr["Orders"].ToString();
                            RBL_IsValid.SelectedValue = dr["IsValid"].ToString();
                        }
                    }
                    //选择ddlUserGroup
                    DataTable dtAccInfo = BllAccount.GetList("GETACCINFOBYSITE", Utils.getTwoParams(UserID, SiteID.ToString()));
                    if (dtAccInfo.Rows.Count > 0)
                    {
                        ddlUserGroup.SelectedValue = dtAccInfo.Rows[0]["UserGroupCode"].ToString();
                        this.hdUserGropOld.Value = dtAccInfo.Rows[0]["UserGroupCode"].ToString();
                    }
                }
                if (this.Action == "NEW")
                {
                    //判断权限
                    BtnSave.Visible = IsHaveRightByOperCode("Edit");
                    //按钮文本为“添加”

                    Utils.GetResourcesValue("Common", "Add");
                }
                #endregion
            }
        }

        #region 判断该用户是否在用户表中
        protected static bool isExist(string UserName)
        {
            AllPower.BLL.SysManage.Account objAccount = new Account();
            DataTable dt = objAccount.GetList("GETBYNAME", Utils.getOneParams(UserName));
            if (dt.Rows.Count > 0)
            {
                if (AllPower.Common.AppCache.IsExist("UserID"))
                {
                    AllPower.Common.AppCache.Remove("UserID");
                }
                AllPower.Common.AppCache.AddCache("UserID", dt.Rows[0]["UserID"].ToString(), 120);
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        //前台JS调用Ajax方法，用于检查用户名
        //1:已经是当前站点的用户  2:已经存在于用户表，但不是当前站点的用户 3:新用户

        [WebMethod]
        public static string CheckName(string UserName, string SiteID)
        {
            string strResult = string.Empty;
            AllPower.BLL.SysManage.AccountSite objAccountSite = new AccountSite();
            DataTable dt = objAccountSite.GetList("ISHAVESITE", Utils.getTwoParams(UserName, SiteID));
            if (dt.Rows.Count > 0)
            {
                strResult = "1";
            }
            else
            {
                strResult = isExist(UserName) ? "2" : "3";
            }
            return strResult;
        }

        #region 绑定用户组下拉列表

        private void BindDll()
        {
            //绑定用户组下拉列表

            oparate();
            ddlUserGroup.DataSource = dtUserGroup.DefaultView;
            ddlUserGroup.DataTextField = "UserGroupName";
            ddlUserGroup.DataValueField = "userGroupCode";
            ddlUserGroup.DataBind();
            ListItem ls = new ListItem("请选择", "0");//追加一项

            this.ddlUserGroup.Items.Insert(0, ls);
        }
        #endregion

        #region 无限分类的用户组显示结构处理
        public void oparate()
        {
            UserGroup BllUserG = new UserGroup();
            dtUserGroup = BllUserG.GetList("ALL", Utils.getOneParams(SiteID.ToString())).Tables[0];
            string temp_str = "";
            int numCode = 0;
            string strCode = "";
            for (int i = 0; i < dtUserGroup.Rows.Count; i++)
            {
                strCode = dtUserGroup.Rows[i]["numCode"].ToString();
                numCode = strCode.Length / 3;
                if (numCode == 1)
                { }
                else
                {
                    for (int p = 1; p < numCode; p++)
                    {
                        if (p == numCode - 1)
                        {
                            temp_str = temp_str + "├";
                        }
                        else
                        {
                            temp_str = temp_str + "　";
                        }
                    }
                }
                dtUserGroup.Rows[i]["UserGroupName"] = temp_str + dtUserGroup.Rows[i]["UserGroupName"].ToString();
                temp_str = "";
            }
        }
        #endregion

        #region 按钮事件
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (this.ddlUserGroup.SelectedValue == "0")
            {
                Utils.RunJavaScript(this, "alert({msg:'请选择所属用户组！',title:'提示信息'})");
                return;
            }
            AllPower.BLL.SysManage.UserRole bllUserRole = new UserRole();
            AllPower.Model.SysManage.UserRole modeUserRole = new AllPower.Model.SysManage.UserRole();
            AllPower.Model.SysManage.AccountSite ModeSite = new AllPower.Model.SysManage.AccountSite();
            string returnMsg = "";
            //把页面的值传给账户属性

            MAccount.Orders = Convert.ToInt32(this.txtAccountOrder.Text);
            MAccount.IsValid = Utils.ParseBool(RBL_IsValid.SelectedValue);

            //根据ID得到用户信息
            DataTable DTAccount = BllAccount.GetList("ONE", Utils.getOneParams(this.UserID));

            if (this.Action == "EDIT")
            {
                #region 修改用户信息
                //判断是否有权限

                if (IsHaveRightByOperCode("Edit"))
                {
                    //得到传过来的userid
                    MAccount.UserID = Convert.ToInt32(this.UserID);
                    //编辑用户
                    returnMsg = BllAccount.Save("EDIT", MAccount);
                    if (Utils.ParseInt(returnMsg, 0) > 0)
                    {
                        //修改该账号用户组
                        modeUserRole.UserId = UserID;
                        modeUserRole.UserGroupCode = new Guid(ddlUserGroup.SelectedValue.ToString());
                        modeUserRole.ExtentValue = this.hdUserGropOld.Value.ToString();
                        bllUserRole.Save("EDIT", modeUserRole);
                        Utils.RunJavaScript(this, "type=1;userName='" + txtAccountName.Value.Replace("'", "\\'") + "';userid=" + UserID + ";");
                        WriteLog("帐户" + txtAccountName.Value + "编辑成功！", "", 2);
                    }
                    else
                    {
                        Utils.RunJavaScript(this, "type=2;errmsg=" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + ";");
                        WriteLog("帐户" + txtAccountName.Value + "编辑失败！", returnMsg, 2);
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有编辑用户的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            if (this.Action == "NEW")
            {
                #region 新增用户信息
                string accountName = txtAccountName.Value;
                string admin = ConfigurationManager.AppSettings[SystemConst.CONFIG_SUPERUSER];
                if (admin != null && admin.Equals(accountName))
                {
                    Utils.RunJavaScript(this, "type=2;userName='" + txtAccountName.Value.Replace("'", "\\'") + "';errmsg='该用户已存在，请填写其他用户名'");
                    return;
                }
                MAccount.UserName = accountName;
                MAccount.PassWord = SecurityHelper.MD5(txtAccountPwd.Text).ToString();
                if (IsHaveRightByOperCode("New"))
                {
                    try
                    {
                        if (AllPower.Common.AppCache.IsExist("UserID"))
                        {
                            UserID = (string)AllPower.Common.AppCache.Get("UserID");
                        }
                        if (!isExist(MAccount.UserName))
                        {
                            //如果用户表里不存在该用户，向用户表添加记录

                            UserID = BllAccount.Save("NEW", MAccount).ToString();
                        }

                        //为该用户加入当前站点
                        AccountSite objAccSite = new AccountSite();

                        ModeSite.UserID = Utils.ParseInt(UserID, 1);
                        ModeSite.SiteID = SiteID;
                        ModeSite.IsValid = true;
                        ModeSite.LoginDate = DateTime.Now;
                        ModeSite.IP = Utils.GetIP();
                        objAccSite.Save("NEW", ModeSite);
                        //为该用户加入用户组


                        modeUserRole.UserGroupCode = new Guid(ddlUserGroup.SelectedValue.ToString());
                        modeUserRole.UserId = UserID;
                        returnMsg = bllUserRole.Save("NEW", modeUserRole);
                        if (Utils.ParseInt(returnMsg, 0) > 0)
                        {
                            //Utils.RunJavaScript(this, "alert({msg:'新增用户成功！',title:'提示信息'})"); 
                            WriteLog("新增" + txtAccountName.Value + "用户成功！", "", 2);
                            Utils.RunJavaScript(this, "type=0;userName='" + txtAccountName.Value.Replace("'", "\\'") + "';userid=" + UserID + ";");
                        }
                    }
                    catch
                    {
                        //Utils.RunJavaScript(this, "alert({msg:" + returnMsg + ",title:'提示信息'})");
                        Utils.RunJavaScript(this, "type=2;userName='" + txtAccountName.Value.Replace("'", "\\'") + "';errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "'");
                        WriteLog("新增" + txtAccountName.Value + "用户失败！", returnMsg, 2);
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增用户的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }
        #endregion

    }
}
