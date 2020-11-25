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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月22日    功能描述： 采集字段
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class FieldEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.Field field;
        protected string jsMessage;             // 操作提示
        private string _taskID;                 // 所属任务ID
        private string _pageIndex;              // 任务列分页
        protected string[] tagDealTypeChecked;  // 标签替换初操作方式初始化
        #endregion

        #region 属性
        /// <summary>
        /// 所属任务ID
        /// </summary>
        public string TaskID
        {
            get
            {
                if (string.IsNullOrEmpty(this._taskID))
                {
                    this._taskID = Request.QueryString["TaskID"];
                }

                return this._taskID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isTrue;
            field = new AllPower.BLL.Collection.Field(TaskID);
            tagDealTypeChecked = new string[4];

            isTrue = true;
            if (string.IsNullOrEmpty(TaskID))
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='FieldList.aspx?ID="+ TaskID +"';})";
                isTrue = false;
            }
            else
            {
                if (!IsPostBack && this.Action.ToLower() == "edit")
                {
                    if (string.IsNullOrEmpty(this.ID))
                    {
                        jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='FieldList.aspx?ID="+ TaskID +"';})";
                        isTrue = false;
                    }
                }
            }

            if (isTrue && !IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataTable dt;
            dt = field.GetRuleList(TaskID);

            if (dt != null && dt.Rows.Count > 0)
            {
                ddlCollectionRuleID.DataTextField = "Name";
                ddlCollectionRuleID.DataValueField = "ID";
                ddlCollectionRuleID.DataSource = dt;
                ddlCollectionRuleID.DataBind();
                ddlRuleList.DataTextField = "Name";
                ddlRuleList.DataValueField = "ID";
                ddlRuleList.DataSource = dt;
                ddlRuleList.DataBind();
            }
            else
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"请先添加 规则 ,再进行当前操作。\"},function(data){location.href='RuleEdit.aspx?Action=add&TaskID="+ TaskID +"&page=';})";
            }

            field.BindTableName(ddlTableName);          // 绑定表名

            if (ddlTableName.Items.Count == 0)
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"请先添加 表列 ,再进行当前操作。\"},function(data){location.href='TaskEdit.aspx?ID=" + TaskID + "&TableNameList=1&action=edit';})";
            }

            if (this.Action.ToLower() == "edit")        // 编辑加载初始值
            {
                dt = field.GetList(this.ID);
                btnSave.Text = "修 改";
                txtName.Enabled = false;

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr;
                    string remindTag;   // 需要保留的标签
                    string clearTag;    // 需要清除的标签

                    dr = dt.Rows[0];
                    // 基本信息
                    ddlCollectionRuleID.SelectedValue = dr["CollectionRuleID"].ToString();
                    txtAlias.Text = dr["Alias"].ToString();
                    ddlTableName.SelectedValue = dr["TableName"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    ddlFieldType.SelectedValue = dr["FieldType"].ToString();
                    chkIsCycle.Checked = Utils.ParseBool(dr["IsCycle"]);
                    chkIsKeyword.Checked = Utils.ParseBool(dr["IsKeyword"]);
                    chkIsJoin.Checked = Utils.ParseBool(dr["IsJoin"]);
                    txtStartTag.Text = dr["StartTag"].ToString();
                    txtEndTag.Text = dr["EndTag"].ToString();
                    // 文件下载选项
                    chkIsDownImg.Checked = Utils.ParseBool(dr["IsDownImg"]);
                    chkIsDownFlash.Checked = Utils.ParseBool(dr["IsDownFlash"]);
                    chkIsDownOther.Checked = Utils.ParseBool(dr["IsDownOther"]);
                    if (chkIsDownImg.Checked || chkIsDownFlash.Checked || chkIsDownOther.Checked)   // 存在下载配置
                    {
                        if (chkIsDownOther.Checked)
                        {
                            txtOtherType.Text = dr["OtherType"].ToString();
                        }

                        txtLinkIncludeContent.Text = dr["LinkIncludeContent"].ToString();
                        chkIsAlterToAbsolute.Checked = Utils.ParseBool(dr["IsAlterToAbsolute"]);
                        chkIsAlterFileName.Checked = Utils.ParseBool(dr["IsAlterFileName"]);
                        chkIsAlterExt.Checked = Utils.ParseBool(dr["IsAlterExt"]);
                        radlImagePattern.SelectedValue = dr["ImagePattern"].ToString();

                        if (chkIsAlterExt.Checked)
                        {
                            ddlFileExt.SelectedValue = dr["FileExt"].ToString();
                        }
                    }
                    // HTML标签处理 
                    remindTag = dr["RemaindTag"].ToString().Trim();
                    clearTag = dr["ClearTag"].ToString().Trim();

                    if (!string.IsNullOrEmpty(remindTag))        // 保留操作
                    {
                        if (remindTag == "All")  // 保留全部
                        {
                            tagDealTypeChecked[0] = "checked=\"checked\"";
                        }
                        else  // 保留部分
                        {
                            ControlUtils.SetGetCheckBoxListSelectValue(chklTags, remindTag);
                            tagDealTypeChecked[1] = "checked=\"checked\"";
                        }
                    }

                    if (!string.IsNullOrEmpty(clearTag))  // 清除操作
                    {
                        if (clearTag == "All") // 清除全部
                        {
                            tagDealTypeChecked[3] = "checked=\"checked\"";
                        }
                        else  // 清除部分
                        {
                            ControlUtils.SetGetCheckBoxListSelectValue(chklTags, clearTag);
                            tagDealTypeChecked[2] = "checked=\"checked\"";
                        }
                    }
                    // 特殊结果设置 
                    chkIsSpecialDeal.Checked = Utils.ParseBool(dr["IsSpecialDeal"].ToString());

                    if (chkIsSpecialDeal.Checked)
                    {
                        radlSpecialType.SelectedValue = dr["SpecialType"].ToString();

                        switch (dr["SpecialType"].ToString())
                        {
                            case "3":         // 固定字符串
                                txtFixCharContent.Text = dr["FixCharContent"].ToString();
                                break;
                            case "5":         // 来源唯一标识
                                ddlRuleList.SelectedValue = dr["SourceIdentifier"].ToString();
                                break;
                        }
                    }

                    ddlTableName.Enabled = false;
                }
            }
        }
        #endregion

        #region 添加/更新
        public void Save(object sender, EventArgs e)
        {
            AllPower.Model.Collection.Field mField;
            string htmlTagDealType;                 // 标签处理类型
            string tranType;                        // 操作类型
            string msg;                             // 业务操作返回信息
            string linkURL;                         // 操作返回地址

            mField = new AllPower.Model.Collection.Field();

            tranType = "NEW";
            linkURL = "FieldList.aspx?ID=" + TaskID;
             
            if (this.Action.ToLower() == "edit")  // 修改
            {
                tranType = "EDIT";
                mField.ID = this.ID;
            }

            mField.CollectionTaskID = TaskID;
            // 基本信息
            mField.CollectionRuleID = ddlCollectionRuleID.SelectedValue;
            mField.Alias = txtAlias.Text;
            mField.TableName = ddlTableName.SelectedValue;
            mField.Name = txtName.Text;
            mField.FieldType = Utils.ParseInt(ddlFieldType.SelectedValue, 2);
            mField.IsCycle = chkIsCycle.Checked;
            mField.IsKeyword = chkIsKeyword.Checked;
            mField.IsJoin = chkIsJoin.Checked;
            mField.StartTag = txtStartTag.Text;
            mField.EndTag = txtEndTag.Text;
            // 文件下载选项
            mField.IsDownImg = chkIsDownImg.Checked;
            mField.IsDownFlash = chkIsDownFlash.Checked;
            mField.IsDownOther = chkIsDownOther.Checked;

            if (mField.IsDownImg || mField.IsDownFlash || mField.IsDownOther)   // 存在下载配置
            {
                if (mField.IsDownOther)
                {
                    mField.OtherType = txtOtherType.Text;
                }

                mField.LinkIncludeContent = txtLinkIncludeContent.Text;
                mField.IsAlterToAbsolute = chkIsAlterToAbsolute.Checked;
                mField.IsAlterFileName = chkIsAlterFileName.Checked;
                mField.IsAlterExt = chkIsAlterExt.Checked;
                mField.ImagePattern = Utils.ParseInt(radlImagePattern.SelectedValue,0);

                if (mField.IsAlterExt)  // 强制更改扩展名
                {
                    mField.FileExt = ddlFileExt.SelectedValue;
                }
            }
            // HTML标签处理 
            htmlTagDealType = Request.Form["htmlTag"];

            switch (htmlTagDealType)
            {
                case "1":   // 保留所有标记
                    mField.RemaindTag = "All";
                    break;
                case "2":   // 保留部分标记
                    mField.RemaindTag = ControlUtils.GetCheckBoxListSelectValue(chklTags);
                    break;
                case "3":   // 清除部分标记
                    mField.ClearTag = ControlUtils.GetCheckBoxListSelectValue(chklTags);
                    break;
                case "4":   // 清除所有标记
                    mField.ClearTag = "All";
                    break;
            }
            // 特殊结果设置 
            mField.IsSpecialDeal = chkIsSpecialDeal.Checked;

            if (mField.IsSpecialDeal)
            {
                mField.SpecialType = Utils.ParseInt(radlSpecialType.SelectedValue, 0);

                switch (mField.SpecialType)
                {
                    case 3:         // 固定字符串
                        mField.FixCharContent = txtFixCharContent.Text;
                        break;
                    case 5:         // 来源唯一标识
                        mField.SourceIdentifier = ddlRuleList.SelectedValue;
                        break;
                }
            }

            msg = field.Save(tranType, mField);
            if (msg == "1")
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"恭喜您，更新成功！\"},function(data){location.href='FieldList.aspx?ID=" + TaskID + "';})";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，添加成功，是否继续添加？\")){location.href=\"" + linkURL + "\";}";
                }
            }
            else
            {
                if (msg == "-100")
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"编辑成功，但字段同步失败，请重新保存任务。\"},function(data){location.href='FieldList.aspx?ID=" + TaskID + "';})";
                }
                else
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"对不起，操作失败，请重试。\"},function(data){location.href='FieldList.aspx?ID=" + TaskID + "';})";
                }
            }
        }
        #endregion
    }
}
