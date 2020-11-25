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
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月21日
    功能描述： 评论列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class CommentList : AdminPage
    {
        #region 初始参数

        BLL.Content.Comment bllComment = new AllPower.BLL.Content.Comment();
        private string typeId;

        /// <summary>
        /// 评论类型(是否审核)
        /// </summary>
        public string TypeId
        {
            get
            {
                if (typeId == null)
                {
                    typeId = Utils.ReqUrlParameter("typeId");
                }
                return typeId;
            }
        }
        #endregion

        #region 页面初始化

        //加载
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
        #endregion

        #region 操作的事件

        //设置状态
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
                string strValue = bllComment.CommentSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态

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
            //判断是否有权限

            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("CommentList.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtGroupName.Text.Trim())); //页面跳转   
            }
        }

        //逻辑删除
        protected void btnLogicDel_Click(object sender, EventArgs e)
        {
            //判断是否有权限

            if (IsHaveRightByOperCode("LogicDelete"))
            {
                bllComment.CommentSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                PageInit();
            }
        }
        #endregion

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
            dcWhere.Add("SiteID", SiteID.ToString());
            if (StrKeySearch != "")
            {
                dcWhere.Add("Content", Utils.UrlDecode(Utils.cutBadStr(StrKeySearch)));
                txtGroupName.Text = StrKeySearch;
            }
            if (TypeId == "")
            {
                dcWhere.Add("typeid", "1");
            }
            else
            {
                dcWhere.Add("typeid", TypeId);
            }
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptModelFileGroup;
            p.DicWhere = dcWhere;
            bllComment.PageData(p);
        }

        #endregion
    }
}
