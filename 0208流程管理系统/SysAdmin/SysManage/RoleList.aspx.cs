using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AllPower.Common;
using AllPower.Model;
using AllPower.BLL.SysManage;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月6日
    功能描述： 角色管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class RoleManage : AdminPage
    {
        Role bllRole = new Role();
        RightTool Rtool = new RightTool();
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
            //repeater绑定
            SplitDataBind();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中  

        }

        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.SysManage.Role objRole = new AllPower.BLL.SysManage.Role();

            if (StrKeySearch != "")
            {
                dicWhere.Add("RoleName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            dicWhere.Add("SiteID", SiteID.ToString());
            p.Aspnetpage = Split;
            p.RptControls = rptUserGropeList;
            p.DicWhere = dicWhere;
            objRole.PageData(p);
        }
        
        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg = "1";   // 事务返回信息

                tranType = "DEL";
                returnMsg = bllRole.RoleSet(tranType, "", id);
                int result = Utils.ParseInt(returnMsg, 0);
                try
                {
                    if (result > 0)  //操作失败
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", true), "", 2); //写日志
                        Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");

                    }
                    else //操作成功
                    {
                        WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", false), returnMsg, 3); //写日志
                        Utils.RunJavaScript(this, "alert({msg:'该角色下有用户组，无法删除！',title:'提示信息'})");
                    }
                }
                catch
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "UserGroupManage", false), returnMsg, 3); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作失败！',title:'提示信息'})");
                }              
                PageInit();
            }
            else
            {
                sbLog.Append("删除角色失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'删除角色失败，没有权限！',title:'提示信息'})");
            }
        }

        protected void btnnew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("RoleEdit.aspx?Action=New&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有新增角色的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }

        protected void btndel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));          
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("RoleList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
            }
        }
    }
}
