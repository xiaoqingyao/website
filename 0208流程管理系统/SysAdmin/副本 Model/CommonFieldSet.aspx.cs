#region 引用程序集using System;
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

using KingTop.Common;
using KingTop.Model;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月31日    功能描述： 公用字段设置
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class CommonFieldSet : AdminPage
    {
        #region  私有变量
        private BLL.Content.ComomonFieldSet commonFieldSet;
        protected string jsMessage = "\"\"";
        protected string jsMessageParam = "\"\"";
        private string _modelID;
        private string _tableName;
        #endregion

        #region 属性
        /// <summary>
        /// 所属模型
        /// </summary>
        public string ModelID
        {
            get
            {
                if (string.IsNullOrEmpty(this._modelID))
                {
                    this._modelID = Request.QueryString["ModelID"];
                }

                return this._modelID;
            }
        }

        /// <summary>
        /// 表名
        /// </summary>
        public string TableName
        {
            get
            {
                if (string.IsNullOrEmpty(this._tableName))
                {
                    this._tableName = Request.QueryString["TableName"];
                }

                return this._tableName;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            commonFieldSet = new KingTop.BLL.Content.ComomonFieldSet();

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 初始加载
        /// <summary>
        /// 初始加载
        /// </summary>
        private void PageInit()
        {
            DataSet ds;  // 公用字段相关记录 [0] 分组  [1] 默认分组  [2] 其它分组

            ds = commonFieldSet.GetCommonFieldRelational();
            ds.Relations.Add("Group_Field", ds.Tables[0].Columns["ID"], ds.Tables[2].Columns["CommonFieldGroupID"]);
            rptDefaultField.DataSource = ds.Tables[1];
            rptDefaultField.DataBind();
            rptGroup.DataSource = ds;
            rptGroup.DataBind();
        }
        #endregion

        #region 更新/添加
        protected void Save(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ModelID))
            {
                jsMessageParam = commonFieldSet.Save(ModelID);
            }
            else
            {
                jsMessage = "参数传递有误。";
            }
        }
        #endregion
    }
}
