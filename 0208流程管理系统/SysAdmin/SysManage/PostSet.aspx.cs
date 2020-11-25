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
//    功能描述： 邮件设置
 
//    更新日期        更新人      更新原因/内容
//
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class PostSet : AdminPage
    {
        PostConfig M_PostConfig = new PostConfig();
        //文件实际物理路径
        public string PhyFilePath = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath = "~/" + SiteDir + "/config/Post.config";
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
            Post.ConfigInfo = M_PostConfig;
            if (!File.Exists(PhyFilePath))
            {
                Post.SaveConfig(PhyFilePath);
            }
        }

        protected void BindDate()
        {
            M_PostConfig = Post.GetConfig(PhyFilePath);
            this.txtEmail.Text = M_PostConfig.Email;
            this.txtPassword.Text = M_PostConfig.Password;
            this.txtSmtpServer.Text = M_PostConfig.SmtpServer;
            this.txtPort.Text = M_PostConfig.Port;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                M_PostConfig.Email = this.txtEmail.Text;
                M_PostConfig.Password = DesSecurity.DesEncrypt(this.txtPassword.Text, "emailpwd");
                M_PostConfig.SmtpServer = this.txtSmtpServer.Text;
                M_PostConfig.Port = this.txtPort.Text;
                Post.ConfigInfo = M_PostConfig;
                bool b=Post.SaveConfig(PhyFilePath);
                if (!b)
                {
                    Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败，" + PhyFilePath.Replace("\\", "\\\\") + "文件没有修改权限!',status: '2', title: '提示信息', time: 10000, width: 400})");
                    return;
                }
                WriteLog("邮件参数设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'邮件参数设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改邮箱设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
