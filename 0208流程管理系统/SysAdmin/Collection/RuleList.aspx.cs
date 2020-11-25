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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月20日    功能描述： 任务采集规则
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class RuleList : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;    // 提示信息
        protected  AllPower.BLL.Collection.Rule rule;
        private string _pageIndex;
        #endregion

        #region 属性
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
            if (!string.IsNullOrEmpty(this.ID))
            {

                PageInit();
            }
            else
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='TaskList.aspx';})";
                }
            }
        }

        private void PageInit()
        {
            DataTable dt;
            dt = rule.GetList(this.ID);

            if (dt != null)
            {
                rptRule.DataSource = dt;
                rptRule.DataBind();
            }
        }
        #endregion

        #region 删除单条记录
        public void Rule_Del(object sender, CommandEventArgs e)
        {
            string returnMsg;   // 事务返回信息

            returnMsg = "";
            rule = new AllPower.BLL.Collection.Rule();
            returnMsg = rule.CollectionRuleSet(e.CommandName, null, e.CommandArgument.ToString());
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

                returnMsg = rule.CollectionRuleSet(tranType, isEnable.ToString(), arrArg[0]);

                PageInit();
            }
        }
        #endregion
    }
}
