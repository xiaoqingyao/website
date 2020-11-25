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
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月23日
    功能描述： 专题信息推荐
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SpecialInfoRecommend : AdminPage
    {
        #region 变量成员
        private string _specialID;                      // 专题ID 
        protected string jsMessage;                     // 操作提示JS
        protected string jsInitRA = "{\"init\":null}";               // 加载初始推荐区域
        BLL.SysManage.SpecialInfoRecommend sRecommend;
        #endregion

        #region 属性成员
        /// <summary>
        /// 专题ID
        /// </summary>
        public string SpecialID
        {
            get
            {
                if (string.IsNullOrEmpty(this._specialID))
                {
                    this._specialID = Utils.ReqUrlParameter("SpecialID");
                }

                return this._specialID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            sRecommend = new AllPower.BLL.SysManage.SpecialInfoRecommend();
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataSet ds;

            ds = sRecommend.GetRAInfo(SpecialID);
            ds.Relations.Add("RA_RAP", ds.Tables[0].Columns["ID"] ,ds.Tables[1].Columns["RecommendAreaID"]);

            rptRecommendArea.DataSource = ds;
            rptRecommendArea.DataBind();

            if (!string.IsNullOrEmpty(this.ID))
            {
             jsInitRA = sRecommend.GetRAInfoByID(this.ID).ToString();
            }
        }
        #endregion

        #region 保存
        public void Save(object sender, EventArgs e)
        {
            int effectRow;          // 受影响行数

            effectRow = sRecommend.Save(rptRecommendArea);

            if (!string.IsNullOrEmpty(this.ID)) // 单条推荐
            {
                if (effectRow > 0)  // 成功
                {
                    jsMessage = "if(window.confirm(\"恭喜您，推荐成功,是否关闭当前窗口！\")){parent.Closed();}";
                }
                else  // 失败
                {
                    jsMessage = "alert({msg:'对不起推荐失败，请重试。',title:'操作提示'});";
                }
            }
            else  // 批量
            {
                if (effectRow > 0)  // 成功
                {
                    jsMessage = "alertClose({title:'操作结果',msg:'恭喜您，推荐成功！'},function(){parent.Closed();});";
                }
                else  // 失败
                {
                    jsMessage = "alertClose({title:'操作结果',msg:'对不起，操作失败，请重试。'},function(){parent.Closed();});";
                }
            }
        }
        #endregion

        #region 为CheckBoxList添加属性以解决js不能调用Value属性
        protected void rptRecommendArea_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach (ListItem item in ((CheckBoxList)e.Item.FindControl("chklRA")).Items)
            {
                item.Attributes.Add("RAP", item.Value);
            }

        }
        #endregion
    }
}
