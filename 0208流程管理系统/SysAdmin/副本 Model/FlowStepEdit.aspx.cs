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
    创建时间： 2010年3月29日
    功能描述： 审核流程步骤添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class FlowStepEdit : AdminPage
    {
        Model.Content.FlowStep modelFlowStep;
        BLL.Content.FlowStep bllFlowStep = new KingTop.BLL.Content.FlowStep();


        #region  URL参数
        private string _flowId = null;
        /// <summary>
        /// 流程ID
        /// </summary>
        public string FlowId
        {
            get
            {
                if (this._flowId == null)
                {
                    this._flowId = Utils.ReqUrlParameter("flowId");
                }

                return this._flowId;
            }
        }
        #endregion

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
            //绑定用户操作
            BLL.Content.ReviewFlowState bllReviewFlowState = new KingTop.BLL.Content.ReviewFlowState();

            BLL.SysManage.UserGroup useGroup = new KingTop.BLL.SysManage.UserGroup();
            KingTop.Model.SelectParams selectParam = new KingTop.Model.SelectParams();
            selectParam.S1 = SiteID.ToString ();
            //一下由gavin修改，读取用户组信息 by 2010-07-22
            //DataTable dtUserGroup = useGroup.GetList("ALLCOLUMN", selectParam);
            DataTable dtUserGroup = useGroup.GetList("GROUPANDROLENAME", selectParam).Tables[0];
            
            DataTable dtReviewFlowState = bllReviewFlowState.GetList("ALL", Utils.getOneParams(""));
            ControlUtils.DropDownDataBind(ddlFlowStepSuccessState, dtReviewFlowState, "Name", "stateValue", false);
            ControlUtils.DropDownDataBind(ddlFlowStepFailState, dtReviewFlowState, "Name", "stateValue", false);
            ControlUtils.CheckBoxListBind(cblFlowStepState, dtReviewFlowState, "Name", "ID", true);

            //绑定用户角色
            BLL.SysManage.Role bllRole = new KingTop.BLL.SysManage.Role();
            dtReviewFlowState = bllRole.GetList("ALL", Utils.getOneParams(""));
            ControlUtils.CheckBoxListBind(cblFiledUserRole, dtUserGroup, "UserGroupName", "UserGroupCode", true);
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllFlowStep.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    txtDescribe.Text = dt.Rows[0]["Desc"].ToString();
                    txtFlowStepSuccess.Text = dt.Rows[0]["SuccessName"].ToString();
                    txtFlowStepFail.Text = dt.Rows[0]["FailName"].ToString();
                    ddlFlowStepFailState.SelectedValue = dt.Rows[0]["FailState"].ToString();
                    ddlFlowStepSuccessState.SelectedValue = dt.Rows[0]["SuccessState"].ToString();
                    ControlUtils.SetGetCheckBoxListSelectValue(cblFiledUserRole, dt.Rows[0]["GroupId"].ToString());
                    ControlUtils.SetGetCheckBoxListSelectValue(cblFlowStepState, dt.Rows[0]["ReviewFlowStateGroup"].ToString());
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
            modelFlowStep = new KingTop.Model.Content.FlowStep();
            ModelSaveOrUpdate();
            string strOperateName = "Add";
            if (Action == "NEW") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有添加权限
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_FlowStep");
                modelFlowStep.ID = strTableOrId[0];
                modelFlowStep.Orders = Utils.ParseInt(strTableOrId[1], 1);
                modelFlowStep.AddMan = UserNo;
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                strOperateName = "Update";
                modelFlowStep.ID = ID;
            }
            //用户添加/修改操作
            string strMessage = bllFlowStep.Save(Action, modelFlowStep);
            if (strMessage == "1") //操作成功
            {
                ID = modelFlowStep.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelFlowStep.Name.Replace("'", "\\'") + "';");
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");    
            }
            WriteLogExpand(modelFlowStep.Name, hidLogTitle.Value, strOperateName, "FlowStep", strMessage); //写日志
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelFlowStep.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelFlowStep.Desc = HttpUtility.HtmlEncode(txtDescribe.Text.Trim());
            modelFlowStep.SuccessName = txtFlowStepSuccess.Text.Trim();
            modelFlowStep.SuccessState = Convert.ToInt32(ddlFlowStepSuccessState.SelectedValue);
            modelFlowStep.FailName = txtFlowStepFail.Text.Trim();
            modelFlowStep.FailState = Convert.ToInt32(ddlFlowStepFailState.SelectedValue);
            modelFlowStep.GroupId = ControlUtils.GetCheckBoxListSelectValue(cblFiledUserRole);
            modelFlowStep.ReviewFlowStateGroup = ControlUtils.GetCheckBoxListSelectValue(cblFlowStepState);
            modelFlowStep.NodeCode = NodeCode;
            modelFlowStep.ReviewFlowId = FlowId;
        }
    }
}
