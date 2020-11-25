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
    创建时间： 2010年4月29日
    功能描述： 会员组 添加/编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberGroupEdit : AdminPage
    {
        Model.MemberManage.MemberGroup modelGroupMember;
        BLL.MemberManage.MemberGroup bllMemberGroup = new BLL.MemberManage.MemberGroup();

        
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
             
            ////如果用户操作为修改,则初始化绑定
            if (Action == "EDIT")
            {
                DataTable dt = bllMemberGroup.GetList("ONE", Utils.getOneParams(ID));
                if (dt != null && dt.Rows.Count > 0)
                {
                    hidLogTitle.Value = dt.Rows[0]["GroupName"].ToString();
                    txtName.Text = dt.Rows[0]["GroupName"].ToString();
                    txtServerIntro.Text = Utils.HtmlDecode(dt.Rows[0]["ServerIntro"].ToString());
                    rblVisit.SelectedValue = dt.Rows[0]["IsVisit"].ToString();
                    rblSearch.SelectedValue = dt.Rows[0]["IsSearch"].ToString();
                    rblPub.SelectedValue = dt.Rows[0]["IsPub"].ToString();
                    rblUpgrade.SelectedValue = dt.Rows[0]["IsSelfUpgrade"].ToString();
                    rblDisable.SelectedValue = dt.Rows[0]["IsDisable"].ToString();
                }

                btnSave.Text = Utils.GetResourcesValue("Common", "Update");
                dt.Dispose();
            }
        }
        #endregion

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Action == "NEW")
            {
                if (!IsHaveRightByOperCode("New"))
                {
                    Utils.AlertMessage(this, "你没有添加权限！");
                    return;
                }
            }
            else
            {
                if (!IsHaveRightByOperCode("Edit"))
                {
                    Utils.AlertMessage(this, "你没有修改权限！");
                    return;
                }
            }

            modelGroupMember = new AllPower.Model.MemberManage.MemberGroup();
            ModelSaveOrUpdate();
   
            if (Action == "NEW")
            {   
                InitModel();
            
            }
            else  //否则直接绑定当前id
            {
                modelGroupMember.ID = ID;
            }
            //用户添加/修改操作
            string strMessage = bllMemberGroup.Save(Action,modelGroupMember);
            int result = Utils.ParseInt(strMessage,0);

            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");
            string nameIsExis = Utils.GetResourcesValue("member", "GroupNameIsExis");

            switch (result)
            {
                case 1:    //操作成功
                    WriteLog(GetLogValue(LogTitle, Action, "MemberGroup", true), "", 2);
                    Utils.AlertMessage(this, success); 
                    break;

                case -1:    //已存在
                    WriteLog(GetLogValue(LogTitle, Action, "MemberGroup", false), nameIsExis, 3);
                    Utils.AlertMessage(this, nameIsExis);                     
                    break;

                default:    //未知错误
                    WriteLog(GetLogValue(LogTitle, Action, "MemberGroup", false), strMessage, 3);
                    Utils.AlertMessage(this, error);                     
                    break;
            }            
        }

        /// <summary>
        /// 新添加数据时，需初始化相关值
        /// </summary>
        private void InitModel()
        {
            string[] strTableOrId = GetTableID("0", "K_MemberGroup");
            modelGroupMember.ID = strTableOrId[0];
            modelGroupMember.Orders = Utils.ParseInt(strTableOrId[1], 1);
            modelGroupMember.AddMan = AddMan;
            modelGroupMember.DayPrices = 0f;
            modelGroupMember.YearPrices = 0f;
            modelGroupMember.MonthPrices = 0f;
            modelGroupMember.SiteID = SiteID;
            modelGroupMember.NodeCode = NodeCode;

        }
 
        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelGroupMember.GroupName = txtName.Text.Trim();
            modelGroupMember.ServerIntro = txtServerIntro.Text.Trim();
            modelGroupMember.IsVisit = Utils.ParseInt(rblVisit.SelectedValue, 0);
            modelGroupMember.IsSearch =Utils.ParseInt(rblSearch.SelectedValue,0);
            modelGroupMember.IsPub = Utils.ParseInt(rblPub.SelectedValue, 0);
            modelGroupMember.IsSelfUpgrade = Utils.ParseInt(rblUpgrade.SelectedValue, 0);
            modelGroupMember.IsDisable = Utils.ParseInt(rblDisable.SelectedValue, 0);
        }
    }
}
