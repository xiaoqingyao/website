using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using AllPower.Common;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      毛文勇
    创建时间： 2010年11月12日
    功能描述： 会员积分
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.MemberManage
{
    public partial class MemberScoreList : AdminPage
    {
        private AllPower.BLL.MemberManage.MemberScore objMemberScore = new AllPower.BLL.MemberManage.MemberScore();
        private OptionsDictionary odScore = new OptionsDictionary("scoresource");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 页面加载
        /// </summary>
        private void PageInit()
        {
            BindScoreSource();
            PageData();
        }

        /// <summary>
        /// 绑定积分类型
        /// </summary>
        private void BindScoreSource()
        { 
            ListItem item = null;
            foreach (KeyValuePair<int, string> kvp in odScore.getDictionary)
            {
                item = new ListItem(kvp.Value, kvp.Key.ToString());
                ddlSource.Items.Add(item);
            }

            item = new ListItem("积分来源","");
            ddlSource.Items.Insert(0, item);
        }

        /// <summary>
        /// 绑定数据
        /// </summary>
        private void PageData()
        { 
            Dictionary<string,string> dicWhere = new Dictionary<string,string>();
            dicWhere = GetWhere();
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = Split;
            p.RptControls = rptScoreList;
            p.DicWhere = dicWhere;
            objMemberScore.PageData(p);
        }

        /// <summary>
        /// 设置参数
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> GetWhere()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();

            if (!string.IsNullOrEmpty(StrKeySearch))
            {
                dicWhere.Add("UserName", StrKeySearch);
                txtSearch.Text = StrKeySearch;
            }

            string strSource = Utils.UrlDecode(Utils.ReqUrlParameter("selType"));
            if (!string.IsNullOrEmpty(strSource))
            {
                dicWhere.Add("Source", strSource);
                ddlSource.SelectedValue = strSource;
            }

            string strStartDate = Utils.UrlDecode(Utils.ReqUrlParameter("date1"));
            if (!string.IsNullOrEmpty(strStartDate))
            {
                dicWhere.Add("StartDate", strStartDate);
                txtDate1.Text = strStartDate;
            }

            string strEndDate = Utils.UrlDecode(Utils.ReqUrlParameter("date2"));
            if (!string.IsNullOrEmpty(strEndDate))
            {
                dicWhere.Add("EndDate", strEndDate);
                txtDate2.Text = strEndDate;
            }

            dicWhere.Add("SiteID", Utils.UrlDecode(SiteID.ToString()));
            return dicWhere;
        }

        protected string GetSource(string strSourceID)
        {
            return odScore.getDictionaryValue(Utils.ParseInt(strSourceID,1));
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("MemberScoreList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim()) + "&selType=" + ddlSource.SelectedValue + "&date1=" + txtDate1.Text.Trim() + "&date2=" + txtDate2.Text.Trim() + "");
            }
        }
    }
}
