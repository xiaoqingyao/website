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

using AllPower.Common;
using AllPower.Model;
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年6月13日    功能描述： 推荐区域设置
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Model
{
    public partial class RecommendAreaSet :AdminPage
    {
        #region  私有变量
        private BLL.Content.RecommendAreaSet recommandAreaSet;
        protected string jsMessage = string.Empty;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Edit");
            recommandAreaSet = new AllPower.BLL.Content.RecommendAreaSet();

            if (!IsPostBack)
            {
                PageInit();
            }

            if (!isValidate)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑模型的权限，请与管理员联系。'},function(){parent.Closed();});";
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataSet ds;

            ds = recommandAreaSet.GetRecommendArea();
            ds.Relations.Add("SysWebSite_RecommendArea", ds.Tables[0].Columns["SiteID"], ds.Tables[1].Columns["SiteID"]);
            rptSite.DataSource = ds;
            rptSite.DataBind();

            if (!string.IsNullOrEmpty(ID))
            {
                object originalValue;

                originalValue = recommandAreaSet.GetRecommendAreaByID(ID);
                if (originalValue != null)
                {
                    hdnOriginalValue.Value = originalValue.ToString();
                }
            }
        }
        #endregion

        #region 更新/添加
        protected void Save(object sender, EventArgs e)
        {
            int result;  // 处理结果
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Edit");
            if (isValidate)
            {
                if (!string.IsNullOrEmpty(ID))
                {
                    result = recommandAreaSet.Edit(ID);
                    PageInit();

                    if (result > 0)
                    {
                        jsMessage = "alertClose({title:'操作提示',msg:'恭喜您，设置成功！'},function(){parent.Closed();});";
                        WriteLog("设置模型 " + Request.QueryString["ModelName"] + "(" + this.ID + ") 的推荐区域成功。", null, 2);
                    }
                }
                else
                {
                    jsMessage = "alertClose({title:'操作提示',msg:'请指定要处理的模型。'},function(){parent.Closed();});";
                    WriteLog("设置模型 " + Request.QueryString["ModelName"] + "(" + this.ID + ") 的推荐区域失败。", "请指定要处理的模型", 3);
                }
            }
            else
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑模型的权限，请与管理员联系。'},function(){parent.Closed();});";
            }
        }
        #endregion
    }
}
