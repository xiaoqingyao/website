using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using AllPower.BLL.SysManage;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月6日
    功能描述： 角色编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class RoleEdit : AllPower.Web.Admin.AdminPage
    {
        AllPower.BLL.SysManage.Role bll = new AllPower.BLL.SysManage.Role();
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
               PageInit();
            }
        }

        #region 页面初始化
        private void PageInit()
        {
            if (this.Action == "EDIT")
            {
                DataTable dt;
                SelectParams selParams = new SelectParams();
                selParams.S1 = this.ID;
                dt = bll.GetList("ONE", selParams);

                btnRole.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];

                    txtRoleName.Text = dr["RoleName"].ToString();
                    //DDLSite.SelectedValue = dr["SiteID"].ToString();
                    this.hidLogTitle.Value = dr["RoleName"].ToString();
                    txtRoleDescription.Text = dr["RoleDescription"].ToString();
                    txtRoleOrder.Text = Utils.HtmlDecode(dr["RoleOrder"].ToString());
                    hdnID.Value = this.ID;
                }
            }
        }
        #endregion

        #region 按钮事件
        protected void btnRole_Click(object sender, EventArgs e)
        {
            string id = hdnID.Value;
            string returnMsg = "";
            string tranType = "NEW";
            AllPower.Model.SysManage.Role mode = new AllPower.Model.SysManage.Role();

            if (id != "")   // 修改关键字
            {
                #region 修改角色
                // 权限验证，是否具有修改权限
                if (IsHaveRightByOperCode("Edit"))
                {
                    tranType = "EDIT";
                    mode.RoleCode = new Guid(id);
                    mode.RoleName = Utils.HtmlEncode(txtRoleName.Text.Trim());
                    mode.SiteID = SiteID;
                    mode.InputID = Utils.ParseInt(base.GetLoginAccountId().ToString(),0);
                    mode.InputPerson = base.GetLoginAccountName();
                    mode.InputDate = DateTime.Now;
                    mode.RoleDescription = Utils.HtmlEncode(txtRoleDescription.Text.Trim());
                    mode.RoleOrder = Utils.ParseInt(txtRoleOrder.Text.Trim(),0);
                    returnMsg = bll.Save(tranType, mode);
                    int MsgNum = Utils.ParseInt(returnMsg, 0);
                    string logTitle = Request.Form["hidLogTitle"];
                        
                    if (logTitle != txtRoleName.Text)
                    {
                        logTitle = logTitle + " => " + txtRoleName.Text;
                    }

                    if (MsgNum == 1)
                        {
                            WriteLog(GetLogValue(logTitle, "Update", "RoleEdit", true), "", 2); //写日志
                            Utils.RunJavaScript(this, "type=1;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "'");                                                }
                    else if (MsgNum == 2)
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "RoleEdit", false), "名称已存", 3); //写日志
                        Utils.RunJavaScript(this, "type=2;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "';errmsg='该名称已存在，请重写填写角色名称！';");
                    }
                    else
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "RoleEdit", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "type=2;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "';errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");

                    }
                }
                else
                {
                    sbLog.Append("失败，无权限！");
                    Utils.RunJavaScript(this, "alert({msg:'你没有编辑角色的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            else
            {
                #region 新增角色
                // 权限验证，是否具有新增权限
                if (IsHaveRightByOperCode("New"))
                {
                    mode.RoleCode = Guid.NewGuid();
                    mode.RoleName = Utils.HtmlEncode(txtRoleName.Text.Trim());
                    mode.SiteID = SiteID;
                    mode.InputID = Utils.ParseInt(base.GetLoginAccountId().ToString(),0);
                    mode.InputPerson = base.GetLoginAccountName();
                    mode.InputDate = DateTime.Now;
                    mode.RoleDescription = Utils.HtmlEncode(txtRoleDescription.Text.Trim());
                    mode.RoleOrder = Utils.ParseInt(txtRoleOrder.Text.Trim(),0);
                    returnMsg = bll.Save(tranType, mode);
                    int MsgNum = Utils.ParseInt(returnMsg,0);
                    if (MsgNum == 1)
                        {
                            WriteLog("新增"+txtRoleName.Text+"角色成功", "", 2);// 写入操作日志
                            Utils.RunJavaScript(this, "type=0;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "'");
                        }
                    else if (MsgNum == 2)
                    {
                        WriteLog("新增" + txtRoleName.Text + "角色失败", "该名称已存在", 2);
                        Utils.RunJavaScript(this, "type=2;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "';errmsg='该名称已存在，请重写填写角色名称！';");
                    }
                    else
                    {
                        WriteLog("新增" + txtRoleName.Text + "角色失败", returnMsg, 2);
                        Utils.RunJavaScript(this, "type=2;title='" + txtRoleName.Text.Trim().Replace("'", "\\'") + "';errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增角色的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }
        #endregion
    }
}
