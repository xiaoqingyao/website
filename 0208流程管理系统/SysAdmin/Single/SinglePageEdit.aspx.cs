using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      严辉
    创建时间： 2010年5月12日
    功能描述： 友情链接分类 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class SinglePageEdit : AdminPage
    {
        AllPower.BLL.Single.SinglePage bllSinglePage = new AllPower.BLL.Single.SinglePage();
        Model.Single.SinglePage modelSinglePage = new AllPower.Model.Single.SinglePage();

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        #region 数据初始化
        private void PageInit()
        {
            DataTable dt = bllSinglePage.GetList("ONE", Utils.getTwoParams(SiteID.ToString(), NodeCode));
            if (dt != null && dt.Rows.Count > 0)
            {
                Editor1.Content = dt.Rows[0][0].ToString();
            }

        }     
        #endregion

        #region 添加/修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string logTitle = hidLogTitle.Value;

            modelSinglePage.ID = Guid.NewGuid().ToString();
            modelSinglePage.Content = Editor1.Content;
            modelSinglePage.AddMan = AddMan;
            modelSinglePage.SiteID = SiteID;
            modelSinglePage.NodeCode = NodeCode;

            //添加/修改操作
            string strMessage = bllSinglePage.Save(Action, modelSinglePage);
            int result = Utils.ParseInt(strMessage, 0);

            switch (result)
            {
                case 1:     //成功
                    WriteLog(GetLogValue(logTitle, Action, "单页面内容管理", true), "", 2);
                    Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddSucess") + "',title:'"
                                                           + Utils.GetResourcesValue("Common", "TipMessage") + "'})");
                    break;

                case 0:     //失败
                    WriteLog(GetLogValue(logTitle, Action, "单页面内容管理", false), strMessage, 3);
                    Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddError") + "',title:'"
                                                            + Utils.GetResourcesValue("Common", "TipMessage") + "'})");
                    break;
                
            }

        }
        #endregion
    }
}
