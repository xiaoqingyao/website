using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.Common;

namespace KingTop.WEB.SysAdmin.SysManage
{
    public partial class regexp : KingTop.Web.Admin.AdminPage
    {
        public string IsDated="";
        KingTop.BLL.SysManage.MessageSendee objMsgSendee = new KingTop.BLL.SysManage.MessageSendee();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = objMsgSendee.GetList("ISDATED", Utils.getOneParams(GetLoginAccountId()));
            //if (dt.Rows.Count >= 1)
            //{
            //    IsDated = "true";
            //}
            //else
            //{
            //    IsDated = "False";
            //}
            IsDated = "False";
        }
    }
}
