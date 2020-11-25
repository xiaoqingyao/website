using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年5月24日
    功能描述： 问卷调查详细列表
 
// 更新日期：2010-10-15    更新人:何伟    更新原因/内容:问答内容显示
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class SurveyVoteCount : AdminPage
    {
        #region 业务操作类
        BLL.Content.SurveyItem bllSurveyItem = new KingTop.BLL.Content.SurveyItem();
        BLL.Content.Survey bllSurvey = new KingTop.BLL.Content.Survey();

        #endregion

        #region 初始参数
        Dictionary<string, string> dcValue;
        DataTable dtSurveyVote = null;
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

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        //绑定
        void PageInit()
        {
            dtSurveyVote = bllSurvey.GetList("VOTEITEM", Utils.getOneParams(StrNid));
            rptItem.DataSource = bllSurveyItem.GetList("all", Utils.getOneParams(StrNid));
            rptItem.DataBind();
        }

        /// <summary>
        /// 获取具体选项值
        /// </summary>
        /// <param name="strValue">选项的所有集合值,如:好|非常|不好</param> 
        /// <param name="strItemID">选项的ID</param>
        /// <returns>单个的选项值,如:好</returns>
        public Dictionary<string, string> GetValue(string strValue, string strItemID)
        {
            dcValue = new Dictionary<string, string>();
            foreach (string str in Utils.strSplit(strValue, "|"))
            {
                dcValue.Add(str, strItemID);
            }
            return dcValue;
        }

        /// <summary>
        /// 获取投票的选项
        /// </summary>
        /// <param name="strItemID">问答项的ID</param>
        /// <param name="strOptionID">选项值的ID</param>
        /// <returns>投票选项值</returns>
        public string GetVote(string strItemID, string strOptionID)
        {
            string strValue = "";
            foreach (DataRow dr in dtSurveyVote.Rows)
            {
                if (dr["SurveyItemID"].ToString() == strItemID && dr["OptionID"].ToString() == strOptionID)
                {
                    strValue = dr["VoteAmount"].ToString();
                    break;
                }
            }
            return strValue;
        }

        /// <summary>
        /// 获取投票的百分比
        /// </summary>
        /// <param name="num">当前投票数</param>
        /// <returns>百分比</returns>
        public string GetPercent(string strItemID, string strOptionID)
        {
            string strValue = "";       //百分比
            double voteTotal = 0;       //总票数
            double num = 0;             //当前单个项的投票数
            foreach (DataRow dr in dtSurveyVote.Rows)
            {
                if (dr["SurveyItemID"].ToString() == strItemID && dr["OptionID"].ToString() == strOptionID)
                {
                    num = Convert.ToDouble(dr["VoteAmount"]);
                    DataTable dt = bllSurvey.GetList("ITEMTOTAL", Utils.getOneParams(strItemID));
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
                    break;
                }
            }
            return strValue;
        }

        /// <summary>
        /// 前台样式是否显示
        /// </summary>
        /// <param name="voteCount">投票数</param>
        /// <returns>样式</returns>
        public string GetDisplay(string strItemID, string strOptionID)
        {
            double num = 0;             //当前单个项的投票数
            string style = "";          //样式
            foreach (DataRow dr in dtSurveyVote.Rows)
            {
                if (dr["SurveyItemID"].ToString() == strItemID && dr["OptionID"].ToString() == strOptionID)
                {
                    num = Convert.ToDouble(dr["VoteAmount"]);
                    if (num > 0)
                    {
                        style = "display:block";
                    }
                    else
                    {
                        style = "display:none";
                    }
                    break;
                }
            }
            return style;
        }

        /// <summary>
        /// 前台样式是否显示
        /// </summary>
        /// <param name="voteCount">选项的类型</param>
        /// <returns>样式</returns>
        public string[] GetDisplay(int type)
        {
            string[] style = new string[3];       //样式
            switch (type)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                    style[0] = "display:block";
                    style[1] = "display:none";
                    style[2] = "false";
                    break;
                case 2:
                case 4:
                case 6:
                case 9:
                    style[0] = "display:none";
                    style[1] = "display:block";
                    style[2] = "true";
                    break;
            }
            return style;
        }
        #endregion
    }
}
