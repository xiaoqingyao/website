using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using AllPower.Common;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      朱存群
    创建时间： 2010年5月21日
    功能描述： 浏览邮件
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Emails
{
    public partial class EmailView : AdminPage
    {
        AllPower.BLL.Emails.InnerEmail bll = new AllPower.BLL.Emails.InnerEmail();
        AllPower.Model.Emails.InnerEmail model = new AllPower.Model.Emails.InnerEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(ID))
                {
                    PageInit(ID);
                }
            }
        }

        #region 加载邮件信息
        protected void PageInit(string id)
        {
            DataView drv = bll.GetList("ONE", Utils.getOneParams(id)).DefaultView;
            this.lblContent.Text = drv[0]["Content"].ToString();
            this.lblCopyer.Text = drv[0]["Copyer"].ToString();
            this.lblReceiver.Text = drv[0]["ReceiveID"].ToString();
            this.lblSecreter.Text=drv[0]["Secreter"].ToString();
            this.lblSender.Text = drv[0]["SendID"].ToString();
            this.lblTime.Text = drv[0]["SendTime"].ToString();
            this.lblTitle.Text = drv[0]["Title"].ToString();
        }
        #endregion
    }
}
