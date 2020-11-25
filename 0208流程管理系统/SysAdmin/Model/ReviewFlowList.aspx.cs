using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AllPower;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月26日
    功能描述： 审核流程管理列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class ReviewFlowList : AdminPage
    {
        BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();

        #region 初始参数
        private string strModelId;       
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
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY,Session.SessionID,Utils.GetUrlParams().Replace("&", "|"),SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中  
            //判断页面权限
            SetRight(this.Page, rptModelFileGroup);           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("ReviewFlowEdit.aspx?NodeCode=" + NodeCode);
            }
        }       

        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
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
                string strValue = bllReviewFlow.ReviewFlowSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
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
            AllPower.Model.Pager p = new  AllPower.Model.Pager();
            p.DicWhere = dcWhere;
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            bllReviewFlow.PageData(p);
        }

        #endregion

      
        protected void btnOrders_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Order"))
            {
                TextBox txtOrder = null;
                HiddenField hidId = null;
                string strId = Utils.ReqFromParameter("chkID"); ;
                for (int i = 0; i < rptModelFileGroup.Items.Count; i++)  //循环得到rpt当前行的id和排序进行更改
                {
                    hidId = rptModelFileGroup.Items[i].FindControl("hidIds") as HiddenField;
                    if (strId.IndexOf(hidId.Value) != -1)  //如果当前已经勾选,则排序
                    {
                        txtOrder = rptModelFileGroup.Items[i].FindControl("txtOrders") as TextBox;
                        bllReviewFlow.ReviewFlowSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
                    }
                }
                PageInit();
            }
        }

       
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
               string strMessage= bllReviewFlow.ReviewFlowSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LoginDel", "ReviewFlow", strMessage);  //写日志    
                PageInit();
            }
        }

        protected void rptModelFileGroup_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (((HiddenField)e.Item.FindControl("hdnID")).Value.Trim() == "000000000000000")
            {
                ((LinkButton)((Panel)e.Item.FindControl("palBtn")).FindControl("lnkbDelete")).Enabled = false;
                ((LinkButton)((Panel)e.Item.FindControl("palBtn")).FindControl("lbtnState")).Enabled = false;
                ((Panel)e.Item.FindControl("palBtn")).Attributes.Add("onclick", "hrefDisable(this);return false;");
                ((Panel)e.Item.FindControl("palBtn")).Attributes.Add("onmouseover", "hrefDisable(this)");

                ((Panel)e.Item.FindControl("palBtn")).Enabled = false;

            }
        }

        
    }
}
