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
    创建时间： 2010年3月16日
    功能描述： 内容模型列表
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class ModelManageList : AdminPage
    {
        #region 解析模块类型
        private Hashtable _parseModel = null;

        public Hashtable ParseModel
        {
            get
            {
                if (this._parseModel == null)
                {
                    this._parseModel = new Hashtable();

                    // 解析模板绑定
                    string configPath = Utils.GetResourcesValue("Model", "ParseModePath");
                    DataTable dt = Utils.GetXmlDataSet(configPath).Tables[0];

                    foreach (DataRow dr in dt.Rows)
                    {
                        this._parseModel.Add(dr["ID"], dr["Name"]);
                    }
                }

                return this._parseModel;
            }
        }
        #endregion

        #region 变量成员
        private string _searchType = null;
        private string _searchValue = null;
        private string _isDel = null;
        private string _isSub = string.Empty;
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

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            PageInit();
            SetRight(this.Page, rptModelManage);
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
        }

        private void PageInit()
        {
            Dictionary<string, string> dicWhere;

            hdnNodeCode.Value = NodeCode;
            dicWhere = GetSqlWhere();
            SplitDataBind(dicWhere);
        }
        #endregion

        #region 删除单条模板记录
        public void ModelManage_Del(object sender, CommandEventArgs e)
        {
            string id;
            string tranType;    // 事务类型
            string returnMsg;   // 事务返回信息
            KingTop.BLL.Content.ModelManage model;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Delete");

            if (isValidate)
            {
                if (IsPostBack)
                {
                    id = e.CommandArgument.ToString();

                    if (e.CommandName == "del")
                    {
                        tranType = "DELONE";
                    }
                    else if (string.Equals(e.CommandName, "deldp"))
                    {
                        string tableName;

                        tranType = "DELDP";
                        tableName = ((Button)sender).ToolTip;
                        tableName = tableName.Replace("K_U_", "");
                        File.Delete(Server.MapPath(tableName + "list.aspx"));       // 删除生成的列表文件
                        File.Delete(Server.MapPath(tableName + "edit.aspx"));       // 删除生成的编辑文件
                        File.Delete(Server.MapPath(tableName + "view.aspx"));       // 删除生成的编辑文件
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
                    model = new KingTop.BLL.Content.ModelManage();
                    returnMsg = model.ModelManageSet(tranType, null, id);

                    if (returnMsg == "1")
                    {
                        WriteLog("删除模型 " + LogTitle + " 至回收站成功", string.Empty, 2);
                    }
                    else
                    {
                        WriteLog("删除模型 " + LogTitle + " 至回收站失败", returnMsg, 3);
                    }

                    PageInit();
                }
            }
            else
            {
                jsMessage += "alertClose({msg:\"对不起，您没有删除模型的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }

        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            KingTop.BLL.Content.ModelManage model;
            string tranType;
            string returnMsg;
            string[] arrArg;        // arrArg[0]  记录ID  arrArg[1] 记录值
            int isEnable;
            bool isValidate;
            string opName;          // 操作名称，用于记录日志

            isValidate = IsHaveRightByOperCode("Edit");

            if (isValidate)
            {
                model = new KingTop.BLL.Content.ModelManage();
                arrArg = e.CommandArgument.ToString().Split(new char[] { '|' });
                tranType = e.CommandName;
                isEnable = 0;

                switch (e.CommandName)
                {
                    case "STATE":
                        opName = "状态";
                        break;
                    case "HTML":
                        opName = "是否生成HTML";
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

                    returnMsg = model.ModelManageSet(tranType, isEnable.ToString(), arrArg[0]);

                    if (returnMsg == "1")
                    {
                        WriteLog("设置模型 " + LogTitle + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "成功", null, 2);
                    }
                    else
                    {
                        WriteLog("设置模型 " + LogTitle + opName + arrArg[1].ToString() + " => " + isEnable.ToString() + "失败", returnMsg, 3);
                    }

                    PageInit();
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有修改模型属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
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

            if (IsSub == "")
            {
                dicWhere.Add("IsSub", "0");
            }
            else
            {
                dicWhere.Add("IsSub", IsSub);
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
            redirectUrl.Append("ModelManageList.aspx?IsSub="+ IsSub +"&NodeCode=" + NodeCode);
            redirectUrl.Append("&SearchType=");
            redirectUrl.Append(ddlSearchType.SelectedValue);
            redirectUrl.Append("&SearchValue=");
            redirectUrl.Append(Utils.cutBadStr(txtSearch.Text.Trim()));

            Utils.UrlRedirect(redirectUrl.ToString());
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind(Dictionary<string, string> dicWhere)
        {
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            KingTop.BLL.Content.ModelManage objsource = new KingTop.BLL.Content.ModelManage();

            p.Aspnetpage = Split;
            p.RptControls = rptModelManage;
            p.DicWhere = dicWhere;
            objsource.PageData(p);
        }
        #endregion

        #region 创建模型
        protected void CreateModel(object sender, CommandEventArgs e)
        {
            string strModelId;      // 模型ID
            string browseUrl;       // 浏览模型地址
            bool isValidate;

            isValidate = IsHaveRightByOperCode("CreateModel");

            if (isValidate)
            {
                strModelId = e.CommandArgument.ToString();

                if (Utils.ParseBool(e.CommandName))
                {
                    BLL.Content.ParseModel model = new ParseModel(strModelId, BLL.Content.ParserType.Content);
                    browseUrl = model.CutTableNamePreFix(((Button)sender).ToolTip) + "edit.aspx?Action=browse&NodeCode=" + NodeCode;

                    try
                    {
                        model.Create();
                        jsMessage = "CreateModelConfirm(\"" + browseUrl + "\", \"恭喜您，创建成功,是否浏览生成后的模型！\")";
                    }
                    catch (Exception ex)
                    {
                        jsMessage = "alert({ msg: '操作失败，请重试。', title: '操作结果' })";
                        WriteLog("生成模型 " + LogTitle + " 失败", ex.Message, 3);
                    }

                    WriteLog("生成模型 " + LogTitle + " 成功", string.Empty, 2);
                }
                else
                {
                    jsMessage = "alert({ msg: '对不起，当前模型已被禁用，如需使用请先解禁当前模型。', title: '操作提示' })";
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有创建模型属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion

        #region 创建所有模型
        protected void CreateAllModel(object sender, CommandEventArgs e)
        {
            BLL.Content.ParseModel model;
            BLL.Content.ModelManage modelManage;
            DataTable dtModel;
            string faileModelName;
            StringBuilder sbMsg;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("CreateModel");
            sbMsg = new StringBuilder();

            if (isValidate)
            {
                faileModelName = string.Empty;
                modelManage = new BLL.Content.ModelManage();
                dtModel = modelManage.GetList("IDANDNAME", new Model.SelectParams());

                foreach (DataRow dr in dtModel.Rows)        // 遍历生成所有模型
                {
                    model = new ParseModel(dr["ID"].ToString(), BLL.Content.ParserType.Content);

                    try { model.Create(); }
                    catch (Exception ex)
                    {
                        if (string.IsNullOrEmpty(faileModelName))
                        {
                            faileModelName = dr["Title"].ToString();
                        }
                        else
                        {
                            faileModelName += "," + dr["Title"].ToString();
                        }

                        sbMsg.Append(ex.Message);
                    }
                }

                if (string.IsNullOrEmpty(faileModelName))
                {
                    jsMessage = "alert({ msg: '全部生成成功,禁用和删除在回收站的模型除外！', title: '操作结果' })";
                    WriteLog("全部生成成功,禁用和删除在回收站的模型除外！", null, 2);
                }
                else
                {
                    jsMessage = "alert({ msg: '对不起，以下模型生成失败 " + faileModelName + "。', title: '操作提示' })";
                    WriteLog("以下模型生成失败 " + faileModelName, sbMsg.ToString(), 3);
                }
            }
            else
            {
                jsMessage += "alert({msg:\"对不起，您没有创建模型属性的操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion
    }
}
