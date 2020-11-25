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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月23日    功能描述： 任务采字段结果替换
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class FieldReplaceList : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;    // 提示信息
        protected AllPower.BLL.Collection.FieldReplace fieldReplace;
        private string _taskID;                      // 所属任务主键
        #endregion

        #region 属性
        /// <summary>
        /// 所属任务主键
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
            fieldReplace = new AllPower.BLL.Collection.FieldReplace();
            if (!string.IsNullOrEmpty(this.ID))
            {
                PageInit();
            }
            else
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='FieldList.aspx?ID="+ TaskID +"';})";
                }
            }
        }

        private void PageInit()
        {
            DataTable dt;
            dt = fieldReplace.GetList(this.ID);

            if (dt != null)
            {
                rptFieldReplace.DataSource = dt;
                rptFieldReplace.DataBind();
            }
        }
        #endregion

        #region 删除单条记录
        public void FieldReplace_Del(object sender, CommandEventArgs e)
        {
            string returnMsg;   // 事务返回信息

            returnMsg = "";
            fieldReplace = new AllPower.BLL.Collection.FieldReplace();
            returnMsg = fieldReplace.CollectionFieldReplaceSet(e.CommandName, null, e.CommandArgument.ToString());
            PageInit();
        }
        #endregion

        #region 更新
        protected void SetIsEnable(object sender, CommandEventArgs e)
        {
            string tranType;
            string returnMsg;
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

                returnMsg = fieldReplace.CollectionFieldReplaceSet(tranType, isEnable.ToString(), arrArg[0]);

                PageInit();
            }
        }
        #endregion
    }
}
