using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AllPower.Common;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月12日
    功能描述： 友情链接分类列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FriendLinkClassList :AdminPage
    {

        BLL.LinkManage.FriendLinkClass bllLinkClass = new AllPower.BLL.LinkManage.FriendLinkClass();
        BLL.LinkManage.FriendLink bllLink = new AllPower.BLL.LinkManage.FriendLink();
        //资源文件名
        private readonly string appResources = "FriendLink";

        #region 页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();        
            }
        }

        private void PageInit()
        {
            //分页绑定列表 
            PageData();

            //把当前url全部参数存入cookie中            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
        }
        #endregion

        #region 添加
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("FriendLinkClassEdit.aspx?action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.AlertMessage(this, "你没有添加操作权限！");
                return;
            }
        }
        #endregion

        #region 删除

        

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Delete(GetAllChkId());
        }

        //删除方法
        private void Delete(string idList)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                if (!string.IsNullOrEmpty(idList))
                {
                    string strMessage = bllLinkClass.FriendLinkClassSet("DEL", "", idList);
                    int result = Utils.ParseInt(strMessage, 0);

                    if (result >= 1)  //删除成功
                    {
                        WriteLogAndShowMessage(true, "", 2, Utils.GetResourcesValue(appResources, "DelSuccess"));

                        PageInit();
                    }
                    else if (result == -1) //分类名称已被使用，不能删除
                    {
                        WriteLogAndShowMessage(false, Utils.GetResourcesValue(appResources, "ClassIsUse"), 3, Utils.GetResourcesValue(appResources, "ClassIsUse"));
                    }
                    else  //删除失败
                    {
                        WriteLogAndShowMessage(false, strMessage, 3, Utils.GetResourcesValue(appResources, "DelFail"));
                    }
                }
            }
            else
            {
                Utils.AlertMessage(this, "你没有删除操作权限！");
            }
        }

        /// <summary>
        /// 写操作日志且弹出提示消息 
        /// </summary>
        /// <param name="SuccessOrFailure">成功或者是不，true=成功，false=失败</param>
        /// <param Name="PostContent">提交内容</param>
        /// <param Name="LogType">日志类型，1=登录日志，2=操作日志，3=错误日志</param>
        /// <param Name="alertMessage">弹出框提示消息</param>
        private void WriteLogAndShowMessage(bool successOrFailure,  string postContent, int LogType,string alertMessage)
        {
            WriteLog(GetLogValue(LogTitle, "Del", "FriendLinkClass", successOrFailure), postContent, LogType);
            Utils.AlertMessage(this, alertMessage);
        }
     


        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        } 
       #endregion

        #region 排序
        protected void btnOrders_Click(object sender, EventArgs e)
        {
            if (!IsHaveRightByOperCode("Order"))
            {
                Utils.AlertMessage(this, "你没有排序权限的操作！");
                return;
            }
            TextBox txtOrder = null;
            HiddenField hidId = null;
            for (int i = 0; i < rptClass.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
            {
                txtOrder = rptClass.Items[i].FindControl("txtOrders") as TextBox;
                hidId = rptClass.Items[i].FindControl("hidIds") as HiddenField;
                bllLinkClass.FriendLinkClassSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
            }
            PageInit();

        }
        #endregion

        #region 分页
                private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("NodeCode",NodeCode);
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = Split;
            p.RptControls = rptClass;
            bllLinkClass.PageData(p);

        }
        #endregion

        #region 加粗/文本颜色显示
        /// <summary>
        /// 加粗/文本颜色显示
        /// </summary>
        /// <param name="text">文本</param>
        /// <param name="objIsBold">是否加粗</param>
        /// <param name="objTextColor">文本颜色</param>
        /// <returns></returns>
        protected string IsBoldTextColor(string text, object objIsBold, object objTextColor)
        {
            if (Utils.ParseInt(objIsBold, 0) == 1)
            {
                text = "<b>" + text + "</b>";
            }

             
            if (!String.IsNullOrEmpty(objTextColor.ToString()))
            {
                text = "<font color='" + objTextColor.ToString() + "'>" + text + "</font>";
            }

            return text;
        }
        #endregion
    }
}
