#region 引用程序集using System;
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
using KingTop.Common;
using KingTop.BLL.Content;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月30日    功能描述： 公用字段分组
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class CommonFieldGroupList : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            PageInit();
            SetRight(this.Page, rptCommonFieldGroup);
        }

        private void PageInit()
        {
            DataTable dt;
            KingTop.BLL.Content.ModelcommonFieldGroup commonFieldGroup;

            commonFieldGroup = new ModelcommonFieldGroup();
            dt = commonFieldGroup.GetList("ALL", new KingTop.Model.SelectParams());

            rptCommonFieldGroup.DataSource = dt;
            rptCommonFieldGroup.DataBind();
            
        }
        #endregion

        #region 删除单条记录
        public void CommonFieldGroup_Del(object sender, CommandEventArgs e)
        {

            string id;
            string tranType;    // 事务类型
            string returnMsg;   // 事务返回信息
            KingTop.BLL.Content.ModelcommonFieldGroup commonFieldGroup;
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Delete");

            if (IsPostBack && isValidate)
            {
                id = e.CommandArgument.ToString();

                if (e.CommandName == "del")
                {
                    tranType = "DELONE";
                }
                else if (string.Equals(e.CommandName, "deldp"))
                {
                    tranType = "DELDP";
                }
                else if (string.Equals(e.CommandName, "revert"))
                {
                    tranType = "REVERT";
                }
                else
                {
                    tranType = "DELONE";
                }

                returnMsg = "";
                commonFieldGroup = new KingTop.BLL.Content.ModelcommonFieldGroup();
                returnMsg = commonFieldGroup.ModelcommonFieldGroupSet(tranType, "1", id);

                if (returnMsg == "1")
                {
                    WriteLog("删除公用字段分组 " + LogTitle + "(" + id + ") 成功", null, 2);
                }
                else
                {
                    WriteLog("删除公用字段分组 " + LogTitle + "(" + id + ") 失败", returnMsg, 2);
                }

                PageInit();
            }
            else
            {
                jsMessage = "alert({msg:\"对不起，您没有 删除 操作权限，请与管理员联系！\",title:\"操作提示\"});";
            }
        }
        #endregion
    }
}
