using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Data;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 用户组管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class UserGropManage : AdminPage
    {
        UserGroup bllUserGrop = new UserGroup();
        protected string RoleCode = "";
        DataSet dsUserGroupRole = new DataSet();
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            SplitDataBind();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中 
            SetRight(this, rptUserGropeList);

        }

        #region Repeater列表的用户组角色列
        public string GetRoleName(string strUserGroupCode) //repeater列表的 所属角色列
        {
            StringBuilder sbRoleCode = new StringBuilder();
            
            StringBuilder sbRoleName = new StringBuilder();
            sbRoleName.Append(" ");
            for (int i = 0; i < dsUserGroupRole.Tables[1].Rows.Count; i++)
            {
                if (strUserGroupCode == dsUserGroupRole.Tables[1].Rows[i]["UserGroupCode"].ToString())
                {
                    sbRoleName.Append(dsUserGroupRole.Tables[1].Rows[i]["Rolename"].ToString());
                    sbRoleName.Append("|");
                    sbRoleCode.Append(dsUserGroupRole.Tables[1].Rows[i]["RoleCode"].ToString());
                    sbRoleCode.Append(",");
                }
            }
            try
            {
                RoleCode = sbRoleCode.Remove(sbRoleCode.Length - 1, 1).ToString().Trim();
            }
            catch
            {
                RoleCode = "";
            }

            return sbRoleName.Remove(sbRoleName.Length - 1, 1).ToString().Trim();
        }
        #endregion
        
        #region Repeater列表的用户组父用户组列
        public string GetFatherGroupName(string strParentNumCode) //repeater列表的 所属角色列
        {
            StringBuilder sbGroupName = new StringBuilder(49);
            sbGroupName.Append(" ");
            if (strParentNumCode == "0")
            {
                return "无";
            }
            else
            {
                for (int i = 0; i < dsUserGroupRole.Tables[0].Rows.Count; i++)
                {
                    if (strParentNumCode == dsUserGroupRole.Tables[0].Rows[i]["numCode"].ToString())
                    {
                        sbGroupName.Append(dsUserGroupRole.Tables[0].Rows[i]["UserGroupName"].ToString());
                        sbGroupName.Append("|");
                    }
                }
                return sbGroupName.Remove(sbGroupName.Length - 1, 1).ToString().Trim();
            }
        }
        #endregion

        /// <summary>
        /// 无限分类的用户组显示结构处理
        /// </summary>
        public string GetGroupName(string strUserGroup, string strCode)
        {             
            string temp_str="";
            int    numCode = strCode.Length / 3;
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
                temp_str = temp_str + strUserGroup;
                return temp_str;
            }
        

        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.SysManage.UserGropManage objUserGrop = new AllPower.BLL.SysManage.UserGropManage();

            if (StrKeySearch != "")
            {
                dicWhere.Add("UserGroupName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            dicWhere.Add("SiteID", SiteID.ToString());
            p.Aspnetpage = Split;
            p.RptControls = rptUserGropeList;
            p.DicWhere = dicWhere;

            //把表保存到临时内存中
            dsUserGroupRole = bllUserGrop.GetList("GROUPANDROLENAME",Utils.getOneParams(SiteID.ToString ()));
            //dsUserGroupName = BllgroupRole.GetUserGroupRole(p);
            objUserGrop.PageData(p,1);
        }


        protected void Butnew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("UserGropEdit.aspx?Action=New&NodeCode=" + NodeCode);
            }
        }

        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg = "1";   // 事务返回信息

                tranType = "DEL";
                returnMsg = bllUserGrop.UserGroupSet(tranType, "", id);
                int result = Utils.ParseInt(returnMsg, 0);
                try
                {
                    if (result ==1)  //操作失败
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", true), "", 2); //写日志
                       Utils.RunJavaScript(this, "nmsgtitle='提示信息';nmsgcontent='操作成功';");
                    }
                    else if(result==3)//操作成功
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", false), "该用户组下有用户，无法删除！", 3); //写日志
                        Utils.RunJavaScript(this, "nmsgtitle='提示信息';nmsgcontent='该用户组下有用户，无法删除！';");
                    }
                }
                catch
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", false), returnMsg, 3); //写日志
                    Utils.RunJavaScript(this, "nmsgtitle='提示信息';nmsgcontent='"+returnMsg.Replace("'","\\'").Replace("\r\n","<br>")+"';");
                }
                PageInit();
            }
            else
            {
                sbLog.Append("删除角色失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'删除角色失败，没有权限！',title:'提示信息'})");
            }
        }

        protected void butdel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("UserGropList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转
            }
        }
    }
}
