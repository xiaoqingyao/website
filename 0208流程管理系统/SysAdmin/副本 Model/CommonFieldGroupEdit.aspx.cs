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

using KingTop.Common;
using KingTop.Model;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月30日    功能描述： 公用字段分组编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace KingTop.WEB.SysAdmin.Model
{
    public partial class CommonFieldGroupEdit : AdminPage
    {
        #region 变量成员
        private KingTop.BLL.Content.ModelcommonFieldGroup commonFieldGroup;
        protected string jsMessage;         // js处理提示信息
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            commonFieldGroup = new KingTop.BLL.Content.ModelcommonFieldGroup();

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 更新
        protected void CommonFieldGroup_Edit(object sender, EventArgs e)
        {
            KingTop.Model.Content.ModelcommonFieldGroup mCommonFieldGroup;
            string tranType;    // 操作类型
            string effectRow;   // 更新结果
            string listUrl;     // 返回路径

            tranType = "NEW";
            listUrl = "CommonFieldGroupList.aspx";
            mCommonFieldGroup = new KingTop.Model.Content.ModelcommonFieldGroup();
            mCommonFieldGroup.Name = txtName.Text.Trim();
            mCommonFieldGroup.Orders = Utils.ParseInt(txtOrders.Text.Trim(), 200);
            mCommonFieldGroup.AddMan = UserNo;

            if (string.Equals(Action.ToLower(), "edit")) // 更新
            {
                tranType = "EDIT";
                mCommonFieldGroup.ID = ID;
            }
            else 
            {
                mCommonFieldGroup.ID = Guid.NewGuid().ToString();
            }

            effectRow = commonFieldGroup.Save(tranType, mCommonFieldGroup);    

           if (string.Equals(Action.ToLower(), "edit")) // 更新
           {
               if (string.Equals(effectRow,"1")) 
               {
                   jsMessage = "type=1;title=\"" + mCommonFieldGroup.Name + " \";id=\"" + mCommonFieldGroup.ID + "\"";
                   WriteLog("公用字段分组" + mCommonFieldGroup.Name +" 更新成功。", null, 2);
               }
               else  // 失败
               {
                   jsMessage = "errmsg=\"对不起，更新失败。\";type=2;id=\"" + mCommonFieldGroup.ID + "\";";
                   WriteLog("公用字段分组" + mCommonFieldGroup.Name + " 更新失败。", effectRow, 3);
               }
           }
           else
           {
               if (string.Equals(effectRow, "1"))  // 添加成功
               {
                   jsMessage = "type=0;title=\"" + mCommonFieldGroup.Name + " \";id=\"" + mCommonFieldGroup.ID  + "\"";
                   WriteLog("添加公用字段分组" + mCommonFieldGroup.Name + " 成功。", null, 2);
               }
               else   // 失败
               {
                   jsMessage = "errmsg=\"对不起，添加失败。\";type=2;id=\"" + mCommonFieldGroup.ID + "\";";
                   WriteLog("添加公用字段分组" + mCommonFieldGroup.Name + " 失败。", effectRow, 3);
               }
           }

           PageInit();  // 重新加载数据
        }
        #endregion

        #region 加载数据
        private void PageInit()
        {
            if(string.Equals(Action.ToLower(),"edit")) // 编辑
            {
                DataTable dtCommonFieldGroup;
                SelectParams selParam;

                selParam = new SelectParams();
                selParam.S1 = ID;
                dtCommonFieldGroup = commonFieldGroup.GetList("ONE", selParam);

                btnEdit.Text = "修改";
                if (dtCommonFieldGroup != null && dtCommonFieldGroup.Rows.Count > 0)
                {
                    DataRow dr; // 当前编辑的记录

                    dr = dtCommonFieldGroup.Rows[0];
                    txtName.Text = dr["Name"].ToString();
                    txtOrders.Text = dr["Orders"].ToString();
                }
            }

        }
        #endregion
    }
}
