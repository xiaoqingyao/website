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
    创建时间： 2010年4月7日
    功能描述： 自定义表单添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class CustomFormEdit : AdminPage
    {
        AllPower.Model.Content.CustomForm modelCustomForm;
        BLL.Content.CustomForm bllCustomForm = new AllPower.BLL.Content.CustomForm();

        #region Page_Load
        /// <summary>
        /// 初始化数据绑定        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 数据初始化        private void PageInit()
        {          
            BLL.Content.ReviewFlow bllReviewFlow = new AllPower.BLL.Content.ReviewFlow();
            ControlUtils.DropDownDataBind(ddlReviewFlow,bllReviewFlow.GetList("ALL",Utils.getOneParams("")),"Name","ID");
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {               
                DataTable dt = bllCustomForm.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    hidLogTitle.Value = txtName.Text;
                    txtBeginTime.Text = dt.Rows[0]["StartTime"].ToString();
                    txtEmails.Text = dt.Rows[0]["emails"].ToString();
                    txtEndTime.Text = dt.Rows[0]["endtime"].ToString();
                    txtPhones.Text = dt.Rows[0]["Phones"].ToString();
                    txtsummary.Text = dt.Rows[0]["intro"].ToString();
                    txtTableName.Text = dt.Rows[0]["tablename"].ToString().Replace("K_F_","");
                    txtTableName.Enabled = false;
                    cbIsAuthcode.Checked = Convert.ToBoolean(dt.Rows[0]["IsAuthcode"]);
                    cbIsRelease.Checked = Convert.ToBoolean(dt.Rows[0]["IsPub"]);
                    cbIsReply.Checked = Convert.ToBoolean(dt.Rows[0]["IsReply"]);
                    cbIsSaveDataBase.Checked = Convert.ToBoolean(dt.Rows[0]["IsSaveDataBase"]);
                    cbIsSendAdminEmail.Checked = Convert.ToBoolean(dt.Rows[0]["IsSendAdminEmail"]);
                    cbIsSendAdminPhone.Checked = Convert.ToBoolean(dt.Rows[0]["IsSendAdminPhone"]);
                    cbIsSendUserEmail.Checked = Convert.ToBoolean(dt.Rows[0]["IsSendUserEmail"]);
                    cbIsSendUserPhone.Checked = Convert.ToBoolean(dt.Rows[0]["IsSendUserPhone"]);
                    cbIsUserAnswer.Checked = Convert.ToBoolean(dt.Rows[0]["IsUserAnswer"]);
                    cbTime.Checked = Convert.ToBoolean(dt.Rows[0]["IsTimeLimit"]);
                    IsEnable.Checked = Convert.ToBoolean(dt.Rows[0]["IsEnable"]);
                    ddlbrowseType.SelectedValue = dt.Rows[0]["browseType"].ToString();
                    ddllistModel.SelectedValue = dt.Rows[0]["listModel"].ToString();
                    ddlpageModel.SelectedValue = dt.Rows[0]["pageModel"].ToString();
                    ddlReview.SelectedValue = dt.Rows[0]["IsCheck"].ToString();
                    ddlReviewFlow.SelectedValue = dt.Rows[0]["ReviewFlowId"].ToString();
                    txtSubmitLimitTime.Text = dt.Rows[0]["SubmitLimitTime"].ToString();
                    txtSubmitLimitIP.Text = dt.Rows[0]["SubmitLimitIP"].ToString();
                    txtFieldFromUrlParamValue.Text = dt.Rows[0]["FieldFromUrlParamValue"].ToString();
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
            modelCustomForm = new AllPower.Model.Content.CustomForm();
            ModelSaveOrUpdate();
            string strOperateName = "Add";

            if (Action == "NEW") //如果当前操作为新增,则运算出id的值            {
                // 权限验证，是否具有修改权限                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }

                string[] strTableOrId = GetTableID("0", "K_CustomForm");
                modelCustomForm.ID = strTableOrId[0];
                modelCustomForm.Orders = Utils.ParseInt(strTableOrId[1], 1);
                modelCustomForm.AddMan = UserNo;               
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
                modelCustomForm.ID = ID;
            }
            //用户添加/修改操作
            string strMessage = bllCustomForm.Save(Action, modelCustomForm);


            if (strMessage == "1") //操作成功
            {

                if (Action.ToLower() == "new")  // 添加模型记录
                {
                    bllCustomForm.AddModel(txtTableName.Text.Trim(), txtName.Text.Trim(), this.UserNo,modelCustomForm.ID);
                }

                ID = modelCustomForm.ID;
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelCustomForm.Name.Replace("'", "\\'") + "';");                //生成一个新的表              
               
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");  
            }
            WriteLogExpand(modelCustomForm.Name, hidLogTitle.Value, strOperateName, "CustomForm", strMessage); //写日志            
        }

        /// <summary>
        /// 基本属性绑定        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelCustomForm.FieldFromUrlParamValue = txtFieldFromUrlParamValue.Text.Trim();
            modelCustomForm.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelCustomForm.IsEnable = IsEnable.Checked;
            modelCustomForm.SiteId = SiteID.ToString();
            modelCustomForm.NodeId = NodeID;
            modelCustomForm.TableName = "K_F_"+txtTableName.Text.Trim();
            modelCustomForm.Intro = txtsummary.Text.Trim();
            modelCustomForm.IsTimeLimit = cbTime.Checked;
            modelCustomForm.StartTime = Utils.ParseDateTime(txtBeginTime.Text.Trim());
            modelCustomForm.EndTime = Utils.ParseDateTime(txtEndTime.Text.Trim());
            modelCustomForm.pageModel = ddlpageModel.SelectedValue;
            modelCustomForm.listModel = ddllistModel.SelectedValue;
            modelCustomForm.IsAuthcode = cbIsAuthcode.Checked;
            modelCustomForm.IsReply = cbIsReply.Checked;
            modelCustomForm.IsPub = cbIsRelease.Checked;
            modelCustomForm.browseType = Utils.ParseInt(ddlbrowseType.SelectedValue, 1);
            modelCustomForm.IsCheck = Utils.ParseInt(ddlReview.SelectedValue,1);
            modelCustomForm.ReviewFlowId = ddlReviewFlow.SelectedValue;
            modelCustomForm.IsSendUserEmail = cbIsSendUserEmail.Checked;
            modelCustomForm.Emails = txtEmails.Text.Trim();
            modelCustomForm.IsSendUserPhone = cbIsSendUserPhone.Checked;
            modelCustomForm.Phones = txtPhones.Text.Trim();
            modelCustomForm.IsSaveDataBase = cbIsSaveDataBase.Checked;
            modelCustomForm.IsUserAnswer = cbIsUserAnswer.Checked;
            modelCustomForm.IsSendAdminEmail = cbIsSendAdminEmail.Checked;
            modelCustomForm.IsSendAdminPhone = cbIsSendAdminPhone.Checked;
            modelCustomForm.SubmitLimitIP = txtSubmitLimitIP.Text.Trim();
            modelCustomForm.SubmitLimitTime = Utils.ParseInt(txtSubmitLimitTime.Text.Trim(), 0);
            modelCustomForm.NodeCode = NodeCode;
        }
    }
}
