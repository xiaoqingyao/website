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
using AllPower.Template.ParamType;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年10月20日    功能描述： 内容发布
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class CreateHtml : AdminPage
    {
        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            AllPower.BLL.Template.Publish publish;

            if (!Page.IsPostBack)
            {
                publish = new Publish();

                publish.DropDownDataBind(lstbMenu, 1, SiteID);
            }
        }
        #endregion

        #region 发布
        protected void btnCreatePub_Click(object sender, EventArgs e)
        {
            AllPower.Template.Publish publish;
            PublishParam publishParam;     //  发布参数
            List<string> lstMenu;                           // 要发布的栏目，Count=0时全部发布
            string[] typeParam;                 
             string menuNodeCode;                           // 要发布的栏目ID，多个用逗号隔开
             string[] arrMenuNodeCode;

            lstMenu = new List<string>();
            publishParam = new PublishParam();
            publish = new AllPower.Template.Publish(this.SiteID, this.SiteDir, this.GetSiteDomain());
            publish.UploadImgUrl = this.GetUploadImgUrl();
            publish.MediasUrl = this.GetUploadMediaUrl();
            publish.FilesUrl = this.GetUploadFileUrl();

            typeParam = null;
            menuNodeCode = Request.Form["lstbMenu"];
            publishParam.IsSiteIndex = cbtnIndex.Checked;           // 站点首页
            publishParam.IsMenuIndex = cbtnClassIndex.Checked;      // 栏目首页
            publishParam.IsMenuList = cbtnClassList.Checked;        // 栏目列表
            publishParam.IsContent = cbtnClassDetail.Checked;       // 内容页
            publishParam.UnPublished = chkUnPublished.Checked;      // 只生成未生成页面
            publishParam.IsCopyFile = chkIsCopyFile.Checked;

            if(rbtnCreate2.Checked)    //  按ID生成
            {
                publishParam.Type = PublishType.ContentIDEnum;  
                typeParam = new string[]{txtDetailId.Text.Trim()}; //内容ID 多个ID可由 , 分隔
            }
            else if (rbtnCreate4.Checked) //按更新时间段生成
            {
                typeParam = new string[2];

                publishParam.Type = PublishType.AddDateRange;  
                typeParam[0] = txtStartTime.Text.Trim();  // 起始时间
                typeParam[1] = txtEndTime.Text.Trim();    // 结束时间
            }

            if (!string.IsNullOrEmpty(menuNodeCode) && menuNodeCode.Trim() != "")
            {
                arrMenuNodeCode = menuNodeCode.Split(new char[] { ',' });

                foreach (string nodeCode in arrMenuNodeCode)
                {
                    if (nodeCode.Trim() != "")
                    {
                        lstMenu.Add(nodeCode);
                    }
                }
            }

            publishParam.PublishTypeParam = typeParam;
            publishParam.LstMenu = lstMenu;

            try
            {
                publish.Execute(publishParam);      // 执行发布
            }
            catch { }
        }
        #endregion

    }
}
