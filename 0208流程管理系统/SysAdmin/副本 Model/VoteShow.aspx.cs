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
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月7日
    功能描述： 查看投票
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class VoteShow : AdminPage
    {
        #region 初始参数
        BLL.Content.VoteItems bllVoteItems = new KingTop.BLL.Content.VoteItems();
        protected double voteTotal = 0;            //总投票数量
        private string strVoteId;
        private double total = -1;
        /// <summary>
        /// 投票ID
        /// </summary>
        public string StrVoteId
        {
            get
            {
                if (strVoteId == null)
                {
                    strVoteId = Utils.UrlDecode(Utils.ReqUrlParameter("nid"));
                }
                return strVoteId;
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
            PageData();//分页绑定列表       
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中            
        }

        /// <summary>
        /// 获取投票的百分比
        /// </summary>
        /// <param name="num">当前投票数</param>
        /// <returns>百分比</returns>
        public string GetPercent(double num)
        {
            string strValue = "";
            if (total == -1)
            {
                DataTable dt = bllVoteItems.GetList("VOTETOTAL", Utils.getOneParams(strVoteId));
                if (dt.Rows.Count > 0)
                {
                    total = Convert.ToDouble(Utils.ParseInt(dt.Rows[0]["TOTAL"], 0).ToString());          //总票数
                }
            }

            if (num > 0 && total > 0)
            {
                strValue = ((num / total) * 100).ToString("0.00");
            }
            else
            {
                strValue = "0.00";
            }

            return strValue;
        }

        /// <summary>
        /// 前台样式是否显示
        /// </summary>
        /// <param name="voteCount">投票数</param>
        /// <returns>样式</returns>
        public string GetDisplay(int voteCount)
        {
            if (voteCount > 0)
            {
                return "display:block";
            }
            else
            {
                return "display:none";
            }
        }

        #region 实现列表信息绑定
        private void PageData()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("isdel", "0");
            dcWhere.Add("voteid", StrVoteId);
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllVoteItems.PageData(p);
        }

        #endregion

        #endregion

        #region 返回/分页
        //分页事件
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageData();
        }

        //返回投票管理
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("VoteList.aspx?NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
        #endregion
    }
}
