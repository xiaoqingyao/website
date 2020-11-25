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
    创建时间： 2010年5月19日
    功能描述： 问卷调查选项添加/修改
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class SurveyItemEdit : AdminPage
    {
        #region 初始参数

        AllPower.Model.Content.SurveyItem modelSurveyItem;
        BLL.Content.SurveyItem bllSurveyItem = new AllPower.BLL.Content.SurveyItem();

        private string strNid;
        /// <summary> 
        /// 问卷调查ID
        /// </summary>
        public string StrNid
        {
            get
            {
                if (strNid == null)
                {
                    strNid = Utils.ReqUrlParameter("nid");
                }
                return strNid;
            }
        }
        #endregion

        #region 初始化
        // 初始化页面
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        //数据初始化
        private void PageInit()
        {

            ControlUtils.RadioButtonListDataBind(rbtlType, Utils.GetXmlDataSet("../Configuraion/model/SurveyItemType.xml").Tables[0], "name", "value");
            rbtlType.SelectedIndex = 0;
            //如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                SelectParams selParams = new SelectParams();
                selParams.S1 = ID;
                DataTable dt = bllSurveyItem.GetList("ONE", selParams);
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    cbIsRequired.Checked = Utils.ParseBool(dt.Rows[0]["IsRequired"].ToString());
                    rbtlType.SelectedValue = dt.Rows[0]["type"].ToString();
                    rbtlType.Enabled = false;
                    dl1.Visible = false;
                    hidLogTitle.Value = txtName.Text;
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
            modelSurveyItem = new AllPower.Model.Content.SurveyItem();
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
                modelSurveyItem.AddMan = UserNo;
                modelSurveyItem.Orders = 1;
            }
            else  //否则直接绑定当前id
            {
                // 权限验证，是否具有修改权限

                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                    return;
                }
                modelSurveyItem.ID = ID;
                strOperateName = "Update";
            }
            //用户添加/修改操作
            string strMessage = bllSurveyItem.Save(Action, modelSurveyItem);
            if (strMessage != "0" && strMessage.IndexOf('|') == -1) //操作成功
            {
                if (ID == "")
                {
                    ID = strMessage;
                }
                Utils.RunJavaScript(this, "type=" + (Action == "NEW" ? 0 : 1).ToString() + ";title='" + modelSurveyItem.Name.Replace("'", "\"") + "';");
                strMessage = "1";
            }
            else
            {
                Utils.RunJavaScript(this, "type=2;errmsg='" + strMessage.Replace("'", "\"").Replace("\n", "").Replace("\r", "") + "';");
            }
            WriteLogExpand(modelSurveyItem.Name, hidLogTitle.Value, strOperateName, "SurveyItem", strMessage); //写日志

        }

        // 基本属性绑定
        private void ModelSaveOrUpdate()
        {
            modelSurveyItem.Name = HttpUtility.HtmlEncode(txtName.Text.Trim());
            modelSurveyItem.DataItem = txtDataItemd.Text.Trim();
            modelSurveyItem.FontSize = Utils.ParseInt(txtFontSize.Text.Trim(), 255);
            modelSurveyItem.IsRequired = cbIsRequired.Checked;
            modelSurveyItem.IsShow = cbIsShow.Checked;
            modelSurveyItem.RowCount = Utils.ParseInt(txtRowCount.Text.Trim(), 0);
            modelSurveyItem.SurveyID = StrNid;
            modelSurveyItem.Type = Utils.ParseInt(rbtlType.SelectedValue, 1);
            modelSurveyItem.NodeCode = NodeCode;
        }
        #endregion
    }
}
