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
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月23日
    功能描述： 模型字段列表
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class FieldManageList : AdminPage
    {
        #region 变量成员
        private string _modelID;                       // 所属模型
        private string _isDel = "0";                   // 逻辑删除
        private string _isSub = string.Empty;          // 子模型
        private string _tableName = null;              // 所属表名
        private string _searchType = null;             // 搜索字段
        private string _searchValue = null;            // 搜索值
        private string _sort;                          // 排序
        protected string jsMessage;                    // 操作返回的JS代码
        protected string urlParam;                     // 要传递的URL参数
        protected BLL.Content.FieldManage fieldManage; // 业务操作对象
        private string _modelName;                      // 所属模型名称
        #endregion

        #region 属性
        /// <summary>
        /// 所属模型名称
        /// </summary>
        public string ModelName
        {
            get 
            {
                if (string.IsNullOrEmpty(this._modelName))
                {
                    this._modelName = Request.QueryString["ModelName"];
                }

                return this._modelName; 
            }
        }
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
        /// 所属模型表
        /// </summary>
        public string TableName
        {
            get
            {
                if (string.IsNullOrEmpty(this._tableName))
                {
                    this._tableName = Request.QueryString["TableName"];
                }

                return this._tableName;
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

        /// <summary>
        ///  搜索值
        /// </summary>
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

        /// <summary>
        /// 逻辑删除
        /// </summary>
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

        /// <summary>
        /// 所属模型ID
        /// </summary>
        public string ModelID
        {
            get
            {
                if (string.IsNullOrEmpty(this._modelID))
                {
                    this._modelID = Request.QueryString["ModelID"];
                }

                return this._modelID;
            }
        }
        /// <summary>
        /// 是否显示子模型
        /// </summary>
        public string IsSub
        {
            get
            {
                if (string.IsNullOrEmpty(this._isSub))
                {
                    this._isSub = Request.QueryString["IsSub"];

                    if (this._isSub == null || this._isSub.Trim() == "")
                    {
                        this._isSub = "0";
                    }
                }

                return this._isSub;
            }
        }
        #endregion

        #region  Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            fieldManage = new FieldManage(ModelID, TableName);
            urlParam = "IsSub="+ IsSub +"&page=" + Split.CurrentPageIndex.ToString() + "&ModelID=" + ModelID + "&TableName=" + TableName + "&IsDel=" + IsDel + "&NodeCode=" + NodeCode + "&ModelName=" + ModelName; // 要传递的参数

            if (!IsPostBack && !string.IsNullOrEmpty(this.ModelID))
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

            if (!string.IsNullOrEmpty(ModelID.Trim()) && !string.IsNullOrEmpty(TableName.Trim()))
            {
                SplitDataBind();
            }
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
            hsWhereEqual.Add("ModelID", ModelID);
            p.Aspnetpage = Split;
            p.RptControls = rptModelField;
            fieldManage.PageData(p, hsWhereEqual, GetSearch(), Sort);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            urlParam = "page=" + Split.CurrentPageIndex.ToString() + "&ModelID=" + ModelID + "&TableName=" + TableName + "&IsDel=" + IsDel + "&NodeCode=" + NodeCode; // 要传递的参数
            PageInit();
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
            redirectUrl.Append("FieldManageList.aspx?");
            redirectUrl.Append("SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(Utils.cutBadStr(txtSearch.Text.Trim()));
            redirectUrl.Append("&ModelID=" + ModelID);
            redirectUrl.Append("&IsDel=" + IsDel);
            redirectUrl.Append("&TableName=" + TableName);
            redirectUrl.Append("&NodeCode=" + NodeCode);
            redirectUrl.Append("&ModelName=" + ModelName);

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 创建模型
        protected void CreateModel(object sender, CommandEventArgs e)
        {
            string modelId;         // 模型ID
            string browseUrl;       // 浏览模型地址
            string tableName;       // 模型表名
            bool isValidate;

            isValidate = IsHaveRightByOperCode("CreateModel");
            modelId = Request.QueryString["modelid"];
            tableName = Request.QueryString["tableName"];
            if (isValidate)
            {
                if (!string.IsNullOrEmpty(modelId) && !string.IsNullOrEmpty(tableName))
                {
                    BLL.Content.ParseModel model = new BLL.Content.ParseModel(modelId,BLL.Content.ParserType.Content);
                    browseUrl =model.CutTableNamePreFix(tableName) + "edit.aspx?Action=browse&Url=FieldManageList.aspx?NodeCode="+ NodeCode +"&ModelID=" + ModelID + "&TableName=" + tableName + "&page=" + Split.CurrentPageIndex.ToString();

                    try
                    {
                        model.Create();
                        jsMessage = "CreateModelConfirm(\"" + browseUrl + "\", \"恭喜您，创建成功,是否浏览生成后的模型！\")";
                        WriteLog("生成模型 " + ModelName + "(" + modelId + ") 成功", string.Empty, 2);
                    }
                    catch (Exception ex)
                    {
                        jsMessage = "alert({ msg: '操作失败，请重试。', title: '操作结果' })";
                        WriteLog("生成模型 " + ModelName + "(" + modelId + ") 失败", ex.Message, 3);
                    }
                }
                else
                {
                    jsMessage = "alert({ msg: '操作失败，参数不足。', title: '操作提示' })";
                    WriteLog("生成模型 " + ModelName + "(" + modelId + ") 失败", "操作失败，参数不足", 3);
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有创建模型属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

        #region 删除单条记录
        public void FieldManage_Del(object sender, CommandEventArgs e)
        {
            bool isValidate;
            string msg;

            isValidate = IsHaveRightByOperCode("Delete");

            if (isValidate)
            {
                if (IsPostBack)
                {
                    msg = fieldManage.ModelFieldSet(e.CommandName, null, e.CommandArgument.ToString());
                    PageInit();

                    if (msg == "1")
                    {
                        WriteLog("删除模型" + ModelName + "字段 " + LogTitle + "(" + e.CommandArgument.ToString() + ") 至回收站成功", string.Empty, 2);
                    }
                    else
                    {
                        WriteLog("删除" + ModelName + "字段 " + LogTitle + "(" + e.CommandArgument.ToString() + ") 至回收站失败", msg, 3);
                    }
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有删除字段的操作权限，请与管理员联系！\",title:\"操作提示\"});";
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

                    msg = fieldManage.ModelFieldSet(tranType, isEnable.ToString(), arrArg[0]);
                    PageInit();

                    if (msg == "1")
                    {
                        WriteLog("设置模型" + ModelName + "中的字段" + LogTitle +"(" + arrArg[0] + ")" + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "成功", null, 2);
                    }
                    else
                    {
                        WriteLog("设置字段模型" + ModelName + "中的字段" + LogTitle + "(" + arrArg[0] + ")" + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "失败", msg, 3);
                    }
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有修改字段属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

    }
}
