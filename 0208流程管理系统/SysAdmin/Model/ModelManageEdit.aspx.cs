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

using AllPower.Common;
using AllPower.Model;
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线

    作者:      吴岸标

    创建时间： 2010年3月16日

    功能描述： 内容模型编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class ModelManageEdit : AdminPage
    {
        #region 变量成员
        private string _action = null;
        private string _id = null;
        private string _isSub = string.Empty;
        protected string jsMessage = string.Empty;
        protected string jsMessageParam = "null";
        #endregion

        #region  属性
        public new string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToLower();
                }

                return this._action;
            }
        }

        public new string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID");
                }

                return this._id;
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
            txtConfigMan.Text = this.UserNo;
            PageInit();
        }
        #endregion

        #region 页面数据加载
        public void PageInit()
        {
            string configPath;                      // 模块配置路径
            DataTable dt;                           // 模块
            DataTable modelTB;                      // 当前模型记录
            AllPower.BLL.Content.ModelManage model;  // 业务逻辑操作对象
            bool isAdd;
            bool isValidate;
            string preFix;

            modelTB = null;
            isAdd = true;
            preFix = string.Empty;
            model = new AllPower.BLL.Content.ModelManage();

            if (this.Action == "edit")
            {
                FieldControl.Visible = false;
                isAdd = false;
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
            }
            else
            {
                isValidate = IsHaveRightByOperCode("New");  // 添加权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有添加模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
            }

            if (!IsPostBack)
            {
                model.BindField(chklField, isAdd);
                chkIsSub.Checked = Common.Utils.ParseBool(IsSub);

                if (!isAdd)
                {
                    SelectParams selParams;

                    if (this.ID == "")
                    {
                        return;
                    }

                    isAdd = false;
                    selParams = new SelectParams();
                    selParams.S1 = this.ID;
                    modelTB = model.GetList("ONE", selParams);
                    btnModel.Text = Utils.GetResourcesValue("Common", "Update");
                }

                if (modelTB != null)
                {
                    hdnOriginalCommonField.Value = modelTB.Rows[0]["CommonField"].ToString();
                    hdnOriginalSysField.Value = modelTB.Rows[0]["SysField"].ToString();
                    hdnOriginalListLink.Value = modelTB.Rows[0]["ListLink"].ToString().Split(new char[] { '$' })[0];
                    hdnOriginalListButton.Value = modelTB.Rows[0]["ListButton"].ToString().Split(new char[] { '$' })[0];
                    model.InitField(chklField, hdnOriginalCommonField.Value, hdnOriginalSysField.Value, isAdd);
                }

                model.SubModelGroupBind(ddlSubModelGroup);
                configPath = Utils.GetResourcesValue("Model", "ParseModePath");   // 模块绑定
                dt = Utils.GetXmlDataSet(configPath).Tables[0];

                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlModuleID.DataTextField = "Name";
                    ddlModuleID.DataValueField = "ID";
                    ddlModuleID.DataSource = dt;
                    ddlModuleID.DataBind();
                }

                if (modelTB != null && modelTB.Rows.Count > 0)                 // 初始控件值
                {
                    DataRow dr;
                    string[] arrListLink;
                    string[] arrListButton;
                    string[] arrCustomCol;

                    arrCustomCol = new string[1];
                    dr = modelTB.Rows[0];

                    preFix = dr["TableName"].ToString().Trim().Substring(0,4);
                    ddlPreFix.SelectedValue = preFix;
                    hdnPreFix.Value = preFix;
                    ddlPreFix.Enabled = false;

                    if (chkIsSub.Checked)
                    {
                        ddlSubModelGroup.SelectedValue = dr["SubModelGroupID"].ToString();
                    }

                    arrCustomCol[0] = dr["CustomCol"].ToString();
                    arrListLink = dr["listlink"].ToString().Split(new char[] { '$' });
                    arrListButton = dr["listbutton"].ToString().Split(new char[] { '$' });
                    txtTitle.Text = Utils.HtmlDecode(dr["Title"].ToString());
                    txtConfigMan.Text = dr["ConfigMan"].ToString();
                    txtMemo.Text = Utils.HtmlDecode(dr["Memo"].ToString());
                    txtTableName.Text = Utils.HtmlDecode(dr["TableName"].ToString()).Replace(ddlPreFix.SelectedValue, "");
                    txtOperationColumnWidth.Text = dr["OperationColumnWidth"].ToString();
                    ddlModuleID.SelectedValue = dr["ModuleID"].ToString();

                    if (Utils.ParseBool(dr["IsListContentClip"].ToString()))    // 是否可编辑列表宽度
                    {
                        radlIsListContentClip.SelectedValue = "1";
                    }
                    else
                    {
                        radlIsListContentClip.SelectedValue = "0";
                    }

                    if (dr["IsEnable"].ToString() == "True")        // 模型状态
                    {
                        radlIsEnable.SelectedValue = "1";
                    }
                    else
                    {
                        radlIsEnable.SelectedValue = "0";
                    }

                    if (dr["IsOrderEdit"].ToString() == "True")    // 是否显示排序
                    {
                        radlIsOrderEdit.SelectedValue = "1";
                    }
                    else
                    {
                        radlIsOrderEdit.SelectedValue = "0";
                    }

                    // 列表页面链接设置加载
                    hdnListLink.Value = "";
                    model.InitSelfDefinedList(arrListLink, "ListLink", ListLink, chkListLink, hdnListLink);
                    // 列表页面功能按钮设置加载
                    hdnListButton.Value = "";
                    model.InitSelfDefinedList(arrListButton, "ListButton", ListButton, chkListButton, hdnListButton);
                    model.InitSelfDefinedList(arrCustomCol, "CustomCol", CustomCol, null, hdnCustomCol);
                    model.InitLinkList(chkListLink, false, false);                                     // 列表页面文本链接置加载
                    model.InitLinkList(chkListButton, true, false);                                    // 列表页面功能按钮XML配置加载
                    model.InitOperationColumn(chklOperationColumn, dr["OperationColumn"].ToString()); // 列表操作列配置加载

                    if (arrListLink.Length > 0)
                    {
                        ControlUtils.SetGetCheckBoxListSelectValue(chkListLink, arrListLink[0]);
                    }

                    if (arrListButton.Length > 0)
                    {
                        ControlUtils.SetGetCheckBoxListSelectValue(chkListButton, arrListButton[0]);
                    }

                    hdnCustomCol.Value = dr["CustomCol"].ToString();
                    txtTableName.Enabled = false;
                }
                else
                {
                    model.InitLinkList(chkListLink, false, true);          // 列表页面文本链接置加载
                    model.InitLinkList(chkListButton, true, true);         // 列表页面功能按钮XML配置加载
                    model.InitOperationColumn(chklOperationColumn, null);  // 列表操作列配置加载
                }
            }
        }
        #endregion

        #region 更新模型
        protected void btnModel_Click(object sender, EventArgs e)
        {
            AllPower.Model.Content.ModelManage mModel;
            AllPower.BLL.Content.ModelManage model;
            List<AllPower.Model.Content.LinkList>[] mTxtLinkList;      // [0] 需删除的链接 [1] 需添加的链执着
            List<AllPower.Model.Content.LinkList>[] mButtonLinkList;   // [0] 需删除的按钮链接 [1] 需添加的按钮链接
            List<AllPower.Model.Content.SysField>[] mSysField;         // [0]  需删除的字段，[1] 需添加的字段  
            string ddlSQL;                                            // DDL SQL语句
            string dmlSQL;                                            // DML SQL语句
            string[] temp;                                            // 临时数组用于接收方法返回的DDL和DML语句 
            bool isAdd;                                               // 当前操作
            bool isPublicOperSynchronization;                         // 当前模型中的操作是否和操作表同步
            string chkSysFieldValue;                                  // 系统自定义字段值 
            string chkCommonFieldValue;                               // 公用字段值
            string chkListLinkValue;                                  // 选取的链接
            string chkListButtonValue;                                // 选取的按钮
            string returnMsg;
            string tranType;                                          // 操作类型
            string commonFieldPrompt;                                 // 公用字段操作提示
            bool isValidate;                                          // 权限验证

            mModel = new AllPower.Model.Content.ModelManage();
            model = new AllPower.BLL.Content.ModelManage(mModel);

            model.RptButtonValue = ControlUtils.GetCheckBoxListSelectValue(chklOperationColumn);
            chkListButtonValue = ControlUtils.GetCheckBoxListSelectValue(chkListButton);
            chkListLinkValue = ControlUtils.GetCheckBoxListSelectValue(chkListLink);
            model.ListButtonValue = chkListButtonValue;
            chkSysFieldValue = model.GetCheckBoxListField(chklField, true);
            chkCommonFieldValue = model.GetCheckBoxListField(chklField, false);
            ddlSQL = null;
            dmlSQL = null;
            isAdd = true;
            tranType = "NEW";

            if (this.Action == "edit")
            {
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    tranType = "EDIT";
                    isAdd = false;
                    mModel.ID = this.ID;
                    mModel.ModuleID = ddlModuleID.SelectedValue;
                    mModel.TableName = hdnPreFix.Value + Utils.HtmlEncode(txtTableName.Text.Trim());
                    mModel.IsEnable = Utils.ParseBool(radlIsEnable.SelectedValue);
                    mModel.IsOrderEdit = Utils.ParseBool(radlIsOrderEdit.SelectedValue);
                    mModel.Title = Utils.HtmlEncode(txtTitle.Text.Trim());
                    mModel.SysField = chkSysFieldValue;
                    mModel.CustomCol = hdnCustomCol.Value;
                    mModel.Memo = Utils.HtmlEncode(txtMemo.Text.Trim());
                    mModel.ListLink = model.GetLinkList(hdnListLink, chkListLink);
                    mModel.ListButton = model.GetLinkList(hdnListButton, chkListButton);
                }
            }
            else
            {
                string[] tableID;

                isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                if (!isValidate)
                {
                    jsMessage = "type=2;errmsg=\"对不起，您没有添加模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                    return;
                }
                else
                {
                    if (IsSub == "1")
                    {
                        mModel.BackDeliverUrlParam = "NodeCode,ParentID,OriginalUrl";
                        mModel.FieldFromUrlParamValue = "ParentID";
                        mModel.NotSearchField = "NodeCode";
                        mModel.DeliverAndSearchUrlParam = "ParentID";
                    }
                    else
                    {
                         mModel.BackDeliverUrlParam = "NodeCode";
                    }

                    tableID = GetTableID("0", "K_ModelManage");
                    mModel.ID = tableID[0];
                    mModel.TableName = ddlPreFix.SelectedValue + Utils.HtmlEncode(txtTableName.Text.Trim());
                    mModel.ModuleID = ddlModuleID.SelectedValue;
                    mModel.MenuNo = NodeID;
                    mModel.SiteID = 1;
                    mModel.IsHtml = true;
                    mModel.IsDel = false;
                    mModel.IsEnable = Utils.ParseBool(radlIsEnable.SelectedValue);
                    mModel.IsOrderEdit = Utils.ParseBool(radlIsOrderEdit.SelectedValue);
                    mModel.Title = Utils.HtmlEncode(txtTitle.Text.Trim());
                    mModel.SysField = chkSysFieldValue;
                    mModel.CustomCol = hdnCustomCol.Value;
                    mModel.Orders = Utils.ParseInt(tableID[1], 50);
                    mModel.Memo = Utils.HtmlEncode(txtMemo.Text.Trim());
                    mModel.ListLink = model.GetLinkList(hdnListLink, chkListLink);
                    mModel.ListButton = model.GetLinkList(hdnListButton, chkListButton);
                    ddlSQL = model.CreateTable(mModel.TableName,Common.Utils.ParseBool(IsSub));
                    dmlSQL = model.InsertInitField(mModel.ID,Common.Utils.ParseBool(IsSub));
                }
            }

            if (isValidate)
            {
                mModel.IsSub = chkIsSub.Checked;

                if (mModel.IsSub)
                {
                    mModel.SubModelGroupID = Request.Form["ddlSubModelGroup"];
                }
                else
                {
                    mModel.SubModelGroupID = string.Empty;
                }

                mModel.CommonField = chkCommonFieldValue;
                mModel.OperationColumn = model.RptButtonValue;
                mModel.IsListContentClip = Utils.ParseBool(radlIsListContentClip.SelectedValue);
                mModel.OperationColumnWidth = txtOperationColumnWidth.Text.Trim();
                mModel.ConfigMan = txtConfigMan.Text.Trim();
                mTxtLinkList = model.GetLinkList(hdnOriginalListLink.Value, chkListLinkValue, false, isAdd);
                mButtonLinkList = model.GetLinkList(hdnOriginalListButton.Value, chkListButtonValue, true, isAdd);
                mSysField = model.GetSysField(hdnOriginalSysField.Value, chkSysFieldValue);

                // 获取链接的DDL与DML语句
                temp = model.GetLinkListSQL(mTxtLinkList, mButtonLinkList);
                ddlSQL = ddlSQL + temp[0];
                dmlSQL = dmlSQL + temp[1];
                // 获取系统（自定义）字段的DDL与DML语句
                temp = model.GetSysFieldSQL(mSysField);
                ddlSQL = ddlSQL + temp[0];
                dmlSQL = dmlSQL + temp[1];
                // 同步当前模型的操作
                isPublicOperSynchronization = model.PublicOperSynchronization();

                if (isPublicOperSynchronization)
                {
                    returnMsg = model.Save(tranType, mModel, ddlSQL, dmlSQL);
                    commonFieldPrompt = string.Empty;

                    if (this.Action.ToLower() != "edit")
                    {
                        commonFieldPrompt = model.SaveCommonField(hdnOriginalCommonField.Value, chkCommonFieldValue, isAdd);
                    }

                    if (returnMsg == "1")
                    {
                        if (this.Action == "edit")
                        {
                            jsMessage = "type=1;title=\"" + mModel.Title + " \";id=\"" + this.ID + "\"";
                            WriteLog("更新模型 " + mModel.Title + "(ID:" + mModel.ID + ") 成功！", null, 2);
                        }
                        else
                        {
                            jsMessage = "type=0;title=\"" + mModel.Title + " \";id=\"" + this.ID + "\"";
                            WriteLog("新增模型 " + mModel.Title + "(ID:" + mModel.ID + ") 成功！", null, 2);
                        }

                        if (commonFieldPrompt != "[]")
                        {
                            jsMessageParam = commonFieldPrompt;
                        }
                    }
                    else
                    {
                        jsMessage = "errmsg=\"对不起，操作失败。\";type=2;id=\"" + this.ID + "\";";
                        WriteLog("新增模型 " + mModel.Title + "(ID:" + mModel.ID + ") 失败！", returnMsg, 3);
                    }
                }
                else  // 模型操作同步失败
                {
                    jsMessage = "errmsg=\"对不起，模型操作同步失败，请重试。\";type=2;id=\"" + this.ID + "\";";

                    if (this.Action == "edit")
                    {
                        WriteLog("修改模型 " + mModel.Title + "(ID:" + mModel.ID + ") 时同步至模块、操作时失败！", "", 3);
                    }
                    else
                    {
                        WriteLog("新增模型 " + mModel.Title + "(ID:" + mModel.ID + ") 时同步至模块、操作时失败！", "", 3);
                    }
                }
            }
        }
        #endregion
    }
}
