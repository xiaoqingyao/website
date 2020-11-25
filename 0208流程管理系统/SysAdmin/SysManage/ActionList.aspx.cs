#region 引用程序集
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
using AllPower.BLL.SysManage;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年3月31日
    功能描述： 操作管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class ActionList : AdminPage
    {
        AllPower.BLL.SysManage.ActionPermit objActionPermit = new AllPower.BLL.SysManage.ActionPermit();
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
            //绑定列表控件
            SplitDataBind();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中       
            //判断权限
            SetRight(this.Page, rptActionList);
        }
      
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            if (StrKeySearch != "")
            {
                dicWhere.Add(Utils.UrlDecode(Request.QueryString["searchType"]), Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            p.Aspnetpage = Split;
            p.RptControls = rptActionList;
            p.DicWhere = dicWhere;
            objActionPermit.PageData(p,1,SiteID);            
        }

        public void ActionList_State(object sender, CommandEventArgs e)
        {
            //判断是否有权限
            if (IsHaveRightByOperCode("State"))
            {
                string returnMsg;
                string[] strMessage = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态
                #region 是否启用状态标识更改
                int iEnable = AllPower.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                //tranType = STATE，调用存储过程名[proc_K_SysModuleSet]
                returnMsg = objActionPermit.ActionPermitSet("STATE", iEnable.ToString(), strMessage[0]);
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'更新操作失败，没有权限！',title:'提示信息'})");
                WriteLog("操作状态修改" + sbLog.ToString(), "", 2); //写日志
            }
        }

        public void ActionList_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        //添加按钮
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("ActionEdit.aspx?Action=add&NodeCode=" + NodeCode);
            }
        }
        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg="1";   // 事务返回信息

                tranType = "DEL";
                returnMsg = objActionPermit.ActionPermitSet(tranType, null, id);
                int result = Utils.ParseInt(returnMsg, 0);
                if (result == 0)  //操作失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "ActionModel", false), returnMsg, 3); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作失败，请重试！',title:'提示信息'})");
                }
                else //操作成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "ActionModel", true), "", 2); //写日志
                    Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                }
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                Utils.RunJavaScript(this, "alert({msg:'删除操作失败，没有权限！',title:'提示信息'})");
            }
        }
      
        //多选后删除
        protected void btndel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));          
        }

        //查询按钮
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("ActionList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim()) + "&searchType=" + Utils.UrlEncode(Request.Form["searchType"])); //页面跳转 
            }
        }
    }
}
