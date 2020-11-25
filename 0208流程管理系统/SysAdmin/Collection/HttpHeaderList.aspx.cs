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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月19日    功能描述： Http请求头配置列表
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class HttpHeaderList : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;    // 提示信息
        AllPower.BLL.Collection.HttpHeader httpHeader;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            httpHeader = new AllPower.BLL.Collection.HttpHeader();
            PageInit();
        }

        private void PageInit()
        {
            DataTable dt;
            AllPower.Model.SelectParams selParam;

            selParam = new AllPower.Model.SelectParams();
            selParam.S1 = this.ID;
            dt = httpHeader.GetList("ALL", selParam);

            if (dt != null)
            {
                rptHttpHeader.DataSource = dt;
                rptHttpHeader.DataBind();
            }
        }
        #endregion

        #region 删除单条记录
        public void HttpHeader_Del(object sender, CommandEventArgs e)
        {
            string returnMsg;   // 事务返回信息

            returnMsg = "";
            httpHeader = new AllPower.BLL.Collection.HttpHeader();
            returnMsg = httpHeader.CollectionHttpHeaderSet(e.CommandName, null, e.CommandArgument.ToString());
            PageInit();
        }
        #endregion
    }
}
