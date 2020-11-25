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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月14日    功能描述： 采集标签变量
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class LabelVarEdit : AdminPage
    {
        #region 变量成员
        private AllPower.BLL.Collection.LabelVar labelVar;
        protected string jsMessage = string.Empty;                   // 操作提示
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            labelVar = new AllPower.BLL.Collection.LabelVar();

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
                    dt = labelVar.GetList("ONE", selParam);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtName.Text = dt.Rows[0]["Name"].ToString().Replace("{$","").Replace("$}","");
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
            AllPower.Model.Collection.LabelVar mLabelVar;
            string tranType;
            string msg;

            mLabelVar = new AllPower.Model.Collection.LabelVar();
            mLabelVar.Name = "{$" + txtName.Text.Trim() + "$}";
            mLabelVar.Remark = txtRemark.Text.Trim();
            mLabelVar.Orders = Utils.ParseInt(txtOrders.Text.Trim(), 0);
            tranType = "NEW";

            if (Action.ToLower() == "edit")
            {
                tranType = "EDIT";
                mLabelVar.ID = ID;
            }
            else
            {
                mLabelVar.AddMan = UserNo;
                mLabelVar.IsDel = false;
                mLabelVar.IsEnable = true;
            }

           msg = labelVar.Save(tranType, mLabelVar);

           if (msg == "1")  // 成功
           {
               jsMessage = "alertClose({title:'操作提示',msg:'恭喜您，操作成功！'},function(){parent.location=parent.location;parent.Closed();});";
           }
           else  // 失败
           {
               jsMessage = "alertClose({title:'操作提示',msg:'对不起，操作失败。'},function(){parent.Closed();});";
           }
        }
        #endregion
    }
}
