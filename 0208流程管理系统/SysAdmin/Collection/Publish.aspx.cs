#region 引用程序集
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using AllPower.Common;
using AllPower.Web.Admin;
#endregion


namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class Publish : AdminPage 
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.Collection.Publish publish;

            publish = new AllPower.BLL.Collection.Publish(Request.QueryString["TaskID"]);
            publish.Execute();
        }
    }
}
