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
    创建时间： 2010年5月7日
    功能描述： 会员模型编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class MemberOnlyModelEdit : AdminPage
    {

        BLL.MemberManage.Member bllMember = new AllPower.BLL.MemberManage.Member();
        private DataTable dtMember;

        #region  URL参数         
        private string _memberID = null;
 
        /// <summary>
        /// 会员 ID
        /// </summary>
        public string MemberID
        {
            get
            {
                if (this._memberID == null)
                {
                    this._memberID = Utils.ReqUrlParameter("memberID");
                }

                return this._memberID;
            }
        }
        #endregion

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
            //绑定会员模型下拉框
            BLL.Business.BusinessModel bllBusinessModel = new AllPower.BLL.Business.BusinessModel();
            DataTable dtMemeberModel = bllBusinessModel.GetList("MEMBER", Utils.getOneParams(""));
            ControlUtils.DropDownDataBind(ddlMemberModel, dtMemeberModel, "Name", "ID", true);

            //获取会员模式的名称           
            dtMember = bllMember.GetList("ONE",Utils.getOneParams(MemberID));
            if (dtMember != null && dtMember.Rows.Count > 0)
            {
                foreach (DataRow drModel in dtMemeberModel.Rows)
                {
                    if(drModel["ID"].ToString()==dtMember.Rows[0]["ModleID"].ToString())
                    {
                        lblModel.Text = drModel["Name"].ToString();
                        break;
                    }
                }
            }

            //把当前url全部参数存入cookie中  
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount); 
             
        }
        #endregion

        #region 修改数据
        /// <summary>
        /// 添加/修改数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string newModelID = ddlMemberModel.SelectedValue;
            string strMessage = string.Empty;

            //如果会员模型改变，则更新至数据库
            dtMember = bllMember.GetList("ONE", Utils.getOneParams(MemberID));

            //提示框、消息
            string alterTitle = Utils.GetResourcesValue("Common", "TipMessage");
            string success = Utils.GetResourcesValue("model", "AddSucess");
            string error = Utils.GetResourcesValue("model", "AddError");

            if (dtMember.Rows[0]["ModleID"].ToString() != ddlMemberModel.SelectedValue)
            {
                strMessage = bllMember.MemberSet("UPDATEMODLE", newModelID, MemberID);

                //删除原会员模型字段值记录
                BLL.Business.BusinessFieldValue bllBusinessFieldValue = new AllPower.BLL.Business.BusinessFieldValue();
                bllBusinessFieldValue.BusinessFieldValueSet("MEMBERDEL", "", MemberID);
                int result = Utils.ParseInt(strMessage, 0);

                if (result==1)
                {
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModel", true), "", 2);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + success + "',title:'" + alterTitle + "'})"); 
                }
                else
                {
                    WriteLog(GetLogValue(LogTitle, Action, "MemberModel", false), strMessage, 3);
                    Utils.RunJavaScript(this, "alert({jsMessage:'" + error + "',title:'" + alterTitle + "'})");
                }

            }
            
        }
        #endregion
    
    }
}
