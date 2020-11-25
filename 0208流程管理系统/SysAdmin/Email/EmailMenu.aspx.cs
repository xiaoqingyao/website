using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
using AllPower.Web.Admin;

namespace AllPower.WEB.Admin.Email
{
    public partial class EmailMenu : AdminPage
    {
        AllPower.Model.Emails.InnerEmail model = new AllPower.Model.Emails.InnerEmail();
        AllPower.BLL.Emails.InnerEmail bll = new AllPower.BLL.Emails.InnerEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = bll.GetList("SUMBOX", Utils.getOneParams("zcq_26@126.com"));
                DataView drv = dt.DefaultView;
                this.lblDeleteBoxSum.Text = drv[0]["DeleteBox"].ToString();
                this.lblDrafBoxSum.Text = drv[0]["DraftBox"].ToString();
                this.lblRBoxSum.Text = drv[0]["ReceiveBox"].ToString();
                this.lblSendBoxSum.Text = drv[0]["SendBox"].ToString();
            }
        }
    }
}
