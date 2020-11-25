using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月30日
    功能描述： 审核流程实际操作列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ReviewFlowNewsList :AdminPage
    {
        BLL.Content.ReviewFlow bllReviewFlow = new KingTop.BLL.Content.ReviewFlow();
        #region 初始参数
        private string strKeySearch, strflowStepId, strModelId, flowStateId;

        public string FlowStateId
        {
            get
            {
                if (flowStateId == null)
                {
                    flowStateId = Utils.UrlDecode(Utils.ReqUrlParameter("flowStateId"));
                }
                return flowStateId;
            }
        }

        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.UrlDecode(Utils.ReqUrlParameter("ModelID"));
                }
                return strModelId;
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
        /// 操作步骤
        /// </summary>
        public string StrflowStepId
        {
            get
            {
                if (strflowStepId == null)
                {
                    strflowStepId = Utils.ReqUrlParameter("flowStepId");
                }
                return strflowStepId;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 初始化绑定
        /// </summary>
        void PageInit()
        {
            string strFlowId = "000000000540453"; //审核流程ID  实际要根据栏目ID从栏目表中读取此ID
            string strStateValue = "";  //当前选中状态值
            BLL.Content.FlowStep bllFlowStep = new KingTop.BLL.Content.FlowStep();
            DataTable dtFlowStep =  bllFlowStep.GetList("ALL", Utils.getOneParams(strFlowId));
            rptFlowStep.DataSource = dtFlowStep;
            rptFlowStep.DataBind();
            dtFlowStep.Dispose();
            BLL.Content.ReviewFlowState bllReviewFlowState = new KingTop.BLL.Content.ReviewFlowState();
            DataSet dsFlowStep= bllReviewFlowState.GetListSet("NEWSLIST", Utils.getTwoParams(StrflowStepId,strFlowId));
            ControlUtils.RadioButtonListDataBind(rbtlFlowState, dsFlowStep.Tables[0], "NAME", "ID",false);
            rbtlFlowState.Attributes.Add("onclick", string.Format("utils.ReviewFlowNewsListClick('{0}','{1}')", StrModelId, StrflowStepId));
            if (FlowStateId != "")
            {
                rbtlFlowState.SelectedValue = FlowStateId;
                foreach(DataRow dr in dsFlowStep.Tables[0].Rows)
                {
                    if(dr["ID"].ToString()==FlowStateId)  //得到当前选中的状态值
                    {
                        strStateValue = dr["StateValue"].ToString();
                        break;
                    }
                }
            }
            Dictionary<string,string> dicWhere = new Dictionary<string,string>();
            dicWhere.Add("isdel","0");           
            Model.Pager page = new KingTop.Model.Pager();
            page.Aspnetpage = Split;
            page.RptControls = rptListInfo;
            page.DicWhere = dicWhere;
            bllReviewFlow.PageData(page, StrModelId, strStateValue, dsFlowStep.Tables[1].Rows[0][0].ToString());  //分页绑定
            dsFlowStep.Dispose();
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            //SplitDataBind((string)ViewState[VIEWSTATE_KEY]);
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            FlowStateUpdateNext(true);           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FlowStateUpdateNext(false);  
        }

        void FlowStateUpdateNext(bool isScuess)
        {
            Model.Content.ReviewFlowLog modelReviewFlowLog = new KingTop.Model.Content.ReviewFlowLog();
            string[] strTableOrId = GetTableID("0", "K_ReviewFlowLog");
            modelReviewFlowLog.ID = strTableOrId[0];
            modelReviewFlowLog.Orders = Utils.ParseInt(strTableOrId[1], 50);
            modelReviewFlowLog.IP = Utils.GetIP();
            modelReviewFlowLog.NodeId = NodeID;
            modelReviewFlowLog.ModeId = StrModelId;
            modelReviewFlowLog.Notation = "";
            modelReviewFlowLog.SiteId =SiteID.ToString();
            modelReviewFlowLog.AddMan = UserNo;
            foreach (string str in Utils.strSplit(Utils.ReqFromParameter("cbId"), ","))
            {
                modelReviewFlowLog.NewsId = str;
                bllReviewFlow.FlowStateUpdate(StrModelId, FlowStateId, str, isScuess, modelReviewFlowLog);
            }
            PageInit();
        }
    }
}
