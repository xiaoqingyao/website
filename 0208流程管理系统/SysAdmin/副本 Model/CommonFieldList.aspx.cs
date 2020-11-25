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
using KingTop.Common;
using KingTop.BLL.Content;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月30日    功能描述： 公用字段列表
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class CommonFieldList : AdminPage
    {
        #region 变量成员
        private string _isDel = "0";          // 逻辑删除
        private string _searchType = null;             // 搜索字段
        private string _searchValue = null;            // 搜索值
        private string _sort;                          // 排序
        protected string jsMessage;                    // 操作返回的JS代码
        protected string urlParam;                     // 要传递的URL参数
        protected BLL.Content.CommonField commonField; // 业务操作对象
        #endregion

        #region 属性
        /// <summary>
        /// 自定义排序
        /// </summary>
        public string Sort
        {
            get
            {
                if (string.IsNullOrEmpty(this._sort))
                {
                    this._sort = Request.QueryString["Sort"];
                }

                return this._sort;
            }
        }

        /// <summary>
        /// 当前分页索引
        /// </summary>
        public int PageIndex
        {
            get { return Split.CurrentPageIndex; }
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
                if (!string.IsNullOrEmpty(Utils.ReqUrlParameter("IsDel")))
                {
                    this._isDel = Utils.ReqUrlParameter("IsDel");
                }

                return this._isDel;
            }
        }
        #endregion

        #region  Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            commonField = new CommonField();

            urlParam = "page=" + Split.CurrentPageIndex.ToString() + "&IsDel=" + IsDel + "&NodeCode=" + NodeCode; // 要传递的参数

            if (!IsPostBack)
            {
                PageInit();
            }

            SetRight(this.Page, rptModelField);
        }
        #endregion

        #region 初始加载
        /// <summary>
        /// 初始化方法
        /// </summary>
        public void PageInit()
        {
            hdnUrlParm.Value = this.urlParam;
            SplitDataBind();
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            KingTop.Model.Pager p;         // 分页控件
            Hashtable hsWhereEqual;

            hsWhereEqual = new Hashtable();
            p = new KingTop.Model.Pager();

            hsWhereEqual.Add("IsDel", IsDel);
            p.Aspnetpage = Split;
            p.RptControls = rptModelField;
            commonField.PageData(p, hsWhereEqual, GetSearch(), Sort);
        }
        #endregion

        #region 搜索
        // 获取搜索条件
        private Hashtable GetSearch()
        {
            Hashtable hsWhere;

            hsWhere = new Hashtable();

            if (SearchType != "" && SearchValue != "")
            {
                hsWhere.Add(SearchType, SearchValue);
            }

            return hsWhere;
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
            redirectUrl.Append("CommonFieldList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(txtSearch.Text.Trim());
            redirectUrl.Append("&IsDel=" + IsDel);
            redirectUrl.Append("&NodeCode=" + NodeCode);

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 删除单条记录
        public void CommonField_Del(object sender, CommandEventArgs e)
        {
            bool isValidate;
            string msg;

            isValidate = IsHaveRightByOperCode("Delete");

            if (IsPostBack)
            {
                if (IsPostBack)
                {
                    msg = commonField.ModelFieldSet(e.CommandName, null, e.CommandArgument.ToString());
                    PageInit();

                    if (msg == "1")
                    {
                        WriteLog("删除公用字段 " + LogTitle + "(" + e.CommandArgument.ToString() + ") 至回收站成功", string.Empty, 2);
                    }
                    else
                    {
                        WriteLog("删除公用字段 " + LogTitle + "(" + e.CommandArgument.ToString() + ") 至回收站失败", msg, 3);
                    }
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有删除公用字段的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            string tranType;
            string[] arrArg;        // arrArg[0]  记录ID  arrArg[1] 记录值
            int isEnable;
            bool isValidate;
            string opName;          // 操作名称，用于记录日志
            string msg;

            isValidate = IsHaveRightByOperCode("Edit");
            arrArg = e.CommandArgument.ToString().Split(new char[] { '|' });
            tranType = e.CommandName;
            isEnable = 0;

            if (isValidate)
            {
                switch (e.CommandName)
                {
                    case "ISSEARCH":
                        opName = "是否搜索栏中显示";
                        break;
                    case "ISLIST":
                        opName = "是否列表中显示";
                        break;
                    case "ISEDIT":
                        opName = "是否编辑页中显示HTML";
                        break;
                    case "STATE":
                        opName = "状态";
                        break;
                    case "REQUIRED":
                        opName = "是否必填";
                        break;
                    case "ISDEFAULT":
                        opName = "是否公用";
                        break;
                    default:
                        opName = string.Empty;
                        break;
                }

                if (arrArg.Length > 1)
                {
                    if (arrArg[1] == "False" || arrArg[1] == "0")
                    {
                        isEnable = 1;
                    }

                    msg = commonField.ModelFieldSet(tranType, isEnable.ToString(), arrArg[0]);
                    PageInit();

                    if (msg == "1")
                    {
                        WriteLog("设置公用字段" + LogTitle + "(" + arrArg[0] + ")" + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "成功", null, 2);
                    }
                    else
                    {
                        WriteLog("设置公用字段" + LogTitle + "(" + arrArg[0] + ")" + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "失败", msg, 3);
                    }
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有修改公用字段属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

    }
}
