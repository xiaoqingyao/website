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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月20日    功能描述： 采集地址
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class Address : AdminPage
    {
        #region 变量成员
        private BLL.Collection.Task task;
        protected string jsMessage;
        private string _pageIndex;
        #endregion

        #region 属性
        /// <summary>
        /// 任务所在任务列表中的分页
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
            task = new AllPower.BLL.Collection.Task();
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataTable dt;

            dt = task.GetLabelVar();

            if (dt != null)     // 绑定标签变量
            {
                ddlLabelVar.DataTextField = "Name";
                ddlLabelVar.DataValueField = "ID";
                ddlLabelVar.DataSource = dt;
                ddlLabelVar.DataBind();
            }

            ddLabelVarValueList.InnerHtml = task.GetLabelVarValue(ddlLabelVar.SelectedValue).ToString(); // 绑定标签变量值

            dt = task.GetCollectionAddress(this.ID);

            if (dt != null)
            {
                lstbCollectionAddress.DataTextField = "URL";
                lstbCollectionAddress.DataValueField = "URL";
                lstbCollectionAddress.DataSource = dt;
                lstbCollectionAddress.DataBind();
            }
        }
        #endregion

        #region 保存/更新
        protected void Save(object sender, EventArgs e)
        {
            string linkURL;         // 操作返回地址
            int msg;                // 操作结果

            msg = task.Save(this.ID, "lstbCollectionAddress", chkIsUrlEncode.Checked);
            linkURL = "TaskList.aspx?page=" + PageIndex;

            if (msg  > 0)   // 成功
            {
                jsMessage += "if(window.confirm(\"恭喜您，保存成功，是否返回！\")){location.href=\"" + linkURL + "\";};";
            }
            else   // 失败
            {
                jsMessage += "if(!window.confirm(\"对不起，保存失败,是否重试。\")){location.href=\"" + linkURL + "\";};";
            }

            PageInit();
        }
        #endregion
    }
}
