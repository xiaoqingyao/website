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
//    功能描述： 站点参数设置
 
//    更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SiteParamSet : AdminPage
    {
        SiteParamConfig M_SiteParamConfig = new SiteParamConfig();
        //文件实际物理路径
        public string PhyFilePath = string.Empty;
        public bool isMainDomain = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath;
            if(SiteDir=="")
            {
                FilePath = "~/" +GetVirtualPath + "config/SiteParam.config";
            }
            else
            {
                FilePath = "~/" +GetVirtualPath+ SiteDir + "/config/SiteParam.config";
            }

            PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);
            AllPower.BLL.SysManage.SysWebSite siteBll = new SysWebSite();
            DataTable dt = siteBll.GetList("One", Utils.getOneParams(SiteID.ToString()));
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["IsMainSite"].ToString() == "True")
                {
                    isMainDomain = true;
                }
            }
            if (!Page.IsPostBack)
            {
                ResetConfig();
                BindDate();
            }

        }


        //判断config文件是否存在，如果不存在重置config
        protected void ResetConfig()
        {
            SiteParam.ConfigInfo = M_SiteParamConfig;
            if (!File.Exists(PhyFilePath))
            {
                SiteParam.SaveConfig(PhyFilePath);
            }
        }

        protected void BindDate()
        {
            string siteLoginXml = Server.MapPath("/sysadmin/Configuraion/SiteInfoManage.config");
            if (isMainDomain == false)  //非主站
            {
                dlManageDir.Visible = false;
                dlIsRZM.Visible = false;
                dlRZMCode.Visible = false;
            }
            else
            {
                string IsEnableManageCode = Utils.XmlRead(siteLoginXml, "SiteInfoManage/IsEnableManageCode", "");
                string ManageDir = Utils.XmlRead(siteLoginXml, "SiteInfoManage/ManageDir", "");
                string ManageCode = Utils.XmlRead(siteLoginXml, "SiteInfoManage/ManageCode", "");
                if (IsEnableManageCode == "1")
                {
                    this.RadTrue.Checked = true;
                    this.txtManageCode.Text = ManageCode;
                }
                else
                {
                    this.RadFalse.Checked = true;
                }
                this.txtManageDir.Text = ManageDir;
            }
            
            //DW API 验证码
            string siteDwManage = Utils.XmlRead(siteLoginXml, "SiteInfoManage/SiteDWMange", "");
            if (!string.IsNullOrEmpty(siteDwManage))
            {
                string[] arr1 = siteDwManage.Split('|');
                for (int i = 0; i < arr1.Length; i++)
                {
                    string[] arr2 = arr1[i].Split(',');
                    if (SiteID == Utils.ParseInt(arr2[0], 0))
                    {
                        txtSiteDWMange.Text = arr2[2];
                        break;
                    }
                }
            }
            else
            {
                txtSiteDWMange.Text = "360hqb";
            }

            M_SiteParamConfig = SiteParam.GetConfig(PhyFilePath);
            this.txtSiteRootURL.Text = M_SiteParamConfig.SiteRootURL;
            this.txtSiteDir.Text = M_SiteParamConfig.SiteDir;
            hidSiteDir.Value = M_SiteParamConfig.SiteDir;
            this.txtSiteDomain.Text = M_SiteParamConfig.SiteDomain;
            //this.txtSiteTempletDir.Text = M_SiteParamConfig.SiteTempletDir;
            this.txtDisUserName.Text = M_SiteParamConfig.DisUserName;
            this.ddlEditControl.SelectedValue = M_SiteParamConfig.EditControl;
            this.ddlLogType.SelectedValue = M_SiteParamConfig.LogType;
            if (!isMainDomain)
            {
                dlmainSiteDir.Attributes.Add("style", "display:none");
                txtSiteDir.Enabled = false;
            }
            else
            {
                if (M_SiteParamConfig.SiteDir == "")
                {
                    radMainSiteDir0.Checked = true;
                }
                else
                {
                    radMainSiteDir1.Checked = true;
                }
                dlSiteDir.Visible =false;
            }
            string fileExt = M_SiteParamConfig.CreateFileExt;
            switch (fileExt)
            {
                case "shtml":
                    this.selCreateFileExt.SelectedIndex = 1;
                    break;
                case "htm":
                    this.selCreateFileExt.SelectedIndex = 2;
                    break;
                case "shtm":
                    this.selCreateFileExt.SelectedIndex = 3;
                    break;
                case "aspx":
                    this.selCreateFileExt.SelectedIndex = 4;
                    break;
            }
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                string siteLoginXml = Server.MapPath("/sysadmin/Configuraion/SiteInfoManage.config");
                if (isMainDomain)
                {
                    
                    if (this.RadTrue.Checked)
                    {
                        if (this.txtManageCode.Text.Trim() == "")
                        {
                            Utils.RunJavaScript(this, "alert({msg:'站点参数设置失败，后台管理认证码必须填写!',title:'提示信息'})");
                            return;
                        }
                        Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/IsEnableManageCode", "", "1");
                        Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/ManageCode", "", this.txtManageCode.Text);
                    }
                    else
                    {
                        Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/IsEnableManageCode", "", "0");
                    }
                    Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/ManageDir", "", this.txtManageDir.Text);
                    AppCache.Remove("CacheManageDir");
                    AppCache.AddCache("CacheManageDir", this.txtManageDir.Text, 144000);
                }
                string thisDwManage = Server.HtmlEncode(txtSiteDWMange.Text.Trim ());
                if (string.IsNullOrEmpty(thisDwManage))
                {
                    thisDwManage = "360hqb";
                }
                thisDwManage = thisDwManage.Replace(",", "");

                //修改DW校验码
                string siteDwManage = Utils.XmlRead(siteLoginXml, "SiteInfoManage/SiteDWMange", "");
                string siteDwManageList = string.Empty;
                bool isEditDwManage = false;
                if (!string.IsNullOrEmpty(siteDwManage))
                {
                    string[] arr1 = siteDwManage.Split('|');
                    for (int i = 0; i < arr1.Length; i++)
                    {
                        string[] arr2 = arr1[i].Split(',');
                        if (SiteID == Utils.ParseInt(arr2[0], 0))
                        {
                            string tmpDwManage = arr2[0] + "," + arr2[1] + "," + thisDwManage;

                            if (string.IsNullOrEmpty(siteDwManageList))
                                siteDwManageList = tmpDwManage;
                            else
                                siteDwManageList += "|" + tmpDwManage;
                            isEditDwManage = true;
                        }
                        else
                        {
                            if (string.IsNullOrEmpty(siteDwManageList))
                                siteDwManageList = arr1[i];
                            else
                                siteDwManageList += "|" + arr1[i];
                        }
                    }
                }
                
                if(string.IsNullOrEmpty (siteDwManage)|| isEditDwManage==false)
                {
                    string siteInfoXml=Server.MapPath("/"+SiteDir+"/config/SiteInfo.config");

                    if (!string.IsNullOrEmpty(siteDwManage))
                        siteDwManageList +="|"+ SiteID + "," + Utils.XmlRead(siteInfoXml, "SiteInfoConfig/SiteName", "") + "," + thisDwManage;
                    else
                        siteDwManageList =  SiteID + "," + Utils.XmlRead(siteInfoXml, "SiteInfoConfig/SiteName", "") + "," + thisDwManage;
                }
                Utils.XmlUpdate(siteLoginXml, "SiteInfoManage/SiteDWMange", "", siteDwManageList);

                string siteOldDir = hidSiteDir.Value.ToLower().Trim ();
                string siteNewDir = "";
                M_SiteParamConfig.SiteRootURL = this.txtSiteRootURL.Text;
                M_SiteParamConfig.SiteDir = siteNewDir;
                //M_SiteParamConfig.SiteTempletDir = this.txtSiteTempletDir.Text;
                M_SiteParamConfig.SiteDomain = this.txtSiteDomain.Text;
                M_SiteParamConfig.DisUserName = this.txtDisUserName.Text;
                M_SiteParamConfig.EditControl = this.ddlEditControl.SelectedValue;
                M_SiteParamConfig.LogType = this.ddlLogType.SelectedValue;
                M_SiteParamConfig.CreateFileExt = Request.Form["selCreateFileExt"];
                SiteParam.ConfigInfo = M_SiteParamConfig;
                

                if (isMainDomain)  //如果是主站，则可以修改文件生成目录（为空或者main）
                {
                    if (radMainSiteDir1.Checked)
                    {
                        siteNewDir = "main";
                    }
                    if (siteOldDir != siteNewDir)  //修改了生成目录
                    {
                        try
                        {
                            if (siteNewDir == "main")  //生成在main目录中
                            {
                                if (!Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "main")))  //判断是否有main目录
                                {
                                    Directory.CreateDirectory(Server.MapPath("~/" + GetVirtualPath + "main"));  //创建main目录
                                }
                                else if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "main/config")))
                                {
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "main/config"), true);
                                }
                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "config"), Server.MapPath("~/" + GetVirtualPath + "main/config"));  //将配置文件移动到main目录

                                if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "main/Plus")))
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "main/Plus"), true);
                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "Plus"), Server.MapPath("~/" + GetVirtualPath + "main/Plus"));

                                if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "main/IncludeFile")))
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "main/IncludeFile"), true);
                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "IncludeFile"), Server.MapPath("~/" + GetVirtualPath + "main/IncludeFile"));

                                PhyFilePath = HttpContext.Current.Server.MapPath("~/" + GetVirtualPath  + "main/config/SiteParam.config");

                                //File.Copy(Server.MapPath("~/" + GetVirtualPath + "web.config"), Server.MapPath("~/" + GetVirtualPath + "main/web.config"), true);  //拷贝web.config到main目录
                            }
                            else if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "main/config")))  //生成在根目录中，判断有没有有main/config/目录
                            {
                                if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "config")))
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "config"), true);

                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "main/config"), Server.MapPath("~/" + GetVirtualPath + "config"));  //移动main中的配置文件到根目录

                                if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "Plus")))
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "Plus"), true);
                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "main/Plus"), Server.MapPath("~/" + GetVirtualPath + "Plus"));

                                if (Directory.Exists(Server.MapPath("~/" + GetVirtualPath + "IncludeFile")))
                                    Directory.Delete(Server.MapPath("~/" + GetVirtualPath + "IncludeFile"), true);
                                Directory.Move(Server.MapPath("~/" + GetVirtualPath + "main/IncludeFile"), Server.MapPath("~/" + GetVirtualPath + "IncludeFile"));

                                PhyFilePath = HttpContext.Current.Server.MapPath("~/" + GetVirtualPath + "config/SiteParam.config");
                            }

                            //更新数据库中的Directory值
                            AllPower.BLL.SysManage.SysWebSite siteBll = new SysWebSite();
                            siteBll.SysWebSiteSet("EDITDIR", SiteID.ToString(), siteNewDir);
                            Session["SiteDir"] = siteNewDir;
                        }
                        catch
                        {
                            Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败!',status: '2', title: '提示信息', time: 10000, width: 400})");
                            return;
                        }
                    }
                }
                bool b = SiteParam.SaveConfig(PhyFilePath);
                if (!b)
                {
                    Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败，" + PhyFilePath.Replace("\\", "\\\\") + "文件没有修改权限!',status: '2', title: '提示信息', time: 10000, width: 400})");
                    return;
                }
                WriteLog("站点参数设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'站点参数设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改站点参数设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
