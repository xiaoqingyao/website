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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月23日    功能描述： 采集字段结果替换配置
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class FieldReplaceEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.FieldReplace fieldReplace;
        protected string jsMessage;             // 操作提示
        private string _taskID;                 // 所属任务ID
        private string _fieldID;
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
        /// 所属字段ID
        /// </summary>
        public string FieldID
        {
            get
            {
                if (string.IsNullOrEmpty(this._fieldID))
                {
                    this._fieldID = Request.QueryString["FieldID"];
                }

                return this._fieldID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            fieldReplace = new AllPower.BLL.Collection.FieldReplace();

            if (string.IsNullOrEmpty(TaskID))
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='FieldReplaceList.aspx?ID=" + TaskID + "';})";

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
                        jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='FieldReplaceList.aspx?ID=" + TaskID + "';})";
                    }
                }
            }
        }
        #endregion

        #region 初始加载
        protected void PageInit()
        {
            DataTable dt;

            dt = fieldReplace.GetByID(this.ID);
            btnSave.Text = "修 改";

            if (dt != null && dt.Rows.Count > 0)            // 记录加载成功
            {
                DataRow dr;

                dr = dt.Rows[0];

                txtNewContent.Text = dr["NewContent"].ToString();
                txtOldContent.Text = dr["OldContent"].ToString();
                chkIsObtainOldVlaue.Checked = Utils.ParseBool(dr["IsObtainOldVlaue"].ToString());
                chkIsRegex.Checked = Utils.ParseBool(dr["IsRegex"].ToString());
                chkIsRepeat.Checked = Utils.ParseBool(dr["IsRepeat"].ToString());
                chkIsReplaceFirst.Checked = Utils.ParseBool(dr["IsReplaceFirst"].ToString());
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
            AllPower.Model.Collection.FieldReplace mFieldReplace;
            string tranType;                        // 操作类型
            string msg;                             // 操作结果
            string linkURL;

            mFieldReplace = new AllPower.Model.Collection.FieldReplace();
            linkURL = "FieldReplaceList.aspx?ID=" + FieldID + "&TaskID=" + TaskID ;
            tranType = "NEW";

            if (this.Action.ToLower() == "edit")     // 添加操作
            {
                mFieldReplace.ID = this.ID;
                tranType = "EDIT";
            }
            else
            {
                mFieldReplace.CollectionFieldID = FieldID;
            }

            mFieldReplace.OldContent = txtOldContent.Text;
            mFieldReplace.NewContent = txtNewContent.Text;
            mFieldReplace.IsObtainOldVlaue = chkIsObtainOldVlaue.Checked;
            mFieldReplace.IsRegex = chkIsRegex.Checked;
            mFieldReplace.IsRepeat = chkIsRepeat.Checked;
            mFieldReplace.IsReplaceFirst = chkIsReplaceFirst.Checked;

            msg = fieldReplace.Save(tranType, mFieldReplace);

            if (msg == "1")
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alert({msg:\"恭喜您，更新成功！\",title:\"操作提示\"});";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，添加成功，是否继续添加？\")){location.href=\"" + linkURL + "\";}";
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
