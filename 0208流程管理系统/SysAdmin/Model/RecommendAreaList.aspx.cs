#region 引用程序集
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.BLL.Content;
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月11日
    功能描述： 推荐区域
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Model
{
    public partial class RecommendAreaList : AdminPage
    {
        #region 变量成员
        private string _searchType = null;
        private string _searchValue = null;
        private string _isDel = null;   // 逻辑删除标志
        private Hashtable hsSite;       // 站点名称与站点ID键值对
        private string _specialID;      // 专题ID，用于专题中的推荐区域
        #endregion

        #region 属性
        /// <summary>
        ///专题ID，用于专题中的推荐区域
        /// </summary>
        public string SpecialID
        {
            get 
            {
                if (string.IsNullOrEmpty(this._specialID))
                {
                    this._specialID = Utils.ReqUrlParameter("SpecialID");
                }

                return this._specialID;
            }
        }
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

        // 逻辑删除
        public string IsDel
        {
            get
            {
                if (this._isDel == null)
                {
                    this._isDel = Utils.ReqUrlParameter("IsDel");
                }

                return this._isDel;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {

            PageInit();
        }

        private void PageInit()
        {
            Dictionary<string, string> dicWhere;

            dicWhere = GetSqlWhere();

            SplitDataBind(dicWhere);
        }
        #endregion

        #region 删除单条模板记录
        public void RecommendArea_Del(object sender, CommandEventArgs e)
        {

            string id;
            string tranType;    // 事务类型
            string returnMsg;   // 事务返回信息
            AllPower.BLL.Content.RecommendArea recommendArea;

            // url验证

            if (IsPostBack)
            {
                id = e.CommandArgument.ToString();

                if (e.CommandName == "del")
                {
                    tranType = "DELONE";
                }
                else if (string.Equals(e.CommandName, "deldp"))
                {
                    tranType = "DELDP";
                }
                else if (string.Equals(e.CommandName, "revert"))
                {
                    tranType = "REVERT";
                }
                else
                {
                    tranType = "DELONE";
                }

                returnMsg = "";
                recommendArea = new AllPower.BLL.Content.RecommendArea();

                returnMsg = recommendArea.RecommendAreaSet(tranType,"1", id);

                PageInit();

                // 事务返回信息显示
            }
        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            AllPower.BLL.Content.RecommendArea recommendArea;
            string tranType;
            string returnMsg;
            string[] arrArg;        // arrArg[0]  记录ID  arrArg[1] 记录值
            int isEnable;

            // 操作权限认证

            recommendArea = new AllPower.BLL.Content.RecommendArea();
            arrArg = e.CommandArgument.ToString().Split(new char[] { '|' });
            tranType = e.CommandName;
            isEnable = 0;

            if (arrArg.Length > 1)
            {
                if (arrArg[1] == "False" || arrArg[1] == "0")
                {
                    isEnable = 1;
                }

                returnMsg = recommendArea.RecommendAreaSet(tranType, isEnable.ToString(), arrArg[0]);

                PageInit();
            }

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
            if (IsDel == "")
            {
                dicWhere.Add("IsDel", "0");
            }
            else
            {
                dicWhere.Add("IsDel", IsDel);
            }

            dicWhere.Add("SpecialID", SpecialID);

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

            redirectUrl = new StringBuilder();
            redirectUrl.Append("RecommendAreaList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(txtSearch.Text.Trim());

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.Content.RecommendArea objsource = new AllPower.BLL.Content.RecommendArea();

            p.Aspnetpage = Split;
            p.RptControls = rptRecommendArea;
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

        #region 获取站点名称
        protected object GetSiteName(object siteID)
        {
            if(this.hsSite == null)
            {
                BLL.SysManage.SysWebSite webSite;
                DataTable dtWebSite;
                this.hsSite = new Hashtable();
                webSite = new AllPower.BLL.SysManage.SysWebSite();
                dtWebSite = webSite.GetList("ALL", new AllPower.Model.SelectParams());

                foreach (DataRow dr in dtWebSite.Rows)
                {
                    this.hsSite.Add(dr["SiteID"], dr["SiteName"]);
                }
            }

            return this.hsSite[siteID];
        }
        #endregion
    }
}
