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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月19日    功能描述： HttpHeader配置
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class HttpHeaderConfigEdit : AdminPage
    {
        #region 变量成员
        private AllPower.BLL.Collection.HttpHeaderConfig httpHeaderConfig;
        protected string jsMessage = string.Empty;                   // 操作提示
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            httpHeaderConfig = new AllPower.BLL.Collection.HttpHeaderConfig();

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            if (Action.ToLower() == "edit")     // 编辑
            {
                btnSave.Text = "修改";
                if (!string.IsNullOrEmpty(ID))
                {
                    AllPower.Model.SelectParams selParam;
                    DataTable dt;

                    selParam = new AllPower.Model.SelectParams();
                    selParam.S1 = ID;
                    dt = httpHeaderConfig.GetList("ONE", selParam);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtName.Text = dt.Rows[0]["Name"].ToString().Replace("{$", "").Replace("$}", "");
                        txtRemark.Text = dt.Rows[0]["Remark"].ToString();
                        txtOrders.Text = dt.Rows[0]["Orders"].ToString();
                    }
                    else
                    {
                        jsMessage = "alertClose({title:'操作提示',msg:'数据读取过程中出现错误。'},function(){parent.Closed();});";
                    }
                }
                else
                {
                    jsMessage = "alertClose({title:'操作提示',msg:'参数传递错误。'},function(){parent.Closed();});";
                }
            }
        }
        #endregion

        #region 保存/更新
        protected void Save(object sender, EventArgs e)
        {
            AllPower.Model.Collection.HttpHeaderConfig mHttpHeaderConfig;
            string tranType;        // 操作类型
            string linkURL;         // 操作返回地址
            string msg;             // 操作结果

            mHttpHeaderConfig = new AllPower.Model.Collection.HttpHeaderConfig();
            mHttpHeaderConfig.Name = txtName.Text.Trim();
            mHttpHeaderConfig.Remark = txtRemark.Text.Trim();
            mHttpHeaderConfig.Orders = Utils.ParseInt(txtOrders.Text.Trim(), 0);
            tranType = "NEW";
            linkURL = "HttpHeaderConfigList.aspx";

            if (Action.ToLower() == "edit")
            {
                tranType = "EDIT";
                mHttpHeaderConfig.ID = ID;
            }
            else
            {
                mHttpHeaderConfig.AddMan = UserNo;
                mHttpHeaderConfig.IsDel = false;
                mHttpHeaderConfig.IsEnable = true;
            }

            msg = httpHeaderConfig.Save(tranType, mHttpHeaderConfig);

            if (msg == "1")
            {
                if (Action.ToLower() == "edit")
                {
                    jsMessage += "if(window.confirm(\"恭喜您，更新成功，是否返回！\")){location.href=\"" + linkURL + "\";};";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，添加成功,是否继续添加！\")){location.href=\"" + linkURL + "\";};";
                }
            }
            else
            {
                if (Action.ToLower() == "edit")
                {
                        jsMessage += "if(!window.confirm(\"对不起，更新失败,是否重试。\")){location.href=\"" + linkURL + "\";};";
                }
                else
                {
                    jsMessage += "alert({title:'操作提示',msg:'对不起，添加失败，请重试。'});";
                }
            }
        }
        #endregion
    }
}
