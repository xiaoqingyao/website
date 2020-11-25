#region 引入程序集
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;

using AllPower.Common;
using AllPower.BLL.Template;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年10月20日    功能描述： 专题列表页发布
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class CreateSpecialList  : AdminPage
    {
        #region 变量成员
        BLL.SysManage.CreateSpecialList createSpecialList;
        #endregion

        #region 加载
        protected void Page_Load(object sender, EventArgs e)
        {
            createSpecialList = new BLL.SysManage.CreateSpecialList();

            if (!IsPostBack)
            {
                createSpecialList.BindSpecialMenu(lstbSpecialMenu,this.SiteID);
            }
        }
        #endregion

        #region 发布
        protected void btnCreateSpecialList_Click(object sender, EventArgs e)
        {
            List<string> lstSpecial;
            List<string> lstSpecialMenu;
            AllPower.Template.Publish publish;

            lstSpecial = new List<string>();
            lstSpecialMenu = new List<string>();
            publish = new AllPower.Template.Publish(this.SiteID, this.SiteDir,this.GetSiteDomain());
            publish.UploadImgUrl = this.GetUploadImgUrl();
            publish.MediasUrl = this.GetUploadMediaUrl();
            publish.FilesUrl = this.GetUploadFileUrl();

            foreach (ListItem item in lstbSpecialMenu.Items)
            {
                if (item.Selected)
                {
                    if (item.Value.Length > 2 && item.Value.Substring(0, 2) == "M_")        // 专题栏目
                    {
                        lstSpecialMenu.Add(item.Value.Substring(2,item.Value.Length - 2));
                    }
                    else  // 专题
                    {
                        lstSpecial.Add(item.Value);
                    }
                }
            }

            try
            {
                publish.Execute(lstSpecial, lstSpecialMenu);
            }
            catch { }
        }
        #endregion
    }
}
