using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using System.Data;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月1日
    功能描述： 单条新闻审核
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class ReviewFlowNews :AdminPage
    {
        BLL.Content.ReviewFlowLog bllReviewFlowLog = new AllPower.BLL.Content.ReviewFlowLog();
        BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
        /// <summary>
        /// 分页页面参数
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string strPageParams = AllPower.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, Session.SessionID).Replace("|", "&");
                if (strPageParams.Length > 0)
                {
                    return "?" + strPageParams;
                }
                else
                {
                    return "";
                }
            }
        }
        #region 初始参数


        private string strKeySearch, strModelId, strNewsId, flowStateId;
        /// <summary> 
        /// 操作步骤
        /// </summary>
        public string FlowStateId
        {
            get
            {
                if (flowStateId == null)
                {
                    flowStateId = Utils.ReqUrlParameter("flowStateId");
                }
                return flowStateId;
            }
        }
        /// <summary>
        /// 新闻ID
        /// </summary>
        public string StrNewsId
        {
            get
            {
                if (strNewsId == null)
                {
                    strNewsId = Utils.UrlDecode(Utils.ReqUrlParameter("NewsId"));
                }
                return strNewsId;
            }
        }
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrKeySearch
        {
            get
            {
                if (strKeySearch == null)
                {
                    strKeySearch = Utils.UrlDecode(Utils.ReqUrlParameter("keySearch"));
                }
                return strKeySearch;
            }
        }
        /// <summary> 
        /// 下拉选中模型ID
        /// </summary>
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("ModelId");
                }
                return strModelId;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
            }
        }


        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        void PageInit()
        {
            PageData();//分页绑定列表  
            if (FlowStateId == null || FlowStateId == "")
            {
                flowStateId = bllReviewFlow.GetFlowStateId(StrModelId, StrNewsId);
            }
            DataTable dtFlowState = bllReviewFlow.GetdtFlowState(FlowStateId);
            btnSave.Text = dtFlowState.Rows[0]["SuccessName"].ToString();
            btnFail.Text = dtFlowState.Rows[0]["FailName"].ToString();
            dtFlowState.Dispose();
            //新闻绑定
            //lblAddtime.Text = 
            //Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("isdel", "0");
            dcWhere.Add("NewsId", StrNewsId);
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllReviewFlowLog.PageData(p);
        }

        #endregion

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            FlowStateUpdateNext(true);
        }

        protected void btnFail_Click(object sender, EventArgs e)
        {
            FlowStateUpdateNext(false);
        }

        void FlowStateUpdateNext(bool isScuess)
        {
            BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
            Model.Content.ReviewFlowLog modelReviewFlowLog = new AllPower.Model.Content.ReviewFlowLog();
            string[] strTableOrId = GetTableID("0", "K_ReviewFlowLog");
            modelReviewFlowLog.ID = strTableOrId[0];
            modelReviewFlowLog.Orders = Utils.ParseInt(strTableOrId[1], 50);
            modelReviewFlowLog.IP = Utils.GetIP();
            modelReviewFlowLog.NodeId = NodeID;
            modelReviewFlowLog.ModeId = StrModelId;           
            modelReviewFlowLog.SiteId = SiteID.ToString();
            modelReviewFlowLog.AddMan = UserNo;
            modelReviewFlowLog.NewsId = StrNewsId;
            modelReviewFlowLog.Notation = txtDescribe.Text.Trim();
            string strMessage = bllReviewFlow.FlowStateUpdate(StrModelId, FlowStateId, StrNewsId, isScuess, modelReviewFlowLog);
            if (strMessage == "1") //操作成功
            {
                Utils.UrlRedirect(this, "ReviewFlowNewsList.aspx" + StrPageParams, Utils.GetResourcesValue("model", "AddSucess"));
            }
            else
            {
                Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
            }
            PageInit();
        }

    }
}
