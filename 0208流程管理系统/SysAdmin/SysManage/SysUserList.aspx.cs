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

/*==========================================
Copyright (C) 2010 华强北在线

作者:肖丹
创建时间：2010-03-27
功能描述：用户列表

更新日期        更新人      更新原因/内容
--=========================================*/
namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SysUserList : AdminPage
    {
        #region 初始参数
        public string strEnable = "";
        //设置变量
        private string  _userid;
        //逻辑层Account   
        AllPower.BLL.SysManage.Account BllAccount = new AllPower.BLL.SysManage.Account();
        //实体层Account
        AllPower.Model.SysManage.Account ModelAccount = new AllPower.Model.SysManage.Account();
        AllPower.BLL.SysManage.AccountSite bllAccSite = new AllPower.BLL.SysManage.AccountSite();
        StringBuilder sbLog = new StringBuilder(16);
        
        public string UserId
        {
            get
            {
                if (this._userid == null)
                {
                    this._userid = Utils.ReqUrlParameter("Userid").ToUpper();
                }

                return this._userid;
            }
            set { _userid = value; }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            UserId = GetLoginAccountId();
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            //数据绑定
            SplitDataBind();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中      
            SetRight(this.Page, RptUser);
        }
       
        #region 数据分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            if (StrKeySearch != "")
            {
                dicWhere.Add("UserName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }
            dicWhere.Add("SiteID",this.SiteID.ToString());
            p.DicWhere = dicWhere;
            p.Aspnetpage = Split;
            p.RptControls = RptUser;
            BllAccount.PageData(p,2);
        }

        #endregion

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("SysUserEdit.aspx?Action=NEW&NodeCode=" + this.NodeCode);
            }
            else
            {
                //Utils.RunJavaScript(this, "alert({msg:'你没有添加用户的权限，请联系站点管理员！',title:'提示信息'})");
                JavascriptMsg("提示信息", "你没有添加用户的权限，请联系站点管理员！");
            }
        }
        public void SysUserList_State(object sender, CommandEventArgs e)
        {
            string[] strMessage = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id、是否启用状态
            if (hidMyID.Value.Trim () == strMessage[0])
            {
                //Utils.RunJavaScript(this, "alert({msg:'不能修改当前登陆账户的信息！',title:'提示信息'})");
                JavascriptMsg("提示信息", "不能修改当前登陆账户的信息！");
                return;
            }
            //判断是否有权限

            if (IsHaveRightByOperCode("State"))
            {
                string returnMsg;

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
                returnMsg = bllAccSite.AccountSiteSet("STATE", iEnable.ToString(), strMessage[0]);
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                //Utils.RunJavaScript(this, "alert({msg:'更新操作失败，没有权限！',title:'提示信息'})");
                JavascriptMsg("提示信息", "更新操作失败，没有权限！");
                WriteLog("操作状态修改" + sbLog.ToString(), "", 2); //写日志
            }
        }

        public void SysUserList_Del(object sender, CommandEventArgs e)
        {
            if (!base.IsHaveRightByOperCode("Delete"))
            {
                //Utils.RunJavaScript(this, "alert({msg:'删除操作失败，没有权限！',title:'提示信息'})");
                JavascriptMsg("提示信息", "删除操作失败，没有权限！");
                return;
            }
            OnDel(e.CommandArgument.ToString());
        }

        void OnDel(string id)
        {
            if (hidMyID.Value.Trim() == id)
            {
                //Utils.RunJavaScript(this, "alert({msg:'不能删除当前登陆账户的信息！',title:'提示信息'})");
                JavascriptMsg("提示信息", "不能删除当前登陆账户的信息！");
                return;
            }

            string tranType;    // 事务类型
            string returnMsg = "1";   // 事务返回信息
            tranType = "DEL";
            returnMsg = bllAccSite.AccountSiteSet(tranType, null, id);
            int result = Utils.ParseInt(returnMsg, 0);

            if (result <= 0)  //操作失败
            {
                WriteLog(GetLogValue(LogTitle, "Del", "SysUserList", false), returnMsg, 3); //写日志

                //Utils.RunJavaScript(this, "alert({msg:'操作失败，请重试！',title:'提示信息'})");
                JavascriptMsg("提示信息", "操作失败，请重试！");
            }
            else //操作成功
            {
                WriteLog(GetLogValue(LogTitle, "Del", "SysUserList", true), "", 2); //写日志

                //Utils.RunJavaScript(this, "alert({msg:'操作成功！',title:'提示信息'})");
                JavascriptMsg("提示信息", "操作成功！");
            }

            PageInit();
        }

        protected void BtnDel_Click(object sender, EventArgs e)
        {
            if (!base.IsHaveRightByOperCode("Delete"))
            {
                //Utils.RunJavaScript(this, "alert({msg:'删除操作失败，没有权限！',title:'提示信息'})");
                JavascriptMsg("提示信息", "删除操作失败，没有权限！");
                return;
            }
            string userid = Request.Form["chkId"];
            if (!string.IsNullOrEmpty(userid))
            {
                userid = Request.Form["chkId"].Replace(", ", ",");
                //去掉自己
                userid = ("," + userid + ",").Replace("," + hidMyID.Value.Trim() + ",", ",");
                OnDel(userid);
            }
        }
        private void JavascriptMsg(string msgTitle, string msgContent)
        {
            Utils.RunJavaScript(this, "nmsgtitle='" + msgTitle + "';nmsgcontent='" + msgContent + "';");
        }
        protected void btnQuery_Click(object sender, EventArgs e)
        {
            Utils.UrlRedirect("SysUserList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
        }

        public string GetMyID(string myUserID,string myID)
        {
            strEnable = "";
            if (myUserID == UserId)
            {
                this.hidMyID.Value = myID;
                strEnable = "disabled";
            }
            return myID;
        }
    }
}
