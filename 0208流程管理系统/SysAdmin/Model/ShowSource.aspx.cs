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
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年5月25日
    功能描述： 资源列表显示
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class ShowSource : AdminPage
    {
        #region  变量成员
        private string _searchType = null;
        private string _searchValue = null;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            SplitDataBind(GetSqlWhere());
        }
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

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.Resource.Source objsource = new AllPower.BLL.Resource.Source();

            p.Aspnetpage = Split;
            p.RptControls = rptAuthor;
            p.DicWhere = dicWhere;
            objsource.PageData(p);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();

            dicWhere = GetSqlWhere();


            SplitDataBind(dicWhere);
        }
        #endregion

        #region 搜索
        private Dictionary<string, string> GetSqlWhere()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();

            dicWhere.Add("IsEnable", "1");
            if (SearchType != "" && SearchValue != "")
            {
                dicWhere.Add(SearchType, SearchValue);
            }

            return dicWhere;
        }
        /// <summary>
        /// 按条件搜索
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder redirectUrl;
            string urlParam;

            redirectUrl = new StringBuilder();
            redirectUrl.Append("ShowSource.aspx?");

            if (!string.IsNullOrEmpty(ddlSearchType.SelectedValue) && !string.IsNullOrEmpty(txtSearch.Text))
            {
                redirectUrl.Append("SearchType=");
                redirectUrl.Append(ddlSearchType.SelectedValue);
                redirectUrl.Append("&SearchValue=");
                redirectUrl.Append(txtSearch.Text);
            }

            foreach (string key in Request.QueryString.Keys)
            {
                urlParam = "&" + key + "=" + Request.QueryString[key];

                if (!redirectUrl.ToString().Contains(urlParam))
                {
                    redirectUrl.Append(urlParam);
                }
            }

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

    }
}
