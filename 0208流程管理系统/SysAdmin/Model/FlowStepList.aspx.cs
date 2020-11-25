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
    作者:      周武
    创建时间： 2010年3月29日
    功能描述： 审核流程步骤管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class FlowStepList : AdminPage
    {
        BLL.Content.FlowStep bllFlowStep = new AllPower.BLL.Content.FlowStep();

        #region 初始参数


        private string strFlowId;

        /// <summary> 
        /// 下拉选中模型ID
        /// </summary>
        public string StrFlowId
        {
            get
            {
                if (strFlowId == null)
                {
                    strFlowId = Utils.ReqUrlParameter("flowid");
                }
                return strFlowId;
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
                Response.Redirect("FlowStepEdit.aspx?flowId=" + StrFlowId + "&NodeCode=" + NodeCode);
            }
        }


        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            //string[] strMessage = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态

            //#region 是否启用状态标识更改

            //int iEnable = AllPower.Common.Utils.BoolToInt(strMessage[1]);
            //if (iEnable == 1)
            //{
            //    iEnable = 0;
            //}
            //else
            //{
            //    iEnable = 1;
            //}
            //#endregion
            //string strValue = bllReviewFlow.ReviewFlowSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

            //PageInit();
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
            dcWhere.Add("ReviewFlowId", StrFlowId);
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllFlowStep.PageData(p);  //执行绑定
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
                    //  bllReviewFlow.ReviewFlowSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
                }
                PageInit();
            }
        }

        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllFlowStep.FlowStepSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "FlowStep", strMessage);  //写日志    
                PageInit();
            }
        }

        //返回流程管理
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("ReviewFlowList.aspx?NodeCode=" + NodeCode);
            }
            else {
                Utils.RunJavaScript(this, "alert({msg:'你没有权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
