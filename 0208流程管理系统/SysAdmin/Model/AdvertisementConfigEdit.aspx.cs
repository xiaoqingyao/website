using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月28日
    功能描述： 广告配置
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class AdvertisementConfigEdit : AdminPage
    {
        #region 业务/操作类

        AllPower.Model.Content.AdvertisementConfig modelAdvertisementConfig;
        BLL.Content.AdvertisementConfig bllAdvertisementConfig = new AllPower.BLL.Content.AdvertisementConfig();
        #endregion

        #region 数据/页面初始化

        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        private void PageInit()
        {
            BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
            ControlUtils.DropDownDataBind(ddlReviewFlow, bllReviewFlow.GetList("ALL", Utils.getOneParams("")), "Name", "ID");
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllAdvertisementConfig.GetList("ONE", Utils.getOneParams("1"));
                if (dt != null && dt.Rows.Count > 0)
                {
                    cbIsReview.Checked = Utils.ParseBool(dt.Rows[0]["IsCheck"].ToString());
                    ddlReviewFlow.SelectedValue = dt.Rows[0]["ReviewFlowId"].ToString();
                }
                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                dt.Dispose();
            }
        }
        #endregion

        #region 操作的事件

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            StringBuilder sbLog = new StringBuilder(16);
            modelAdvertisementConfig = new AllPower.Model.Content.AdvertisementConfig();
            ModelSaveOrUpdate();
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_AdvertisementConfig");
                modelAdvertisementConfig.ID = strTableOrId[0];
                sbLog.Append("新增");
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                sbLog.Append("修改");
                modelAdvertisementConfig.ID = "1";
            }
            //用户添加/修改操作
            string strMessage = bllAdvertisementConfig.Save(Action, modelAdvertisementConfig);
            if (strMessage == "1") //操作成功
            {
                sbLog.Append("成功!");
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddSucess") + "',title:'提示信息'})");
            }
            else
            {
                sbLog.Append("失败!");
                Utils.AlertJavaScript(this, Utils.GetResourcesValue("model", "AddError"));
            }
            WriteLog("评论配置" + sbLog.ToString(), "", 2); //写日志

        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelAdvertisementConfig.IsCheck = cbIsReview.Checked;
            modelAdvertisementConfig.ReviewFlowId = ddlReviewFlow.SelectedValue;

        }
        #endregion
    }
}
