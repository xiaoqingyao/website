using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Common;
using AllPower.Web.Admin;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月12日
    功能描述： 前台投票结果统计
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion
namespace AllPower.WEB.main.Plus.Common
{
    public partial class VoteResult : System.Web.UI.Page
    {
        #region 初始参数
        BLL.Content.VoteItems bllVoteItems = new AllPower.BLL.Content.VoteItems();
        protected double voteTotal = 0;            //总投票数量
        private string strVoteId;
        /// <summary>
        /// 投票ID
        /// </summary>
        public string StrVoteId
        {
            get
            {
                if (strVoteId == null)
                {
                    strVoteId = Utils.UrlDecode(Utils.ReqUrlParameter("vid"));
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
            PageData();//绑定列表       
        }

        /// <summary>
        /// 获取投票的百分比
        /// </summary>
        /// <param name="num">当前投票数</param>
        /// <returns>百分比</returns>
        public string GetPercent(double num)
        {
            string strValue = "";
            DataTable dt = bllVoteItems.GetList("VOTETOTAL", Utils.getOneParams(StrVoteId));
            if (dt.Rows.Count > 0)
            {
                voteTotal = Convert.ToDouble(dt.Rows[0]["TOTAL"]);          //总票数
                if (num > 0)
                {
                    strValue = ((num / voteTotal) * 100).ToString("0.00");
                }
                else
                {
                    strValue = "0.00";
                }
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

        //列表信息绑定
        private void PageData()
        {
            DataTable dtVote = bllVoteItems.GetList("ALL", Utils.getOneParams(StrVoteId));
            if (dtVote.Rows.Count > 0)
            {
                rptVoteRes.DataSource = dtVote;
                rptVoteRes.DataBind();
            }
            dtVote.Dispose();
        }
        #endregion
    }
}
