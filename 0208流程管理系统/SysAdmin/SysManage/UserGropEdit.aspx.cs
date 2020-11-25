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
    创建时间： 2010年3月30日
    功能描述： 用户组编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class UserGropEidt : AllPower.Web.Admin.AdminPage
    {
        AllPower.BLL.SysManage.UserGroup bll = new AllPower.BLL.SysManage.UserGroup();
        UserGroupRole objGroupRole = new UserGroupRole();
        DataTable dtRole =null;
        DataTable dtUserGroup= null;
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDll();               
                PageInit();
                BindDate();
            }
        }       

        private void BindDate()
        {
            //绑定多选用户组角色
            Role bllRole = new Role();
            DataTable dt = null;
            chkRoleCode.Items.Clear();
            if (hdPCode.Value == "0"||hdPCode.Value=="")
            {
                //如果是一级用户组，则把所有的角色读出来
                dt=bllRole.GetList("ALL", Utils.getOneParams(SiteID.ToString()));
            }
            else
            {
                //如果不是，则读上一级用户组的所属角色
                dt=bllRole.GetList("GETROLE",Utils.getOneParams(hdPCode.Value));
            }
            if (dt.Rows.Count > 0)
            {
                this.chkRoleCode.DataSource = dt.DefaultView;
                this.chkRoleCode.DataTextField = "RoleName";
                this.chkRoleCode.DataValueField = "RoleCode";
                this.chkRoleCode.DataBind();
            }
            InitChklist();
            
        }

        private void BindDll()
        {
            //绑定用户组下拉列表
            oparate();
            ddlUserGroup.DataSource = dtUserGroup.DefaultView;
            ddlUserGroup.DataTextField = "UserGroupName";
            ddlUserGroup.DataValueField = "NumCode";
            ddlUserGroup.DataBind();
            ListItem ls = new ListItem("请选择", "0");//追加一项
            this.ddlUserGroup.Items.Insert(0, ls);
        }

        #region 无限分类的用户组显示结构处理
        public void oparate()
        {
            dtUserGroup = bll.GetList("ALL", Utils.getOneParams(this.SiteID.ToString())).Tables [0];
            string temp_str = "";
            int numCode =0;
            string strCode="";
            for (int i = 0; i < dtUserGroup.Rows.Count; i++)
            {
                strCode=dtUserGroup.Rows[i]["numCode"].ToString();
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

        #region 页面初始化
        private void PageInit()
        {
            if (this.Action == "EDIT")
            {
                DataTable dt;                
                SelectParams selParams = new SelectParams();
                selParams.S1 = this.ID;
                dt = bll.GetList("ONE", selParams).Tables[0];

                btnSource.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtUserGroupName.Text = Utils.HtmlDecode(dr["UserGroupName"].ToString());
                    hidLogTitle.Value = dr["UserGroupName"].ToString();
                    txtUserGroupRemark.Text = dr["UserGroupRemark"].ToString();
                    txtUserGroupOrder.Text = Utils.HtmlDecode(dr["UserGroupOrder"].ToString());
                    ddlUserGroup.SelectedValue=Utils.HtmlDecode(dr["ParentNumCode"].ToString());
                    hdPCode.Value = Utils.HtmlDecode(dr["ParentNumCode"].ToString());
                    hdNCode.Value = Utils.HtmlDecode(dr["NumCode"].ToString());
                    hdnID.Value = this.ID;
                }
                ddlUserGroup.Enabled = false;  
            }
        }
        #endregion
 
        #region 根据用户组读取角色 @author 肖丹 by 2010-04-15 
        private void InitChklist()
        {
            
            dtRole = bll.GetList("GETROLE", Utils.getTwoParams(this.ID,this.SiteID.ToString())).Tables[0];
                      
            string strChk = "";
            if (dtRole.Rows.Count > 0)
            {
                for (int k = 0; k < dtRole.Rows.Count; k++)
                {
                    foreach (ListItem li in this.chkRoleCode.Items)
                    {
                        DataRow dr = dtRole.Rows[k];
                        if (li.Value == dr["RoleCode"].ToString())
                        {
                            li.Selected = true;
                            //li.Enabled = isCheck;
                            strChk = strChk + li.Value + ',';
                        }
                    }
                }
            }
            dtRole.Dispose();
            dtRole = null;
            
            if (strChk.Length > 0)
            {
                hdInitChk.Value = strChk.Substring(0, strChk.Length - 1);              
            }
            else
            {
                hdInitChk.Value = "";
            }            
        }
        #endregion

        #region 返回选中的CheckBox信息  @author 肖丹 by 2010-04-15
        protected string GetCheckResout()
        {
            string strRrsout = string.Empty;
            foreach (ListItem li in this.chkRoleCode.Items)
            {
                if (li.Selected)
                {
                    strRrsout = strRrsout + li.Value + ",";
                }
            }
            if (strRrsout.Length > 0)
            {
                return strRrsout.Substring(0, strRrsout.Length - 1);
            }
            else
            {
                return "";
            }
        }
        #endregion

        #region 按钮事件
        protected void btnSource_Click(object sender, EventArgs e)
        {
            string id = hdnID.Value;
            string returnMsg = "";
            string tranType = "NEW";
            AllPower.Model.SysManage.UserGroup mode = new AllPower.Model.SysManage.UserGroup();

            if (id != "")   // 修改关键字
            {
                #region 修改用户组

                // 权限验证，是否具有修改权限

                if (IsHaveRightByOperCode("Edit"))
                {
                    tranType = "EDIT";
                    mode.UserGroupCode = new Guid(id);
                    mode.UserGroupName = Utils.HtmlEncode(txtUserGroupName.Text.Trim());
                    mode.SiteID = SiteID;
                    mode.ParentNumCode = ddlUserGroup.SelectedValue;
                    //mode.IsParent = false;
                    //选择角色则是一级用户组，或者它选择的用户组没变，它不用改变numcode和parentnumcode
                    if (hdPCode.Value == ddlUserGroup.SelectedValue)
                    {
                        mode.ParentNumCode = hdPCode.Value;
                        if (hdNCode.Value != "")
                        {
                            mode.NumCode = hdNCode.Value;
                        }
                        else
                        {
                            mode.NumCode = mode.ParentNumCode + "001";
                        }
                    }
                    else
                    {
                        mode.ParentNumCode = ddlUserGroup.SelectedValue;
                        DataTable dt = bll.GetList("GETMAXPNUMCODE", Utils.getOneParams(mode.ParentNumCode)).Tables[0];
                        mode.NumCode = dt.Rows[0]["MaxCode"].ToString();
                        if (mode.NumCode == "")
                        {
                            mode.NumCode = mode.ParentNumCode + "001";
                        }
                    }


                    mode.InputID = Convert.ToInt32(base.GetLoginAccountId().ToString());
                    mode.InputPerson = base.GetLoginAccountName();
                    mode.InputDate = DateTime.Now;
                    mode.UserGroupRemark = Utils.HtmlEncode(txtUserGroupRemark.Text.Trim());
                    mode.UserGroupOrder = Utils.ParseInt(txtUserGroupOrder.Text.Trim(),0);


                    //删除原来有的角色
                    //objGroupRole.UserGroupRoleSet("DELONE", "", id);
                    //***********编辑用户组角色************
                    AddRole();

                    //编辑用户组

                    returnMsg = bll.Save(tranType, mode);
                    int reNum = Utils.ParseInt(returnMsg, 0);
                    string logTitle = Request.Form["hidLogTitle"];
                    if (logTitle != txtUserGroupName.Text)
                    {
                        logTitle = logTitle + " => " + txtUserGroupName.Text;
                    }

                    if (reNum == 1)
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "UserGropEdit", true), "", 2); //写日志
                        Utils.RunJavaScript(this, "type=1;title='" + txtUserGroupName.Text.Replace("'", "\\'") + "';");

                    }
                    else if (reNum == 2)
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "UserGropEdit", false), "用户组名称已存在，请重新填写", 3); //写日志
                        Utils.RunJavaScript(this, "type=2;errmsg='用户组名称已存在，请重新填写！';");
                    }
                    else
                    {
                        WriteLog(GetLogValue(logTitle, "Update", "UserGropEdit", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n","<br>") + "';");
                    }
                }
                else
                {
                    sbLog.Append("失败，无权限！");
                    Utils.RunJavaScript(this, "alert({msg:'你没有编辑用户组的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            else
            {
                #region 新增用户组

                //判断是否有权限

                if (IsHaveRightByOperCode("New"))
                {
                    mode.UserGroupCode = Guid.NewGuid();
                    hdnID.Value = mode.UserGroupCode.ToString();
                    mode.UserGroupName = Utils.HtmlEncode(txtUserGroupName.Text.Trim());
                    mode.SiteID = SiteID;
                    //mode.ParentNumCode = ddlUserGroup.SelectedValue;

                    //如果选了角色(选择角色的返回值长度>10)，就是一级用户组,得到最大一级用户组的numcode+1
                    if (ddlUserGroup.SelectedValue == "0")
                    {
                        DataTable dt = bll.GetList("GETMAXPNUMCODE", Utils.getOneParams("0")).Tables[0];
                        mode.NumCode = dt.Rows[0]["MaxCode"].ToString();
                        mode.ParentNumCode = "0";
                    }
                    //选择角色则是一级用户组，或者它选择的用户组没变，它不用改变numcode和parentnumcode
                    else
                    {
                        mode.ParentNumCode = ddlUserGroup.SelectedValue;
                        DataTable dt = bll.GetList("GETMAXPNUMCODE", Utils.getOneParams(mode.ParentNumCode)).Tables[0];
                        mode.NumCode = dt.Rows[0]["MaxCode"].ToString();
                        if (mode.NumCode == "")
                        {
                            mode.NumCode = mode.ParentNumCode + "001";
                        }
                    }

                    AddRole();
                    mode.InputID = Utils.ParseInt(base.GetLoginAccountId().ToString(), 0);
                    mode.InputPerson = base.GetLoginAccountName();
                    mode.InputDate = DateTime.Now;
                    mode.UserGroupRemark = Utils.HtmlEncode(txtUserGroupRemark.Text.Trim());
                    mode.UserGroupOrder = Utils.ParseInt(txtUserGroupOrder.Text.Trim(), 0);
                    returnMsg = bll.Save(tranType, mode);
                    int reNum = Utils.ParseInt(returnMsg, 0);

                    if (reNum == 1)
                    {
                        WriteLog("添加" + txtUserGroupName.Text + "用户组成功！", "", 2);
                        Utils.RunJavaScript(this, "type=0;title='" + txtUserGroupName.Text.Replace("'", "\\'") + "';");
                    }
                    else if (reNum == 2)
                    {
                        WriteLog("添加" + txtUserGroupName.Text + "用户组失败！", "用户组名称已存在，请重新填写", 3); //写日志
                        Utils.RunJavaScript(this, "type=2;errmsg='用户组名称已存在，请重新填写！';");
                    }
                    else
                    {
                        WriteLog("添加" + txtUserGroupName.Text + "用户组失败！", returnMsg, 2);// 写入操作日志
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n","<br>") + "';");
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增用户组的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }

        }
        #endregion

        #region 添加角色
        private void AddRole()
        {
            //删除自己角色的同时，删除所属它下面子用户组的角色 
            string strInitRole = hdInitChk.Value;
            //添加现选中的角色
            if (GetCheckResout().Length > 10)
            {
                string[] word = Utils.strSplit(GetCheckResout(), ",");
                for (int i = 0; i < word.Length; i++)
                {
                    try
                    {
                        //添加现选的角色
                        if (strInitRole.IndexOf(word[i].ToString()) == -1)
                        {
                            AllPower.Model.SysManage.UserGroupRole ModeGroupR = new AllPower.Model.SysManage.UserGroupRole();
                            ModeGroupR.ID = "0";
                            ModeGroupR.RoleCode = new Guid(word[i].ToString());
                            ModeGroupR.UserGroupCode = new Guid(hdnID.Value);
                            objGroupRole.Save("NEW", ModeGroupR);
                        }
                        else
                        {
                            strInitRole = strInitRole.Replace(word[i].ToString(), "");
                            strInitRole = strInitRole.Replace(",,", ",");
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }
            string[] word1=Utils.strSplit(strInitRole,",");

            for (int j = 0; j < word1.Length; j++)
            {
                //删除自己角色的同时，删除所属它下面子用户组的角色 
                objGroupRole.UserGroupRoleSet("DELALL", word1[j].ToString(), hdNCode.Value);
            }
        }
        #endregion

        protected void ddlUserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            //根据所选择的所属用户组，得到它的角色
            hdPCode.Value = ddlUserGroup.SelectedValue;
            BindDate();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserGropList.aspx?NodeID=" + NodeID);
        }
    }
}
