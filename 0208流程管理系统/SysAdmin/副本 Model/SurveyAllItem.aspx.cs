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
    作者:      何伟
    创建时间： 2010年10月13日
    功能描述： 问卷调查投票问题选项列表
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion
namespace KingTop.WEB.SysAdmin.Model
{
    public partial class SurveyAllItem : AdminPage
    {
        #region 初始参数
        BLL.Content.SurveyItem bllSurveyItem = new KingTop.BLL.Content.SurveyItem();
        BLL.Content.Survey bllSurvey = new KingTop.BLL.Content.Survey();

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
                    strNid = Utils.ReqUrlParameter("sid");
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
            //设置查询条件
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            dcWhere.Add("SurveyID", StrNid);

            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptItem;
            p.DicWhere = dcWhere;

            bllSurveyItem.PageData(p);

            //把当前url全部参数存入cookie中 
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
            //判断页面权限
            SetRight(this.Page, rptItem);
        }
        #endregion

        #region 事件
        //返回投票详情列表
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("SurveyVoteList.aspx?NodeCode=" + NodeCode + "&nid=" + StrNid);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有权限，请联系站点管理员！',title:'提示信息'})");
            }
        }


        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageInit();
        }
        #endregion
        #endregion
    }
}
