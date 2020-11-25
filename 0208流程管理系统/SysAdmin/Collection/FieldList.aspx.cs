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
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月22日    功能描述： 任务采集字段
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class FieldList : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;    // 提示信息
        private string _searchType = null;
        private string _searchValue = null;
        protected BLL.Collection.Field field;
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

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            field = new AllPower.BLL.Collection.Field(this.ID);

            if (!string.IsNullOrEmpty(this.ID))
            {
                PageInit();
            }
            else
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='TaskList.aspx';})";
            }
        }

        private void PageInit()
        {
            Dictionary<string, string> dicWhere;

            dicWhere = GetSqlWhere();

            // 权限验证（是否登陆或登陆超时）

            SplitDataBind(dicWhere);
        }
        #endregion

        #region 删除单条记录
        public void Field_Del(object sender, CommandEventArgs e)
        {
            field.CollectionFieldSet(e.CommandName, null, e.CommandArgument.ToString());
            PageInit();
        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            string tranType;
            string[] arrArg;        // arrArg[0]  记录ID  arrArg[1] 记录值
            int isEnable;

            arrArg = e.CommandArgument.ToString().Split(new char[] { '|' });
            tranType = e.CommandName;
            isEnable = 0;

            if (arrArg.Length > 1)
            {
                if (arrArg[1] == "False" || arrArg[1] == "0")
                {
                    isEnable = 1;
                }

                field.CollectionFieldSet(tranType, isEnable.ToString(), arrArg[0]);
                PageInit();
            }
        }
        #endregion

        #region 搜索
        // 获取搜索条件
        private Dictionary<string, string> GetSqlWhere()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            
            dicWhere.Add("CollectionTaskID", this.ID);
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

            redirectUrl = new StringBuilder();
            redirectUrl.Append("FieldList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(txtSearch.Text.Trim());
            redirectUrl.Append("&ID=" + this.ID);

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            AllPower.Model.Pager p = new AllPower.Model.Pager();

            p.Aspnetpage = FieldSplit;
            p.RptControls = rptField;
            p.DicWhere = dicWhere;
            field.PageData(p);
        }

        protected void FieldSplit_PageChanged(object src, EventArgs e)
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            dicWhere = GetSqlWhere();
            SplitDataBind(dicWhere);
        }
        #endregion
    }
}
