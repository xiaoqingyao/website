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
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月1日
    功能描述： 列表列设置
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace KingTop.WEB.SysAdmin.Model
{
    public partial class ModelLisConfig : AdminPage
    {
        #region 变量成员
        protected   StringBuilder[] sbListInfo;              //设置界面代码
        string modelID;                                      // 要设置的模型主键
        protected string jsMessage;                          // 操作提示信息 
        protected string backUrl;   // 操作后返回页面        protected BLL.Content.ModelListConfig modelListConfig;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isValidate;

            modelID = Request.QueryString["ID"];
            backUrl = "ModelManageList.apsx?NodeCode=" + NodeCode + "&IsSub=" + Request.QueryString["IsSub"] ;
            isValidate = IsHaveRightByOperCode("Edit");

            if (!string.IsNullOrEmpty(modelID))
            {
                modelListConfig = new KingTop.BLL.Content.ModelListConfig(modelID);
            }
            else {
                jsMessage = "alert({title:'参数传递错误',msg:'操作提示'})";;
            }
            if (!IsPostBack)
            {
                sbListInfo = modelListConfig.ListInfo();
            }

            if(!string.IsNullOrEmpty(Request.QueryString["RefUrl"]))     // 返回地址
            {
                this.backUrl = Request.QueryString["RefUrl"] + "?NodeCode=" + NodeCode + "&IsSub=" + Request.QueryString["IsSub"];

                if (!string.IsNullOrEmpty(Request.QueryString["TableName"]))
                {
                    this.backUrl += "&ModelID=" + this.ID + "&TableName=" + Request.QueryString["TableName"];
                }
            }
            
            if (!isValidate)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑模型的权限，请与管理员联系。'},function(){location.href='"+ this.backUrl +"';});";
            }
        }
        #endregion
        
        #region 保存设置
        protected void Save(object sender,CommandEventArgs e)
        {
            bool isValidate;
            string msg;

            isValidate = IsHaveRightByOperCode("Edit");
            msg = string.Empty;

            if (!isValidate)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑模型的权限，请与管理员联系。'},function(){location.href='" + this.backUrl + "';});";
            }

            if (!string.IsNullOrEmpty(modelID) && isValidate)
            {
                msg = modelListConfig.Save(modelID);
                sbListInfo = modelListConfig.ListInfo();

                if (msg == "1")
                {
                    WriteLog("模型 " + Request.QueryString["ModelName"] + "(" + this.ID + ") 参数设置成功。", null, 2);
                }
                else
                {
                    WriteLog("模型 " + Request.QueryString["ModelName"] + "(" + this.ID + ") 参数设置失败。", msg, 3);
                }
            }
        }
        #endregion
    }
}
