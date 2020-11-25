using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using AllPower.Web.Admin;
using AllPower.Config;
using AllPower.BLL.SysManage;
using AllPower.Common;

#region 版权注释
/*===========================================================================
//    Copyright (C) 2010 华强北在线
//    作者:      陈顺 
//    创建时间： 2010年5月27日
//    功能描述： 站点信息设置
 
//    更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SiteInfoSet : AdminPage
    {
        SiteInfoConfig M_SiteInfoConfig = new SiteInfoConfig();
        //文件实际物理路径
        public string PhyFilePath=string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath = "~/" + SiteDir + "/config/SiteInfo.config";        
            PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);
            if (!Page.IsPostBack)
            {
                ResetConfig();
                BindDate();
            }
        }

        //判断config文件是否存在，如果不存在重置config
        protected void ResetConfig()
        {
            SiteInfo.ConfigInfo = M_SiteInfoConfig;            
            if(!File.Exists(PhyFilePath))
            {
                SiteInfo.SaveConfig(PhyFilePath);
            }
        }

        protected void BindDate()
        {            
            M_SiteInfoConfig=SiteInfo.GetConfig(PhyFilePath);
            this.txtSiteName.Text = M_SiteInfoConfig.SiteName;
            this.txtSiteTitle.Text = M_SiteInfoConfig.SiteTitle;
            this.txtSiteURL.Text = M_SiteInfoConfig.SiteURL;
            this.txtCopyRight.Text = M_SiteInfoConfig.CopyRight;
            this.txtMetaKeywords.Text = M_SiteInfoConfig.MetaKeywords;
            this.txtMetaDescription.Text = M_SiteInfoConfig.MetaDescription;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                M_SiteInfoConfig.SiteName = this.txtSiteName.Text;
                M_SiteInfoConfig.SiteTitle = this.txtSiteTitle.Text;
                M_SiteInfoConfig.SiteURL = this.txtSiteURL.Text;
                M_SiteInfoConfig.CopyRight = this.txtCopyRight.Text;
                M_SiteInfoConfig.MetaKeywords = this.txtMetaKeywords.Text;
                M_SiteInfoConfig.MetaDescription = this.txtMetaDescription.Text;
                SiteInfo.ConfigInfo = M_SiteInfoConfig;
                bool b=SiteInfo.SaveConfig(PhyFilePath);
                if (!b)
                {
                    Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败，" + PhyFilePath.Replace ("\\","\\\\") + "文件没有修改权限!',status: '2', title: '提示信息', time: 10000, width: 400})");
                    return;
                }

                //修改DW校验码
                string siteLoginXml = Server.MapPath("/sysadmin/Configuraion/SiteInfoManage.config");
                string siteDwManage = Utils.XmlRead(siteLoginXml, "SiteInfoManage/SiteDWMange", "");
                string siteDwManageList = string.Empty;
                if (!string.IsNullOrEmpty(siteDwManage))
                {
                    bool isEditDw = false;
                    string[] arr1 = siteDwManage.Split('|');
                    for (int i = 0; i < arr1.Length; i++)
                    {
                        string[] arr2 = arr1[i].Split(',');
                        if (SiteID == Utils.ParseInt(arr2[0], 0))
                        {
                            string tmpDwManage = arr2[0] + "," + M_SiteInfoConfig.SiteName.Replace (",","") + "," + arr2[2];

                            if (string.IsNullOrEmpty(siteDwManageList))
                                siteDwManageList = tmpDwManage;
                            else
                                siteDwManageList += "|" + tmpDwManage;
                            isEditDw = true;
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(siteDwManageList))
                                siteDwManageList = arr1[i];
                            else
                                siteDwManageList += "|" + arr1[i];
                        }
                    }
                    if (isEditDw == false)
                    {
                        siteDwManageList += "|" + SiteID + "," + M_SiteInfoConfig.SiteName.Replace(",", "") + ",360hqb";
                    }
                }
                else
                {
                    siteDwManageList = SiteID + "," + M_SiteInfoConfig.SiteName.Replace(",", "") + ",360hqb";
                }

                Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/SiteDWMange", "", siteDwManageList);

                WriteLog("站点信息设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'站点信息设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改站点信息设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
