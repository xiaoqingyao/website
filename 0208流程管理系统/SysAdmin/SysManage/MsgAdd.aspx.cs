using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using System.Text;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      肖丹
    创建时间： 2010年5月19日
    功能描述： 操作编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class MsgAdd : AllPower.Web.Admin.AdminPage
    {
        Message objMsg = new Message();
        MessageSendee objMsgSendee = new MessageSendee();
        Account objAccount = new Account();

        #region URL参数
        private string _sendUID;
        /// <summary>
        /// 发送人ID
        /// </summary>
        public string SendUID
        {
            get
            {
                if (_sendUID == null)
                {
                    _sendUID = Utils.UrlDecode(Utils.ReqUrlParameter("SendUID"));
                }
                return _sendUID;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dtMsg=new DataTable();
                if (SendUID != null && SendUID != "")
                {
                    dtMsg = objAccount.GetList("ONE", Utils.getOneParams(SendUID));
                    if (SendUID == "0")
                    {
                        namelist.Value = "admin";
                        nameID.Value = "0";
                    }
                    else
                    {
                        namelist.Value = dtMsg.Rows[0]["UserName"].ToString();
                        nameID.Value = SendUID;
                    }
                }
                if (ID != null && ID != "")
                {
                    dtMsg = objMsg.GetList("ONE", Utils.getOneParams(ID));
                    txtContent.Text = Utils.ParseToText(dtMsg.Rows[0]["Content"].ToString());
                }
                rptAccountList.DataSource = objAccount.GetList("ALL", Utils.getOneParams(SiteID.ToString()));
                rptAccountList.DataBind();
            }
        }

        #region 按钮事件
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string returnMsg1 = "";
            string returnMsg2 = "";
            AllPower.Model.SysManage.Message ModeMessage = new AllPower.Model.SysManage.Message();
            AllPower.Model.SysManage.MessageSendee ModeMsgSendee = new AllPower.Model.SysManage.MessageSendee();

            ////*****************添加到消息表********************
            ModeMessage.ID = Guid.NewGuid();
            ModeMessage.AddDate = DateTime.Now;
            ModeMessage.Content = Utils.ParseToHtml(txtContent.Text);
            ModeMessage.SendDate = Utils.ParseDateTime(txtSendDate.Text);
            if (txtSendDate.Text == "")
            {
                ModeMessage.SendDate = DateTime.Today;
            }
            ModeMessage.SendUID = Utils.ParseInt(GetLoginAccountId(),0);
            ModeMessage.SiteID = SiteID;
            ModeMessage.Type = 0;

            returnMsg1=objMsg.Save("NEW", ModeMessage);

            //*****************添加到消息接收人表********************            
            ModeMsgSendee.MessageID = ModeMessage.ID;
            ModeMsgSendee.IsRead = false;  //新加的消息默认为未读过
            ModeMsgSendee.IsValid = true;
            ModeMsgSendee.IsDated= false;   //新加的消息默认为 没过时
            string[] word = nameID.Value.Split(',');
            for (int i = 0; i < word.Length; i++)
            {
                ModeMsgSendee.ID = Guid.NewGuid();
                ModeMsgSendee.SendeeUID = Utils.ParseInt(word[i], 0);
                returnMsg2 = objMsgSendee.Save("NEW", ModeMsgSendee);
            }
                
            if (Convert.ToInt32(returnMsg1) > 0 && Convert.ToInt32(returnMsg2) > 0)
            {
                WriteLog(GetLoginAccountId()+"发送内部短消息成功", "", 2); // 写入操作日志
                Utils.RunJavaScript(this, "alertClose({msg:'发送成功！',title:'提示信息'},function(){location.href='MsgSendlist.aspx'})");
            }
            else
            {
                WriteLog(GetLoginAccountId() + "发送内部短消息失败", "", 2); // 写入操作日志
                Utils.RunJavaScript(this, "alertClose({msg:'发送失败！',title:'提示信息'})");
            }
        }
        #endregion
    }
}
