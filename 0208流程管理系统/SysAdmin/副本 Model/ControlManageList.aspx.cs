#region   引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Text.RegularExpressions;
using Wuqi.Webdiyer;
using KingTop.Common;
using KingTop.BLL;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*----------------------------------------------------------------------------------------
// Copyright (C) 2010 图派科技 
// 作者：吴岸标
// 创建日期：2010-03-23
// 功能描述：模型列表处理
// 更新日期        更新人      更新原因/内容
//
----------------------------------------------------------------------------------------*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ModelList : AdminPage
    {
        #region 变量成员
        protected BLL.Content.ControlManageList ctrManageList;
        protected string flowLink;
        protected string originalUrlDisplay = "none";       // 是否显示返回按钮
        protected string originalUrl = string.Empty;        // 返回按钮返回地址参数
        protected string backUrlParam = string.Empty;       // 返回时传递的参数
        protected string jsMessage;

        private string SearchWhere = string.Empty;
        private string SearchlinkWhere = string.Empty;
        private string ModelPageNum = string.Empty;
        private int pageindex = 0;
        #endregion

        #region 页面初始数据加载
        protected void Page_Load(object sender, EventArgs e)
        {
            //清空查询条件
            if (!string.IsNullOrEmpty(Request.QueryString["IsFirst"]))
            {
                Response.Cookies["search"].Value = null;
                Response.Cookies["searchlink"].Value = null;
                Response.Cookies["ModelPage"].Value = null;
                Response.Redirect(Request.Url.ToString().Replace("IsFirst=1", ""));
            }
            else if (Request.Form.Keys.Count == 0)
            {
                string urlreferrer = Request.UrlReferrer.ToString().ToLower().Replace("list", "").Replace("edit", "");
                string scriptname = Request.ServerVariables["SCRIPT_NAME"].ToLower().Replace("list", "").Replace("edit", "");
                if (urlreferrer.IndexOf(scriptname) != -1)
                {
                    SearchWhere = Server.UrlDecode(Request.Cookies["search"].Value);
                    SearchlinkWhere = Server.UrlDecode(Request.Cookies["searchlink"].Value);
                    ModelPageNum = Server.UrlDecode(Request.Cookies["ModelPage"].Value);
                }

            }
            else if (Request.Form.Keys.Count > 0)
            {
                Response.Cookies["search"].Value = null;
                Response.Cookies["searchlink"].Value = null;
                Response.Cookies["ModelPage"].Value = null;
                pageindex = 1;
            }
            ctrManageList = new BLL.Content.ControlManageList(hdnModelID.Value, hdnTableName.Value);

            if (hdnDeliverAndSearchUrlParam != null)
            {
                ctrManageList.DeliverAndSearchUrlParam = hdnDeliverAndSearchUrlParam.Value;
            }

            if (hdnNotSearchField != null)
            {
                ctrManageList.NotSearchField = "," + hdnNotSearchField.Value.Replace(" ", "").ToLower() + ",";
            }

            ctrManageList.SiteID = SiteID;
            ctrManageList.NodeCode = NodeCode;
            ctrManageList.AccountID = Utils.ParseInt(GetLoginAccountId(), 0);
            ctrManageList.UserNo = UserNo;
            ctrManageList.IP = Request.UserHostAddress;

            if (IsPostBack)
            {
                LinkClick();
            }


            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                Response.Cookies["ModelPage"].Value = Request.QueryString["page"];
            }
            ctrManageList.BindEnabledFlowStep(rptFlowStep, rptFlowState);
            PageInit();

            SetRight(this.Page, rptListInfo);
        }

        private void PageInit()
        {
            if (hdnIsAllowFlow != null)
            {
                if (ctrManageList.IsAllowFlow)  // 是否启用流程审核
                {
                    hdnIsAllowFlow.Value = "1";
                }
                else
                {
                    hdnIsAllowFlow.Value = "0";
                }
            }

            if (!string.IsNullOrEmpty(Request.QueryString["OriginalUrl"]))  // 调用页面地址参数
            {
                originalUrlDisplay = "";
                originalUrl = Request.QueryString["OriginalUrl"].Replace(":", ":\"").Replace(",", "\",").Replace("}", "\"}");
            }

            if (hdnBackDeliverUrlParam != null)
            {
                this.backUrlParam = ctrManageList.GetBackDeliverUrlParam(hdnBackDeliverUrlParam.Value);
            }

            if (hdnNodeCode != null)
            {
                hdnNodeCode.Value = NodeCode;
            }

            SplitDataBind();
        }
        #endregion

        #region 按钮操作
        /// <summary>
        /// 页面更新、删除
        /// </summary>
        private void LinkClick()
        {
            string actionType;
            string idStr;
            bool isValidate;

            isValidate = false;

            if (!string.IsNullOrEmpty(HttpContext.Current.Request.QueryString["ID"]))    // 单记录更新
            {
                idStr = Request.QueryString["ID"];
            }
            else
            {
                idStr = Request.Form["_chkID"];                      // 批量更新
            }

            actionType = ctrManageList.GetLinkType();

            switch (actionType)
            {
                case "d":                       // 删除
                    isValidate = IsHaveRightByOperCode("Delete");

                    if (isValidate)
                    {
                        ctrManageList.LinkDelete(idStr);
                    }
                    else
                    {
                        jsMessage = "alert({msg:\"对不起，您没有 删除 操作权限，请与管理员联系！\",title:\"操作提示\"});";
                    }

                    break;
                case "e":                      // 更新
                    isValidate = IsHaveRightByOperCode("Edit");

                    if (isValidate)
                    {
                        ctrManageList.LinkEdit(idStr);
                    }
                    else
                    {
                        jsMessage = "alert({msg:\"对不起，您没有 编辑 操作权限，请与管理员联系！\",title:\"操作提示\"});";
                    }
                    break;
                case "HQB_PastFlowCheck":     // 通过审核
                    //isValidate = IsHaveRightByOperCode("PastFlowCheck");
                    isValidate = IsHaveRightByOperCode("Check");

                    if (isValidate)
                    {
                        ctrManageList.FlowCheck(true);
                    }
                    else
                    {
                        jsMessage = "alert({msg:\"对不起，您没有 通过审核 操作权限，请与管理员联系！\",title:\"操作提示\"});";
                    }
                    break;
                case "HQB_CancelFlowCheck":   // 取消审核
                    //isValidate = IsHaveRightByOperCode("CancelFlowCheck");
                    isValidate = IsHaveRightByOperCode("CancelCheck");

                    if (isValidate)
                    {
                        ctrManageList.FlowCheck(false);
                    }
                    else
                    {
                        jsMessage = "alert({msg:\"对不起，您没有 取消审核 操作权限，请与管理员联系！\",title:\"操作提示\"});";
                    }
                    break;
                case "h":                   // 生成HTML
                    isValidate = IsHaveRightByOperCode("CreateHtml");

                    if (isValidate)
                    {
                        ctrManageList.CreateHtml(idStr, this.SiteDir, GetUploadImgPath, GetUploadFileUrl(), GetUploadMediaUrl(), this.GetSiteDomain());

                        if (string.IsNullOrEmpty(ctrManageList.LogException))
                        {
                            jsMessage = "alert({msg:\"HTML页生成成功！\",title:\"操作提示\"});";
                        }
                    }
                    else
                    {
                        jsMessage = "alert({msg:\"对不起，您没有 生成HTML 操作权限，请与管理员联系！\",title:\"操作提示\"});";
                    }
                    break;
                default:
                    // 信息提示:参数传递不正确
                    break;
            }

            if (!string.IsNullOrEmpty(ctrManageList.LogContent))
            {
                if (string.IsNullOrEmpty(ctrManageList.LogException)) // 失败
                {
                    WriteLog(ctrManageList.LogContent, ctrManageList.LogException, 3);
                }
                else // 成功
                {
                    WriteLog(ctrManageList.LogContent, string.Empty, 2);
                }
            }

        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            KingTop.Model.Pager split;
            string[] splitParam;
            string tempVar;    // 临时变量

            // 初始加载时的SQL各参数

            splitParam = ctrManageList.GetSQLParam(hdnCustomCol.Value, hdnShowCol.Value);

            ctrManageList.SqlWhere = splitParam[1];                    // 初始时的where

            tempVar = ctrManageList.Search();                         // 搜索栏条件
            //查询条件保存到cookies中
            if (!string.IsNullOrEmpty(tempVar))
            {
                Response.Cookies["search"].Value = Server.UrlEncode(tempVar);
            }
            else if (!string.IsNullOrEmpty(SearchWhere))
            {
                tempVar = SearchWhere;
            }

            if (!string.IsNullOrEmpty(ctrManageList.SqlWhere.Trim()) && !string.IsNullOrEmpty(tempVar))
            {
                ctrManageList.SqlWhere = ctrManageList.SqlWhere + " and " + tempVar;
            }
            else
            {
                ctrManageList.SqlWhere += tempVar;
            }

            tempVar = ctrManageList.LinkSearch();                     // 链接按钮中的搜索条件
            //查询条件保存到cookies中
            if (!string.IsNullOrEmpty(tempVar))
            {
                Response.Cookies["searchlink"].Value = Server.UrlEncode(tempVar);
            }
            else if (!string.IsNullOrEmpty(SearchlinkWhere))
            {
                tempVar = SearchlinkWhere;
            }
            if (!string.IsNullOrEmpty(ctrManageList.SqlWhere.Trim()) && !string.IsNullOrEmpty(tempVar))
            {
                ctrManageList.SqlWhere = ctrManageList.SqlWhere + " and " + tempVar;
            }
            else
            {
                ctrManageList.SqlWhere += tempVar;
            }


            ctrManageList.SqlOrder = splitParam[3];                   // 初始时的order by 
            tempVar = BLL.Content.ControlManageList.GetClientSort();  // 列表标题排序

            if (tempVar.Contains(".Orders"))    // 排序字段排序列
            {
                if (!string.IsNullOrEmpty(ctrManageList.SqlOrder.Trim()) && !string.IsNullOrEmpty(tempVar.Trim()) && tempVar.Contains(".Orders asc"))
                {

                    ctrManageList.SqlOrder = ctrManageList.SqlOrder.Replace(".Orders desc", ".Orders asc");
                }

                if (!string.IsNullOrEmpty(ctrManageList.SqlOrder.Trim()) && !string.IsNullOrEmpty(tempVar.Trim()) && tempVar.Contains(".Orders desc"))
                {

                    ctrManageList.SqlOrder = ctrManageList.SqlOrder.Replace(".Orders asc", ".Orders desc");
                }
            }
            else // 其它字段排序
            {
                if (!string.IsNullOrEmpty(ctrManageList.SqlOrder.Trim()) && !string.IsNullOrEmpty(tempVar.Trim()))
                {

                    ctrManageList.SqlOrder = tempVar + "," + ctrManageList.SqlOrder;
                }
                else
                {
                    ctrManageList.SqlOrder = tempVar + ctrManageList.SqlOrder;
                }
            }


            // 初始加载时选取的字段
            int page = 1;
            if (pageindex > 0)
            {
                page = pageindex;
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                page = Utils.ParseInt(Request.QueryString["page"], 1);
            }
            else if (!string.IsNullOrEmpty(ModelPageNum))
            {
                page = Utils.ParseInt(ModelPageNum, 1);
            }
            ctrManageList.SqlField = splitParam[2];
            // 基本字段中引用外表数据的字段参数
            ctrManageList.SqlFieldForignData = hdnForignTableCol.Value;
            split = new KingTop.Model.Pager();
            split.PageIndex = page;
            split.Aspnetpage = Split;
            split.RptControls = rptListInfo;
            ctrManageList.PageData(split, splitParam[0]);
        }
        #endregion
    }
}