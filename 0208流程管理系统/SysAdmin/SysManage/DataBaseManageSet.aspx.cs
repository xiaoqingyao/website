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
//    创建时间： 2010年7月16日
//    功能描述： 数据库管理参数设置 
//    更新日期        更新人      更新原因/内容
===========================================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class DataBaseManageSet : AdminPage
    {
        #region 变量
        DataBaseManageConfig M_DataBaseManageConfig = new DataBaseManageConfig();
        //文件实际物理路径
        public string PhyFilePath = string.Empty;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            string FilePath = "~/SysAdmin/Configuraion/DataBaseManage.config";
            PhyFilePath = HttpContext.Current.Server.MapPath(FilePath);
            if (!Page.IsPostBack)
            {
                ResetConfig();
                BindDate();
            }            
        }
        #endregion

        #region 判断config文件是否存在，如果不存在重置config
        protected void ResetConfig()
        {
            AllPower.Config.DataBaseManage.ConfigInfo = M_DataBaseManageConfig;
            if (!File.Exists(PhyFilePath))
            {
                AllPower.Config.DataBaseManage.SaveConfig(PhyFilePath);
            }
        }
        #endregion

        #region 绑定数据
        protected void BindDate()
        {
            M_DataBaseManageConfig = AllPower.Config.DataBaseManage.GetConfig(PhyFilePath);
            txtServer.Text = M_DataBaseManageConfig.Server;
            txtUserName.Text = M_DataBaseManageConfig.UserName;
            txtPassWord.Text = M_DataBaseManageConfig.Password;
            txtBakFilePath.Text = M_DataBaseManageConfig.BakFilePath;
            txtSqlFilePath.Text = M_DataBaseManageConfig.SqlFilePath;
            txtDataBase.Text = M_DataBaseManageConfig.DataBase;
            hidDataBackFileList.Value = M_DataBaseManageConfig.DataBackFileList;
        }
        #endregion

        #region 保存数据到配置文件
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                M_DataBaseManageConfig.Server = txtServer.Text;
                M_DataBaseManageConfig.UserName = txtUserName.Text;
                M_DataBaseManageConfig.Password = txtPassWord.Text;
                M_DataBaseManageConfig.BakFilePath = txtBakFilePath.Text;
                M_DataBaseManageConfig.SqlFilePath = txtSqlFilePath.Text;
                M_DataBaseManageConfig.DataBase = txtDataBase.Text;
                string sqlFilePath = txtSqlFilePath.Text;
                M_DataBaseManageConfig.DataBackFileList = hidDataBackFileList.Value;
                if (sqlFilePath.IndexOf(":") == -1)
                {
                    sqlFilePath = Server.MapPath(sqlFilePath);
                }
                if (!Directory.Exists(sqlFilePath))
                {
                    try
                    {
                        Directory.CreateDirectory(sqlFilePath);
                    }
                    catch
                    {
                        Utils.RunJavaScript(this, "alert({msg:'数据库管理参数设置失败，Sql备份文件所在文件夹路径不正确，请重写填写!',status:2,title:'提示信息',width:350})");
                        return;
                    }
                }
                AllPower.Config.DataBaseManage.ConfigInfo = M_DataBaseManageConfig;
                bool b=AllPower.Config.DataBaseManage.SaveConfig(PhyFilePath);
                if (!b)
                {
                    Utils.RunJavaScript(this, "alert({msg:'站点信息设置失败，" + PhyFilePath.Replace("\\", "\\\\") + "文件没有修改权限!',status: '2', title: '提示信息', time: 10000, width: 400})");
                    return;
                }

                WriteLog("数据库管理参数设置成功！", "", 2);
                Utils.RunJavaScript(this, "alert({msg:'数据库管理参数设置成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有修改数据库设置的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
        #endregion


    }
}
