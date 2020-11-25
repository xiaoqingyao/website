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
using AllPower.Model;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
        作者： 何伟
    创建时间： 2010年10月12日
    功能描述： 问卷问答详情列表
 
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Model
{
    public partial class SurveyAllAnswer : AdminPage
    {
        #region 初始参数
        BLL.Content.SurveyItem bllSurveyItem = new AllPower.BLL.Content.SurveyItem();

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

        private string strQid;
        /// <summary>
        /// 问题的ID
        /// </summary>
        public string StrQid
        {
            get
            {
                if (strQid == null)
                {
                    strQid = Utils.ReqUrlParameter("qid");
                }
                return strQid;
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
            //设置查询条件
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();

            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptAllAnswer;
            p.DicWhere = dcWhere;

            bllSurveyItem.PageData(p, StrNid, StrQid);

            //把当前url全部参数存入cookie中 
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
            //判断页面权限
            SetRight(this.Page, rptAllAnswer);
        }
        #endregion

        #region 操作的事件
        //返回问卷管理
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Back"))
            {
                Response.Redirect("SurveyVoteCount.aspx?NodeCode=" + NodeCode + "&nid=" + StrNid);
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
