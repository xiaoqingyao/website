using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
using KingTop.Model;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月21日
    功能描述： 评论配置
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class CommentConfigEdit : AdminPage
    {
        #region 业务类

        KingTop.Model.Content.CommentConfig modelCommentConfig;
        BLL.Content.CommentConfig bllCommentConfig = new KingTop.BLL.Content.CommentConfig();
        #endregion

        #region  URL参数
        private string _action = null;
        private string _id = null;

        /// <summary>
        /// 获取用户操作
        /// </summary>
        public string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToUpper();
                    if (_action == "")
                    {
                        _action = "NEW";
                    }
                }

                return this._action;
            }
        }

        /// <summary>
        /// 操作ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID");
                }

                return this._id;
            }
        }

        /// <summary>
        /// 分页页面参数
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string strPageParams = KingTop.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, Session.SessionID).Replace("|", "&");
                if (strPageParams.Length > 0)
                {
                    return "?" + strPageParams;
                }
                else
                {
                    return "";
                }
            }
        }
        #endregion

        #region 数据初始化

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

        //绑定
        private void PageInit()
        {
            BLL.Content.ReviewFlow bllReviewFlow = new KingTop.BLL.Content.ReviewFlow();
            ControlUtils.DropDownDataBind(ddlReviewFlow, bllReviewFlow.GetList("ALL", Utils.getOneParams("")), "Name", "ID");
            //如果用户操作为修改,则初始化绑定
            DataTable dt = bllCommentConfig.GetList("ONE", Utils.getOneParams(SiteID.ToString()));
            if (dt != null && dt.Rows.Count > 0)
            {
                hidAction.Value = "Edit";
                cbIsAuthcode.Checked = Utils.ParseBool(dt.Rows[0]["IsAuthcode"].ToString());
                cbIsScore.Checked = Utils.ParseBool(dt.Rows[0]["IsScore"].ToString());
                cbIsSquare.Checked = Utils.ParseBool(dt.Rows[0]["IsSquare"].ToString());
                txtSquareName.Text = dt.Rows[0]["SquareName"].ToString();
                cbIsCounter.Checked = Utils.ParseBool(dt.Rows[0]["IsCounter"].ToString());
                txtCounterName.Text = dt.Rows[0]["CounterName"].ToString();
                txtLimitTime.Text = dt.Rows[0]["LimitTime"].ToString();
                ddlReview.SelectedValue = dt.Rows[0]["IsCheck"].ToString();
                ddlReviewFlow.SelectedValue = dt.Rows[0]["ReviewFlowId"].ToString();
                txtSubmitLimitTime.Text = dt.Rows[0]["SubmitLimitTime"].ToString();
                txtSubmitLimitIP.Text = dt.Rows[0]["SubmitLimitIP"].ToString();
                cbIsUserSubmit.Checked = Utils.ParseBool(dt.Rows[0]["IsUserSubmit"].ToString());
                cbIsNeutral.Checked = Utils.ParseBool(dt.Rows[0]["IsNeutral"].ToString());
                txtNeutralName.Text = dt.Rows[0]["NeutralName"].ToString();
                IsEnable.Checked = Utils.ParseBool(dt.Rows[0]["IsEnable"].ToString());
                ckbIsShowFifth.Checked = Utils.ParseBool(dt.Rows[0]["IsShowFifth"].ToString());
                ViewState["CommentConfigID"] = dt.Rows[0]["ID"].ToString();
            }
            //btnSave.Text = Utils.GetResourcesValue("Common", "Update");
            dt.Dispose();
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
            modelCommentConfig = new KingTop.Model.Content.CommentConfig();
            ModelSaveOrUpdate();
            if (hidAction.Value == "New") //如果当前操作为新增,则运算出id的值
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有添加操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                string[] strTableOrId = GetTableID("0", "K_CommentConfig");
                modelCommentConfig.ID = strTableOrId[0];
                modelCommentConfig.Orders = Utils.ParseInt(strTableOrId[1], 1);

            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }

                modelCommentConfig.ID = ViewState["CommentConfigID"].ToString();
            }
            //用户添加/修改操作
            string strMessage = bllCommentConfig.Save(hidAction.Value.ToUpper(), modelCommentConfig);
            if (strMessage == "1") //操作成功
            {
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddSucess") + "',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'" + Utils.GetResourcesValue("model", "AddError") + "',title:'提示信息'})");

            }
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelCommentConfig.IsAuthcode = cbIsAuthcode.Checked;
            modelCommentConfig.IsScore = cbIsScore.Checked;
            modelCommentConfig.IsSquare = cbIsSquare.Checked;
            modelCommentConfig.SquareName = txtSquareName.Text.Trim();
            modelCommentConfig.IsCounter = cbIsCounter.Checked;
            modelCommentConfig.CounterName = txtCounterName.Text.Trim();
            modelCommentConfig.LimitTime = Utils.ParseInt(txtLimitTime.Text.Trim(), 0);
            modelCommentConfig.IsCheck = Utils.ParseInt(ddlReview.SelectedValue, 0);
            modelCommentConfig.ReviewFlowId = ddlReviewFlow.SelectedValue;
            modelCommentConfig.SubmitLimitTime = Utils.ParseInt(txtSubmitLimitTime.Text.Trim(), 0);
            modelCommentConfig.SubmitLimitIP = txtSubmitLimitIP.Text.Trim();
            modelCommentConfig.IsUserSubmit = cbIsUserSubmit.Checked;
            modelCommentConfig.IsNeutral = cbIsNeutral.Checked;
            modelCommentConfig.NeutralName = txtNeutralName.Text.Trim();
            modelCommentConfig.SiteId = SiteID.ToString();
            modelCommentConfig.AddMan = UserNo;
            modelCommentConfig.IsEnable = IsEnable.Checked;
            modelCommentConfig.IsShowFifth = ckbIsShowFifth.Checked;
        }
        #endregion
    }
}
