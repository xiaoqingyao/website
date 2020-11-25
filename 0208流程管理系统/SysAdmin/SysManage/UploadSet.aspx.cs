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
//    功能描述： 上传文件设置
 
//    更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class UploadSet : AdminPage
    {
        UploadConfig M_UploadConfig = new UploadConfig();
        //文件实际物理路径
        public string PhyFilePath = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath = "~/" + SiteDir + "/config/Upload.config";
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
            AllPower.Config.Upload.ConfigInfo = M_UploadConfig;
            if (!File.Exists(PhyFilePath))
            {
                AllPower.Config.Upload.SaveConfig(PhyFilePath);
            }
        }

        protected void BindDate()
        {
            M_UploadConfig = AllPower.Config.Upload.GetConfig(PhyFilePath);
            if (M_UploadConfig.IsEnableUpload == "1")
            {
                RadTrue.Checked = true;
            }
            else
            {
                RadFalse.Checked = true;
            }
            ddluploadControl.SelectedValue = M_UploadConfig.UploadControl;
            txtimageUrl.Text = M_UploadConfig.ImageUrl;
            txtimageSavePath.Text = M_UploadConfig.ImageSavePath;
            txtfileUrl.Text = M_UploadConfig.FileUrl;
            txtfileSavePath.Text = M_UploadConfig.FileSavePath;
            txtmediaUrl.Text = M_UploadConfig.MediaUrl;
            txtmediaSavePath.Text = M_UploadConfig.MediaSavePath;
            txtuploadImageSize.Text = M_UploadConfig.UploadImageSize;
            txtuploadImageType.Text = M_UploadConfig.UploadImageType;
            txtuploadFilesSize.Text = M_UploadConfig.UploadFilesSize;
            txtuploadFilesType.Text = M_UploadConfig.UploadFilesType;
            txtuploadMediaSize.Text = M_UploadConfig.UploadMediaSize;
            txtuploadMediaType.Text = M_UploadConfig.UploadMediaType;
            txtthumbnailWidth.Text = M_UploadConfig.ThumbnailWidth;
            txtthumbnailHeight.Text = M_UploadConfig.ThumbnailHeight;
            if (M_UploadConfig.IsEnableWatermark == "1")
            {
                RadWatermarkTrue.Checked = true;
            }
            else
            {
                RadWatermarkFalse.Checked = true;
            }
            ddlwatermarkType.SelectedValue = M_UploadConfig.WatermarkType;
            txtwatermarkPic.Text = M_UploadConfig.WatermarkPic;
            txtwatermarkText.Text = M_UploadConfig.WatermarkText;
            txtwatermarkFontSize.Text = M_UploadConfig.WatermarkFontSize;
            txtwatermarkFontType.Text = M_UploadConfig.WatermarkFontType;
            ddlwatermarkFontStyle.SelectedValue = M_UploadConfig.WatermarkFontStyle;
            txtwatermarkFontBorder.Text = M_UploadConfig.WatermarkFontBorder;
            this.ColorCode.Value = M_UploadConfig.WatermarkFontBorderColor;
            this.ColorCode2.Value = M_UploadConfig.WatermarkFontColor;
            txtwatermarkTransparency.Text = M_UploadConfig.WatermarkTransparency;
            ddlwatermarkLocation.SelectedValue = M_UploadConfig.WatermarkLocation;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
             if (IsHaveRightByOperCode("Edit"))
            {
                if (RadTrue.Checked)
                {
                    M_UploadConfig.IsEnableUpload = "1";
                }
                else
                {
                    M_UploadConfig.IsEnableUpload = "0";
                }
                M_UploadConfig.UploadControl = ddluploadControl.SelectedValue;
                M_UploadConfig.ImageUrl = txtimageUrl.Text;
                M_UploadConfig.ImageSavePath = txtimageSavePath.Text;
                M_UploadConfig.FileUrl = txtfileUrl.Text;
                M_UploadConfig.FileSavePath = txtfileSavePath.Text;
                M_UploadConfig.MediaUrl = txtmediaUrl.Text;
                M_UploadConfig.MediaSavePath = txtmediaSavePath.Text;
                M_UploadConfig.UploadImageSize = txtuploadImageSize.Text;
                M_UploadConfig.UploadImageType = txtuploadImageType.Text;
                M_UploadConfig.UploadFilesSize = txtuploadFilesSize.Text;
                M_UploadConfig.UploadFilesType = txtuploadFilesType.Text;
                M_UploadConfig.UploadMediaSize = txtuploadMediaSize.Text;
                M_UploadConfig.UploadMediaType = txtuploadMediaType.Text;
                M_UploadConfig.ThumbnailWidth = txtthumbnailWidth.Text;
                M_UploadConfig.ThumbnailHeight = txtthumbnailHeight.Text;
                if (RadWatermarkTrue.Checked)
                {
                    M_UploadConfig.IsEnableWatermark = "1";
                }
                else
                {
                    M_UploadConfig.IsEnableWatermark = "0";
                }
                M_UploadConfig.WatermarkType = ddlwatermarkType.SelectedValue;
                M_UploadConfig.WatermarkPic = txtwatermarkPic.Text;
                M_UploadConfig.WatermarkText = txtwatermarkText.Text;
                M_UploadConfig.WatermarkFontSize = txtwatermarkFontSize.Text;
                M_UploadConfig.WatermarkFontType = txtwatermarkFontType.Text;
                M_UploadConfig.WatermarkFontStyle = ddlwatermarkFontStyle.SelectedValue;
                M_UploadConfig.WatermarkFontBorder = txtwatermarkFontBorder.Text;
                M_UploadConfig.WatermarkFontBorderColor = this.ColorCode.Value;
                M_UploadConfig.WatermarkFontColor = this.ColorCode2.Value;
                M_UploadConfig.WatermarkTransparency = txtwatermarkTransparency.Text;
                M_UploadConfig.WatermarkLocation = ddlwatermarkLocation.SelectedValue;
                AllPower.Config.Upload.ConfigInfo = M_UploadConfig;
                bool b=AllPower.Config.Upload.SaveConfig(PhyFilePath);
                if (!b)
                {
                    Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败，" + PhyFilePath.Replace("\\", "\\\\") + "文件没有修改权限!',status: '2', title: '提示信息', time: 10000, width: 400})");
                    return;
                }

                WriteLog("上传文件参数设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'上传文件参数设置成功!',title:'提示信息'})");
            }
             else
             {
                 Utils.RunJavaScript(this, "alert({msg:'你没有修改上传图片设置的权限，请联系站点管理员！',title:'提示信息'})");
             }
        }
    }
}
