using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop;
using KingTop.Common;
using KingTop.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月29日
    功能描述： 审核流程状态管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class ReviewFlowStateList : AdminPage
    {
        BLL.Content.ReviewFlowState bllReviewFlowState = new KingTop.BLL.Content.ReviewFlowState();

        #region 初始参数

        private string  strModelId;
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
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中  
            //判断页面权限
            SetRight(this.Page, rptModelFileGroup);           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
             //判断是否有权限
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("ReviewFlowStateEdit.aspx?NodeCode=" + NodeCode);
            }
        }

        
        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
             //判断是否有权限
            if (IsHaveRightByOperCode("State"))
            {
                string[] strMessage = KingTop.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态
                #region 是否启用状态标识更改
                int iEnable = KingTop.Common.Utils.BoolToInt(strMessage[1]);
                if (iEnable == 1)
                {
                    iEnable = 0;
                }
                else
                {
                    iEnable = 1;
                }
                #endregion
                // string strValue = bllReviewFlow.ReviewFlowSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
                PageInit();
            }
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
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllReviewFlowState.PageData(p);
        }

        #endregion


        protected void btnOrders_Click(object sender, EventArgs e)
        {
             //判断是否有权限
            if (IsHaveRightByOperCode("Order"))
            {
                TextBox txtOrder = null;
                HiddenField hidId = null;
                for (int i = 0; i < rptModelFileGroup.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
                {
                    txtOrder = rptModelFileGroup.Items[i].FindControl("txtOrders") as TextBox;
                    hidId = rptModelFileGroup.Items[i].FindControl("hidIds") as HiddenField;
                    // bllReviewFlowState.ReviewFlowSet("ORDER", KingTop.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
                }
                PageInit();
            }
        }
       

        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
             //判断是否有权限
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllReviewFlowState.ReviewFlowStateSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "ReviewFlowState", strMessage);  //写日志  
                PageInit();
            }
        }
    }
}
