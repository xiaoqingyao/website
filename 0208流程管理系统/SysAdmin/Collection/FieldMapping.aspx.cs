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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月24日    功能描述： 采集发布 -- 字段映射
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class FieldMapping : AdminPage
    {
        #region 变量成员
        protected BLL.Collection.TableMapping tbMapping;    // 业务操作对象
        private string _sourceTableName;                    // 源表名
        private string _targetTableName;                    // 源表名
        private string _publishTaskID;                      // 发布任务ID 
        private string _collectionTaskID;                   // 采集任务ID 
        #endregion

        #region 属性
        /// <summary>
        /// 源表名
        /// </summary>
        public string SourceTableName
        {
            get
            {
                if (string.IsNullOrEmpty(this._sourceTableName))
                {
                    this._sourceTableName = Request.QueryString["SourceTableName"];
                }

                return this._sourceTableName;
            }
        }
        /// <summary>
        /// 目标表名
        /// </summary>
        public string TargetTableName
        {
            get
            {
                if (string.IsNullOrEmpty(this._targetTableName))
                {
                    this._targetTableName = Request.QueryString["TargetTableName"];
                }

                return this._targetTableName;
            }
        }

        /// <summary>
        /// 发布任务ID 
        /// </summary>
       public string PublishTaskID
        {
            get
            {
                if (string.IsNullOrEmpty(this._publishTaskID))
                {
                    this._publishTaskID = Request.QueryString["PublishTaskID"];
                }

                return this._publishTaskID;
            }
        }

        /// <summary>
        /// 采集任务ID 
        /// </summary>
       public string CollectionTaskID
        {
            get
            {
                if (string.IsNullOrEmpty(this._collectionTaskID))
                {
                    this._collectionTaskID = Request.QueryString["CollectionTaskID"];
                }

                return this._collectionTaskID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtTargetField;

            tbMapping = new AllPower.BLL.Collection.TableMapping(PublishTaskID);
            dtTargetField = tbMapping.GetTargetTableField(TargetTableName);
            tbMapping.SetSourceTableFieldSelect(CollectionTaskID, SourceTableName);
            hdnSiteID.Value = this.SiteID.ToString();
            hdnUser.Value = this.UserNo;

            if (dtTargetField != null)
            {
                rptMapping.DataSource = dtTargetField;
                rptMapping.DataBind();
            }
        }
        #endregion
    }
} 
