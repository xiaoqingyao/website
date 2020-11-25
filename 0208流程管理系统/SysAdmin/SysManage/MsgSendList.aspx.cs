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
    作者:      肖丹
    创建时间： 2010年5月19日
    功能描述： 己发送短消息管理
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class MsgSend :AdminPage
    {
        DataSet dsUserName = new DataSet();
        Account BllAccount = new Account();
        AllPower.BLL.SysManage.Message objMsg = new AllPower.BLL.SysManage.Message();
        StringBuilder sbLog = new StringBuilder(16);

        private string strDate1 = null, strDate2 = null;
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrDate1
        {
            get
            {
                if (strDate1 == null)
                {
                    strDate1 = Utils.UrlDecode(Utils.ReqUrlParameter("date1"));
                }
                return strDate1;
            }
        }
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrDate2
        {
            get
            {
                if (strDate2 == null)
                {
                    strDate2 = Utils.UrlDecode(Utils.ReqUrlParameter("date2"));
                }
                return strDate2;
            }
        }

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
        }

        #region Repeater列表的用户组列
        public string GetUserName(string strUserID,string strUserName) //repeater列表的 用户组列
        {
            if (strUserID == "0")
            {
                strUserName=ConfigurationManager.AppSettings["SuperUser"].ToString();
            }
            return strUserName;
        }
        #endregion

        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            if (StrKeySearch != "")
            {
                dicWhere.Add("Content", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            if (StrDate1 != "")
            {
                dicWhere.Add("StartDate", StrDate1);
                txtDate1.Text = StrDate1;
            }
            if (StrDate2 != "")
            {
                dicWhere.Add("EndDate", StrDate2 );
                txtDate2.Text = StrDate2;
            }
            dicWhere.Add("SendUID", Utils.UrlDecode(GetLoginAccountId()));

            dicWhere.Add("SiteID", Utils.UrlDecode(SiteID.ToString()));
            p.Aspnetpage = Split;
            p.RptControls = rptMessageList;
            p.DicWhere = dicWhere;
            /*
             * select isnull(userid,0) as userid,isnull(UserName,'admin') as username from( select a.UserID,a.UserName from K_SysAccount as A,K_SysAccountSite as B where a.UserID=B.UserID and SiteID=@siteid
    ) a right join
    (select SendeeUID from (select
     row_number() over(order by addDate desc) as Rownum,* from 
     (sELECT B.ID,B.AddDate,SendeeUID FROM K_SysMessageSendee as A,k_SysMessage as B where A.MessageID=B.ID and siteid=@siteid)T1)T where T.Rownum between @beginIndex and @endIndex) c  on a.UserID = c.SendeeUID
   
             */
            //dsUserName = BllAccount.GetUserGroupName(p, SiteID);
            objMsg.PageData(p, 1);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            //没有翻页就不需要再执行页面绑定
            bool ispc = IsPageChanged();
            if (ispc)
            {
                SplitDataBind();
            }
        }
        public string ShowIsRead(string IsRead)
        {
            string strReturn = "";
            if (IsRead == "False")
            {
                strReturn = "<font color='red'>未读</font>";
            }
            else
            {
                strReturn = "己读";
            }
            return strReturn;
        }

        public void MsgReceiveList_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        void OnDel(string id)
        {
            string tranType;    // 事务类型
            string returnMsg = "1";   // 事务返回信息

            tranType = "DEL";
            returnMsg = objMsg.MessageSet(tranType, null, id);
            int result = Utils.ParseInt(returnMsg, 0);
            if (result == 0)  //操作失败
            {
                WriteLog(GetLogValue(LogTitle, "Del", "MsgModel", false), returnMsg, 3); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作失败，请重试！',title:'提示信息'})");
            }
            else //操作成功
            {
                WriteLog(GetLogValue(LogTitle, "Del", "MsgModel", true), "", 2); //写日志
                Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
            }
            PageInit();
        }

        //多选后删除
        protected void btndel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        //查询按钮
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            Utils.UrlRedirect("MsgSendList.aspx?NodeCode=" + NodeCode + "&Date1=" + txtDate1.Text + "&Date2=" + txtDate2.Text + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
        }
    }
}
