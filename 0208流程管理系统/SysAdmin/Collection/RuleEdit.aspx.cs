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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月21日    功能描述： 采集规则
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class RuleEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.Rule rule;
        protected string jsMessage;             // 操作提示
        private string _taskID;                 // 所属任务ID
        private string _pageIndex;              // 任务列分页
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
        /// <summary>
        /// 任务列表分页
        /// </summary>
        public string PageIndex
        {
            get 
            {
                if (string.IsNullOrEmpty(this._pageIndex))
                {
                    this._pageIndex = Request.QueryString["page"];
                }

                return this._pageIndex;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            rule = new AllPower.BLL.Collection.Rule();

            if (string.IsNullOrEmpty(TaskID))
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='RuleList.aspx?ID=" + TaskID + "';})";

            }
            else
            {
                if (!IsPostBack && this.Action.ToLower() == "edit")
                {
                    if (!string.IsNullOrEmpty(this.ID))
                    {
                        PageInit();
                    }
                    else
                    {
                        jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='RuleList.aspx?ID=" + TaskID + "';})";
                    }
                }
            }
        }
        #endregion

        #region 初始加载
        protected void PageInit()
        {
            DataTable dt;

            dt = rule.GetByID(this.ID);
            btnSave.Text = "修 改";

            if (dt != null && dt.Rows.Count > 0)            // 记录加载成功
            {
                DataRow dr;

                dr = dt.Rows[0];

                txtName.Text = dr["Name"].ToString();
                ddlRuleType.SelectedValue = dr["RuleType"].ToString();
                chkIsCA.Checked = Utils.ParseBool(dr["IsCA"].ToString());
                chkIsSA.Checked = Utils.ParseBool(dr["IsSA"].ToString());

                if (Utils.ParseBool(dr["IsSA"].ToString()))     // 提取分页地址
                {
                    txtSA_StartTags.Text = dr["SA_StartTags"].ToString();
                    txtSA_EndTags.Text = dr["SA_EndTags"].ToString();
                    txtSA_IncludeContent.Text = dr["SA_IncludeContent"].ToString();
                    txtSA_NotIncludeContent.Text = dr["SA_NotIncludeContent"].ToString();
                    ddlSA_ParseType.SelectedValue = dr["SA_ParseType"].ToString();
                    txtSA_PostUrl.Text = dr["SA_PostUrl"].ToString();
                    chkSA_IsEncode.Checked = Utils.ParseBool(dr["SA_IsEncode"].ToString());
                    ddlSA_GetRange.SelectedValue = dr["SA_GetRange"].ToString();
                    chkSA_IsJoinContent.Checked = Utils.ParseBool(dr["SA_IsJoinContent"].ToString());
                    txtSA_MaxSplitCount.Text = dr["SA_MaxSplitCount"].ToString();
                    txtSA_JoinChar.Text = dr["SA_JoinChar"].ToString();
                    txtSA_NeedParam.Text = dr["SA_NeedParam"].ToString();
                    txtSA_RealParam.Text = dr["SA_RealParam"].ToString();
                    txtSA_OtherNeedParam.Text = dr["SA_OtherNeedParam"].ToString();
                    txtSA_OtherRealParam.Text = dr["SA_OtherRealParam"].ToString();

                    if (!string.IsNullOrEmpty(dr["SA_PostUrl"].ToString().Trim()))
                    {
                        chkIsPostUrl.Checked = true;
                    }
                }

                if (Utils.ParseBool(dr["IsCA"].ToString()))     // 提取下层地址
                {
                    txtCA_StartTags.Text = dr["CA_StartTags"].ToString();
                    txtCA_EndTags.Text = dr["CA_EndTags"].ToString();
                    txtCA_IncludeContent.Text = dr["CA_IncludeContent"].ToString();
                    txtCA_NotIncludeContent.Text = dr["CA_NotIncludeContent"].ToString();
                    ddlCA_ParseType.SelectedValue = dr["CA_ParseType"].ToString();
                    txtCA_PostUrl.Text = dr["CA_PostUrl"].ToString();
                    chkCA_IsEncode.Checked = Utils.ParseBool(dr["CA_IsEncode"].ToString());
                    txtCA_NeedParam.Text = dr["CA_NeedParam"].ToString();
                    txtCA_RealParam.Text = dr["CA_RealParam"].ToString();

                    if (!string.IsNullOrEmpty(dr["CA_PostUrl"].ToString()))
                    {
                        chkCAIsPostUrl.Checked = true;
                    }
                }
            }
            else
            {
                jsMessage += "alert({msg:\"数据加载失败，请确认当前记录是否已删除。\",title:\"操作提示\"});";
            }
        }
        #endregion

        #region 添加/更新
        protected void Save(object sender, EventArgs e)
        {
            AllPower.Model.Collection.Rule mRule;
            string tranType;                        // 操作类型
            string msg;                             // 操作结果
            string linkURL;

            mRule = new AllPower.Model.Collection.Rule();
            linkURL = "RuleList.aspx?ID=" + TaskID + "&page=" + PageIndex;
            tranType ="NEW";

            if (this.Action.ToLower() == "edit")     // 添加操作
            {
                mRule.ID = this.ID;
                tranType = "EDIT";
            }
            else
            {
                mRule.CollectionTaskID = TaskID;
            }

            mRule.Name = txtName.Text;
            mRule.RuleType = Utils.ParseInt(ddlRuleType.SelectedValue,0);
            mRule.IsSA = chkIsSA.Checked;
            mRule.IsCA = chkIsCA.Checked;

            if (chkIsSA.Checked)    // 获取分页地址
            {
                mRule.SA_StartTags = txtSA_StartTags.Text;
                mRule.SA_EndTags = txtSA_EndTags.Text;
                mRule.SA_IncludeContent = txtSA_IncludeContent.Text;
                mRule.SA_NotIncludeContent = txtSA_NotIncludeContent.Text;
                mRule.SA_ParseType = Utils.ParseInt(ddlSA_ParseType.SelectedValue,0);

                if (chkIsPostUrl.Checked)   // 启用Post地址
                {
                    mRule.SA_PostUrl = txtSA_PostUrl.Text;
                }
                mRule.SA_IsEncode = chkSA_IsEncode.Checked;
                mRule.SA_GetRange = Utils.ParseInt(ddlSA_GetRange.SelectedValue,0);
                mRule.SA_IsJoinContent = chkSA_IsJoinContent.Checked;
                mRule.SA_MaxSplitCount = Utils.ParseInt(txtSA_MaxSplitCount.Text, 0);
                mRule.SA_JoinChar = txtSA_JoinChar.Text;
                mRule.SA_NeedParam = txtSA_NeedParam.Text;
                mRule.SA_RealParam = txtSA_RealParam.Text;
                mRule.SA_OtherNeedParam = txtSA_OtherNeedParam.Text;
                mRule.SA_OtherRealParam = txtSA_OtherRealParam.Text;
            }

            if (chkIsCA.Checked)    // 获取下层地址
            {
                mRule.CA_StartTags = txtCA_StartTags.Text;
                mRule.CA_EndTags = txtCA_EndTags.Text;
                mRule.CA_IncludeContent = txtCA_IncludeContent.Text;
                mRule.CA_NotIncludeContent = txtCA_NotIncludeContent.Text;
                mRule.CA_ParseType = Utils.ParseInt(ddlCA_ParseType.SelectedValue, 0);

                if (chkCAIsPostUrl.Checked)     // 启用Post地址
                {
                    mRule.CA_PostUrl = txtCA_PostUrl.Text;
                }
                mRule.CA_IsEncode = chkCA_IsEncode.Checked;
                mRule.CA_NeedParam = txtCA_NeedParam.Text;
                mRule.CA_RealParam = txtCA_RealParam.Text;
            }

            msg = rule.Save(tranType, mRule);

            if (msg == "1")
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alert({msg:\"恭喜您，更新成功！\",title:\"操作提示\"});";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，添加成功，是否继续添加？\")){location.href=\""+ linkURL +"\";}";
                }
            }
            else
            {
                jsMessage += "alert({msg:'对不起，操作失败，请重试。',title:'操作提示'});";
            }
        }
        #endregion
    }
}
