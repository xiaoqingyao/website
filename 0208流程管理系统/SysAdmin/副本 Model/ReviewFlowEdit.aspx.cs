using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using System.Text;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月26日
    功能描述： 审核流程编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ReviewFlowEdit : AdminPage
    {
        Model.Content.ReviewFlow modelReviewFlow;
        BLL.Content.ReviewFlow bllReviewFlow = new KingTop.BLL.Content.ReviewFlow();

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

        #region 数据初始化
        private void PageInit()
        {           
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllReviewFlow.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtDescribe.Text = dt.Rows[0]["Desc"].ToString();
                    hidLogTitle.Value = txtName.Text;
                   
                }
                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                dt.Dispose();
            }
        }
        #endregion

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            modelReviewFlow = new  KingTop.Model.Content.ReviewFlow ();
            ModelSaveOrUpdate();
            string strOperateName = "Add";
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_ReviewFlow");
                modelReviewFlow.ID = strTableOrId[0];
                modelReviewFlow.Orders = Utils.ParseInt(strTableOrId[1], 1);     
                modelReviewFlow.AddMan = UserNo;               
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                strOperateName = "Update";
                modelReviewFlow.ID = ID;
            }
            //用户添加/修改操作
            string strMessage = bllReviewFlow.Save(Action, modelReviewFlow);
            if (strMessage == "1") //操作成功
            {
                ID = modelReviewFlow.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelReviewFlow.Name.Replace("'", "\\'") + "';");
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");     
            }
            WriteLogExpand(modelReviewFlow.Name, hidLogTitle.Value, strOperateName, "ReviewFlow", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelReviewFlow.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelReviewFlow.Desc = HttpUtility.HtmlEncode(txtDescribe.Text.Trim());
            modelReviewFlow.NodeId = NodeID;
            modelReviewFlow.NodeCode = NodeCode;
            modelReviewFlow.SiteId = SiteID.ToString();
        }
    }
}
