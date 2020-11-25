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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月16日    功能描述： 采集标签变量值设置
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class LabelVarValueEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.LabelVar labelVar;   // 业务操作对象
        protected string jsMessage;                 // 操作提示信息
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            labelVar = new AllPower.BLL.Collection.LabelVar();

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(this.ID))
                {
                    PageInit();
                }
                else
                {
                    jsMessage = "alertClose({title:'操作提示',msg:'参数传递错误。'},function(){parent.Closed();});";
                }
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataTable dt;

            dt = labelVar.GetLabelVarValue(this.ID);

            if (dt != null)
            {
                lstbValueList.DataTextField = "VarValue";
                lstbValueList.DataValueField = "VarValue";
                lstbValueList.DataSource = dt;
                lstbValueList.DataBind();
            }
            else
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，数据绑定失败。'},function(){parent.Closed();});";
            }
        }
        #endregion

        #region 添加/更新
        protected void Save(object sender, EventArgs e)
        {
            int result;     // 处理结果（影响行数）
            
            if (!string.IsNullOrEmpty(this.ID))
            {
               result = labelVar.LabelVarValueEdit(hdnLabelVarValue, this.ID);
            }
            else
            {
                result = -100;
            }

            if (result > 0)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'恭喜您，标签变量值设置成功！'},function(){parent.Closed();});";
            }
            else if (result == -100)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'参数传递错误。'},function(){parent.Closed();});";
            }
            else
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，设置失败，请重试。'},function(){parent.Closed();});";
            }
        }
        #endregion
    }
}
