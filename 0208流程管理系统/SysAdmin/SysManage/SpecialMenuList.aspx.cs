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
using System.Xml;
using System.Xml.XPath;

using AllPower.Web.Admin;
using AllPower.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年4月21日
    功能描述： 专题栏目列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SpecialMenuList : AdminPage
    {

        #region 变量成员
        private string _searchType = null;
        private string _searchValue = null;
        private string _isDel = null;                 // 逻辑删除标志
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
            SetRight(this.Page, rptSpecialMenu);
        }
        #endregion

        #region 数据绑定
        private void PageInit()
        {
            Dictionary<string, string> dicWhere;

            dicWhere = GetSqlWhere();

            if (IsDel == "")
            {
                dicWhere.Add("IsDel", "0");
            }
            else
            {
                dicWhere.Add("IsDel", IsDel);
            }

            SplitDataBind(dicWhere);
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
            if (!string.IsNullOrEmpty(this.ID))
            {
                dicWhere.Add(" SpecialID ", this.ID);
            }

            return dicWhere;
        }
        /// <summary>
        /// 按条件搜索        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder redirectUrl;

            redirectUrl = new StringBuilder();
            redirectUrl.Append("SpecialMenuList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(Utils.cutBadStr(txtSearch.Text.Trim()));
            redirectUrl.Append("&ID=" + this.ID);

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.SysManage.SpecialMenu objsource = new AllPower.BLL.SysManage.SpecialMenu();

            p.Aspnetpage = Split;
            p.RptControls = rptSpecialMenu;
            p.DicWhere = dicWhere;
            objsource.PageData(p);
        }
        #endregion

        #region 删除
        protected void SpecialMenu_Del(object sender, CommandEventArgs e)
        {
            string id;
            string tranType;    // 事务类型
            string returnMsg;   // 事务返回信息
            AllPower.BLL.SysManage.SpecialMenu special;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Delete");

            if (isValidate)
            {
                special = new AllPower.BLL.SysManage.SpecialMenu();
                id = e.CommandArgument.ToString();
                tranType = e.CommandName;
                returnMsg = "";
                returnMsg = special.SpecialMenuSet(tranType, null, id);

                if (returnMsg == "1")
                {
                    WriteLog("删除专题栏目 " + LogTitle + " 至回收站成功", string.Empty, 2);
                }
                else
                {
                    WriteLog("删除专题栏目 " + LogTitle + " 至回收站失败", returnMsg, 3);
                }

                PageInit();
            }
        }
        #endregion
    }
}
