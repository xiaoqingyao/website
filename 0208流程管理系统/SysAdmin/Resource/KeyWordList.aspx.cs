#region 引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;

using AllPower.Common;
using AllPower.Model;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年3月10日
    功能描述： 关键字列表显示与删除
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class KeyWordList : AdminPage
    {
        #region 变量成员
        private string _searchType = null;            // 搜索的字段名
        private string _searchValue = null;           // 搜索值
        protected string jsMessage = string.Empty;    // 提示信息
        #endregion

        #region 属性
        // 搜索类型
        public string SearchType
        {
            get
            {
                if (this._searchType == null)
                {
                    this._searchType = Utils.ReqUrlParameter("SearchType");
                }

                return this._searchType;
            }
        }

        // 搜索值
        public string SearchValue
        {
            get
            {
                if (this._searchValue == null)
                {
                    this._searchValue = Utils.ReqUrlParameter("SearchValue");
                }

                return this._searchValue;
            }
        }
        #endregion

        #region  Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            PageInit();
            SetRight(this.Page, rptKeyWord);
        }

        private void PageInit()
        {
            Dictionary<string, string> dicWhere;

            dicWhere = GetSqlWhere();
            SplitDataBind(dicWhere);
        }
        #endregion

        #region 记录删除
        // 记录删除
        protected void Keyword_Delete(object sender, CommandEventArgs e)
        {
            string id;
            string tranType;    // 事务类型
            string returnMsg;   // 事务返回信息
            AllPower.BLL.Resource.Keyword keyword;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Delete");

            if (isValidate)
            {
                if (string.Equals(e.CommandName, "Bacth"))
                {
                    id = "'" + Request.Form["chkID"].Replace(",", "','") + "'";
                    tranType = "DEL";
                }
                else
                {
                    id = e.CommandArgument.ToString();
                    tranType = "DELONE";
                }
                keyword = new AllPower.BLL.Resource.Keyword();

                returnMsg = keyword.KeywordSet(tranType, null, id);

                if (returnMsg == "1")
                {
                    WriteLog("删除关键字 " + LogTitle + " 成功", string.Empty, 2);
                }
                else
                {
                    WriteLog("删除关键字 " + LogTitle + " 失败", returnMsg, 3);
                }

                PageInit();
            }
            else
            {
                jsMessage = "alertClose({msg:\"对不起，您没有 删除 操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.Resource.Keyword objsource = new AllPower.BLL.Resource.Keyword();

            p.Aspnetpage = Split;
            p.RptControls = rptKeyWord;
            p.DicWhere = dicWhere;
            objsource.PageData(p);
        }
        #endregion

        #region 搜索
        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();

            if (SearchType != "" && SearchValue != "")
            {
                dicWhere.Add(SearchType, SearchValue);
            }

            return dicWhere;
        }
        /// <summary>
        /// 按条件搜索        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder redirectUrl;

            redirectUrl = new StringBuilder();
            redirectUrl.Append("KeyWordList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(Utils.cutBadStr(txtSearch.Text.Trim()));
            redirectUrl.Append("&NodeCode=" + NodeCode);

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion
    }
}
