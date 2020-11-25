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
    作者:      严辉
    创建时间： 2010年5月20日
    功能描述： 会员配置验证码
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class MemberConfigEdit : AdminPage
    {
        BLL.MemberManage.MemberConfig bllMemberConfig = new AllPower.BLL.MemberManage.MemberConfig();
        Model.MemberManage.MemberConfig modelMemberConfig = null;

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
            cbIsAuthcode.Checked = bllMemberConfig.IsAuthCode(NodeCode);            
        }
        #endregion

        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param Name="sender"></param>
        /// <param Name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            modelMemberConfig = new AllPower.Model.MemberManage.MemberConfig();
            ModelSaveOrUpdate();

            // 权限验证，是否具有修改权限
            if (!IsHaveRightByOperCode("Edit"))
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改操作的权限，请联系站点管理员！',title:'提示信息'})");
                return;
            }

            modelMemberConfig.ID = "1";

            //用户添加/修改操作
            string strMessage = bllMemberConfig.Save("EDIT", modelMemberConfig);

            int result = Utils.ParseInt(strMessage, 0);

            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");

            if (result == 1)
            {
                WriteLog(GetLogValue(LogTitle, "Edit", "MemberConfig", true), success, 2);
                Utils.AlertMessage(this, success);
            }
            else
            {
                WriteLog(GetLogValue(LogTitle, "Edit", "MemberConfig", false), strMessage, 3);
                Utils.AlertMessage(this, error);
            }
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            string[] strTableOrId = GetTableID("0", "K_MemberConfig");
            modelMemberConfig.ID = strTableOrId[0];
            modelMemberConfig.Orders = Utils.ParseInt(strTableOrId[1], 1);
            modelMemberConfig.IsAuthcode = cbIsAuthcode.Checked;
            modelMemberConfig.SiteID = SiteID;
            modelMemberConfig.NodeCode = NodeCode;
            modelMemberConfig.AddMan = AddMan;

        }
    }
}
