using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Common;
using System.Web.Services;

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class MsgShow :AllPower.Web.Admin.AdminPage
    {
        public string strContent = "";
        Guid mid = new Guid();
        public string username = "", AddDate="";
        AllPower.BLL.SysManage.MessageSendee objMsgSendee = new AllPower.BLL.SysManage.MessageSendee();
        AllPower.BLL.SysManage.Account objAccount = new AllPower.BLL.SysManage.Account();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //根据UserID得到最新一条没过时的消息
                DataTable dt = objMsgSendee.GetList("ISDATEDONE", Utils.getOneParams(GetLoginAccountId()));
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    //消息传送人表主键
                    HdID.Value = dr["ID"].ToString();
                    AddDate = dr["AddDate"].ToString();
                    strContent = dr["content"].ToString();
                    //消息表主键
                    // hdMessageID.Value = dr["MessageID"].ToString();
                    //发送人ID
                    string UserID = dr["SendUID"].ToString();
                    //根据发送人ID查找用户名
                    DataTable dtUser = objAccount.GetList("ONE", Utils.getOneParams(UserID));
                    if (dtUser.Rows.Count >= 1)
                    {
                        username = dtUser.Rows[0]["UserName"].ToString();

                    }
                    else
                    {
                        username = "admin";
                    }
                    strContent = strContent.Replace("<br>", "&nbsp;");
                    strContent = Utils.GetShortString(strContent, 100, true);
                }
            }            
        }

        [WebMethod]
        public static string lnkbShow(string id)
        {
            AllPower.BLL.SysManage.MessageSendee objMsgSendee = new AllPower.BLL.SysManage.MessageSendee();
            /**************************更改消息传送人表中的消息********************************/
            AllPower.Model.SysManage.MessageSendee mode=new AllPower.Model.SysManage.MessageSendee();
            mode.ID = new Guid(id) ;
            //把消息表的信息改为过时
            mode.IsDated = true;       
            //把消息表的信息改为己读
            mode.IsRead = true;
            string str = objMsgSendee.Save("EDIT", mode);
            return str;
        }
    }
}
