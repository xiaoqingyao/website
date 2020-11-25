using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月18日
    功能描述： 问卷调查选项列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class SurveyItemList : AdminPage
    {
        #region 初始参数

        BLL.Content.SurveyItem bllSurveyItem = new AllPower.BLL.Content.SurveyItem();
        DataTable dtType = null;
        private string strNid;
        /// <summary> 
        /// 问卷调查ID
        /// </summary>
        public string StrNid
        {
            get
            {
                if (strNid == null)
                {
                    strNid = Utils.ReqUrlParameter("nid");
                }
                return strNid;
            }
        }
        #endregion

        #region 页面初始化
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
            dtType = Utils.GetXmlDataSet("../Configuraion/Model/SurveyItemType.xml").Tables[0];
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
            //判断页面权限
            SetRight(this.Page, rptModelFileGroup);
        }
        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            if (StrKeySearch != "")
            {
                dcWhere.Add("Name", StrKeySearch);
                txtGroupName.Text = StrKeySearch;
            }
            dcWhere.Add("SurveyID", StrNid);
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllSurveyItem.PageData(p);
        }

        #endregion
        #endregion

        #region 操作的事件
        protected void btnNew_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("New"))
            {
                Response.Redirect("SurveyItemEdit.aspx?nid=" + StrNid + "&NodeCode=" + NodeCode);
            }
        }

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("Delete"))
            {

                string strMessage = bllSurveyItem.SurveyItemSet("DEL", StrNid, e.CommandArgument.ToString());  //删除数据
                WriteLogExpand(LogTitle, "Del", "SurveyItem", strMessage);  //写日志               
                PageInit();
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("Delete"))
            {
                string strMessage = bllSurveyItem.SurveyItemSet("DEL", StrNid, Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "Del", "SurveyItem", strMessage);
                PageInit();
            }
        }

        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            //判断是否有权限

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
                string strValue = bllSurveyItem.SurveyItemSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

                PageInit();
            }
        }

        //返回问卷管理
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("SurveyList.aspx?NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有权限，请联系站点管理员！',title:'提示信息'})");
            }
        }

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }
        #endregion

        /// <summary>
        /// 获取类型
        /// </summary>
        /// <param Name="Id"></param>
        /// <returns></returns>
        public string GetType(string Id)
        {
            string value = "";
            foreach (DataRow dr in dtType.Rows)
            {
                if (dr["value"].ToString() == Id)
                {
                    value = dr["Name"].ToString();
                }
            }
            return value;
        }

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
                        bllSurveyItem.SurveyItemSet("ORDER", AllPower.Common.Utils.ParseInt(txtOrder.Text.Trim(), 1).ToString(), hidId.Value);  //更改排序
                    }
                }
                PageInit();
            }
        }

        /// <summary>
        /// 按条件搜索
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnKeySerach_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("SurveyItemList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim()) + "&nid=" + StrNid); //页面跳转          
            }
        }
        #endregion
    }
}
