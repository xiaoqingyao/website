#region 程序集引用
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.BLL.Content;
using System.Data;
using System.Text;
using System.Collections;

using KingTop.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年4月26日
    功能描述： 解析后的浏览页面数据显示
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class ControlManageView :AdminPage
    {
        #region 变量成员
        protected Hashtable hsFieldValue;                        // 字段初始值
        protected BLL.Content.ControlManageView ctrManageView;   // 业务操作对象
        #endregion

        #region  Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.ID))
            {
                ctrManageView = new KingTop.BLL.Content.ControlManageView(hdnTableName.Value, hdnModelID.Value);

                this.hsFieldValue = ctrManageView.FillField();
            }
            else
            {
                this.hsFieldValue = new Hashtable();
            }
        }
        #endregion
    }
}
