#region 引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年4月24日
    功能描述： 添加记录至专题
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class ShowSiteNode : AdminPage
    {
        #region 变量成员
        BLL.Content.ShowSiteNode showSiteNode;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            showSiteNode = new KingTop.BLL.Content.ShowSiteNode(SiteID,NodeCode);
            TreeMenu.InnerHtml = showSiteNode.NodeTreeInit(GetLoginAccountId());
            hdnAction.Value = Request.QueryString["action"];
        }
        #endregion
    }
}
