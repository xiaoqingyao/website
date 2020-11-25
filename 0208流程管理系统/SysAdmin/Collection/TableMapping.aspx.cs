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
using AllPower.BLL.Content;
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月23日    功能描述： 发布任务 -- 字段映射
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class TabelMapping : AdminPage
    {
        #region 变量成员
        protected BLL.Collection.TableMapping tbMapping;    // 业务操作类
        private string _collectionTaskID;                   // 采集任务ID
        private string _publishTaskID;                      // 发布任务ID
        protected string jsMessage;
        #endregion

        #region 属性
        /// <summary>
        /// 采集任务ID
        /// </summary>
        public string CollectionTaskID
        {
            get
            {
                if (string.IsNullOrEmpty(this._collectionTaskID))
                {
                    this._collectionTaskID = Request.QueryString["TaskID"];
                }

                return this._collectionTaskID;
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
                    this._publishTaskID = Request.QueryString["PublishTaskID"].ToString();
                }

                return this._publishTaskID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> lstSource;

            tbMapping = new AllPower.BLL.Collection.TableMapping(PublishTaskID);
            lstSource = tbMapping.GetSourceTable(CollectionTaskID);

            if (lstSource != null )
            {
                rptMapping.DataSource = lstSource;
                rptMapping.DataBind();
            }
        }
        #endregion

        #region 保存配置
        protected void Save(object sender, EventArgs e)
        {
            int effectRow;

            effectRow = tbMapping.Save(PublishTaskID);

            if (effectRow > 0)
            {
                jsMessage += "alertClose({title:\"操作提示\",msg:\"恭喜您,配置成功！\"},function(){location.href='PublishTaskList.aspx';})";
            }
            else
            {
                jsMessage += "alert({title:\"操作提示\",msg:\"对不起,操作失败！\"})";
            }
        }
        #endregion
    }
}
