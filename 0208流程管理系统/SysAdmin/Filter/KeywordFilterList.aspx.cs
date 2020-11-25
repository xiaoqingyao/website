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
    作者:      严辉
    创建时间： 2010年5月12日
    功能描述： 友情链接分类列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class KeywordFilterList : AdminPage
    {

        BLL.Filter.KeywordFilter bllKeywordFilter = new AllPower.BLL.Filter.KeywordFilter();
        Dictionary<string, string> dicWhere = null;
        private readonly string noHaveRight = Utils.GetResourcesValue("KeywordFilter", "doNotHaveRight");
        string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");

        #region Url 查询参数
        private string _replaceStr;
        private string _isDisable;

        /// <summary>
        /// 查询字段
        /// </summary>
        public string ReplaceStr
        {
            get
            {
                if (_replaceStr == null)
                {
                    _replaceStr = Utils.UrlDecode(Utils.ReqUrlParameter("replaceStr"));
                }
                return _replaceStr;
            }
        }

        /// <summary>
        /// 查询字段
        /// </summary>
        public string IsDisable
        {
            get
            {
                if (_isDisable == null)
                {
                    _isDisable = Utils.UrlDecode(Utils.ReqUrlParameter("isDisable"));
                }
                return _isDisable;
            }
        }
        #endregion

        #region 页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
                SetRight(this, rptKeyword);
            }
        }

        private void PageInit()
        {
           //把当前url全部参数存入cookie中            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);

            //分页绑定列表 
            PageData();
        }
        #endregion

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("KeywordFilterList.aspx?NodeCode=" + NodeCode
                                                 + "&keySearch=" + Utils.UrlEncode(txtKeyword.Text.Trim())
                                                 + "&replaceStr=" + Utils.UrlEncode(txtReplace.Text.Trim())
                                                 + "&isDisable=" + Utils.UrlEncode(Utils.BoolToIntString(chkDisable.Checked))); //页面跳转 
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'" + noHaveRight + "',title:'" + alterTitle + "'})");
            }          
        }
        

        #region 添加
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Utils.UrlRedirect("KeywordFilterEdit.aspx?action=NEW&NodeCode=" + NodeCode);
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'" + noHaveRight + "',title:'" + alterTitle + "'})");
            }
        }
        #endregion

        #region 删除


        //单条记录禁用按钮事件
        protected void lbtnDisable_Click(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
                bllKeywordFilter.KeywordFilterSet("enable", "", e.CommandArgument.ToString());
                PageInit();
            }
            else
            {
                Utils.AlertMessage(this, noHaveRight);
            }
        }

        

        //批量删除
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("LogicDelete"))
            {
                string strMessage = bllKeywordFilter.KeywordFilterSet("LOGICDEL", "", Utils.ReqFromParameter("chkID"));  //删除数据
                WriteLogExpand(LogTitle, "LogicDel", "KeywordFilter", strMessage);  //写日志    
                PageInit();
            }
        }

        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            if (dicWhere != null)
            {
                dicWhere.Clear();
            }
            else
            {
                dicWhere = new Dictionary<string, string>();
            }

            dicWhere.Add("siteID", SiteID.ToString());
            if (IsDisable=="1")
            {    
                dicWhere.Add("IsDisable", "1");
                chkDisable.Checked = true;
            }
            if (!string.IsNullOrEmpty(StrKeySearch))
            {
                dicWhere.Add("Keyword", StrKeySearch);
                txtKeyword.Text = StrKeySearch;
            }
            if (!string.IsNullOrEmpty(ReplaceStr))
            {
                dicWhere.Add("ReplaceStr", ReplaceStr);
                txtReplace.Text = ReplaceStr;
            }
            dicWhere.Add("isdel","0");
            
            return dicWhere;
        }
        
       
        //获取复选框列表值
        private string GetAllChkId()
        {
            if (!string.IsNullOrEmpty(Request.Form["chkId"]))
            {
                return Request.Form["chkId"].Replace(" ", "");
            }
            else
            {
                return "";
            }
        } 
       #endregion
       

        #region 分页
        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            PageInit();
        }

        private void PageData()
        {            
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            p.DicWhere = GetSqlWhere();
            p.Aspnetpage = AspNetPager1;
            p.RptControls = rptKeyword;
            bllKeywordFilter.PageData(p);

        }
        #endregion

     
    }
}
