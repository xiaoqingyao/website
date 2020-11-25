using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL;
using AllPower.Web.Admin;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年7月27日
    功能描述： 发布服务器管理
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class ServerMachineEdit : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.ServerMachine bll = new AllPower.BLL.SysManage.ServerMachine();
        AllPower.Model.SysManage.ServerMachine model = new AllPower.Model.SysManage.ServerMachine();
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //编辑时赋值        
                if (Action == "EDIT")
                {
                    btnEdit.Text = Utils.GetResourcesValue("Common", "Update");

                    DataRow dr = bll.GetList("ONE", Utils.getOneParams(Utils.ReqUrlParameter("ServerMachineName"))).Rows[0];
                    txtServerMachineName.Text = dr["ServerMachineName"].ToString();                    
                    ddlConnectionType.SelectedValue = dr["ConnectionType"].ToString();
                    txtLocalDirectoryPath.Text = dr["LocalDirectoryPath"].ToString();
                    txtNetworkDirectoryPath.Text = dr["NetworkDirectoryPath"].ToString();
                    txtFtpServer.Text = dr["FtpServer"].ToString();
                    txtFtpPort.Text = dr["FtpPort"].ToString();
                    txtFtpUserName.Text = dr["FtpUserName"].ToString();
                    txtFtpPassword.Text = dr["FtpPassword"].ToString();
                    txtFtpHomeDirectory.Text = dr["FtpHomeDirectory"].ToString();

                    hiddSiteId.Value = dr["SiteId"].ToString();
                    hiddServiceType.Value = dr["ServiceType"].ToString();
                    hiddIsEnabled.Value = dr["IsEnabled"].ToString();

                    txtServerMachineName.Enabled = false;
                    Utils.RunJavaScript(this, "TypeChange('"+ddlConnectionType.SelectedValue+"')");
                }
            }
        }
        #endregion 

        #region 新增/编辑
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //给实体类赋值
            model.NodeCode = NodeCode;
            switch (ddlConnectionType.SelectedValue)
            {
                case ("Local"):
                    {
                        model.ServerMachineName = txtServerMachineName.Text;
                        model.ConnectionType = "Local";
                        model.LocalDirectoryPath = txtLocalDirectoryPath.Text;
                        break;
                    }
                case ("Network"):
                    {
                        model.ServerMachineName = txtServerMachineName.Text;
                        model.ConnectionType = "Network";
                        model.NetworkDirectoryPath = txtNetworkDirectoryPath.Text;
                        break;
                    }
                case ("Ftp"):
                    {
                        model.ServerMachineName = txtServerMachineName.Text;
                        model.ConnectionType = "Ftp";
                        model.FtpServer = txtFtpServer.Text;
                        model.FtpUserName = txtFtpUserName.Text;
                        model.FtpPassword = txtFtpPassword.Text;
                        model.FtpPort = txtFtpPort.Text;
                        model.FtpHomeDirectory = txtFtpHomeDirectory.Text;
                        break;
                    }
            }
            try
            {
                //新增
                if (Action == "NEW" && IsHaveRightByOperCode("New"))
                {
                    model.SiteId = this.SiteID;
                    model.IsEnabled = true;
                    model.ServiceType = "Publish";

                    bll.Save("NEW", model);
                    WriteLog(GetLogValue("新增发布服务器成功", "New", "ServerMachineEdit", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alertClose({title:'提示信息',msg:'新增发布服务器成功！'},function(){parent.location.href=parent.location.href;});");
                }
                //编辑
                else
                {
                    if (IsHaveRightByOperCode("Edit"))
                    {
                        model.SiteId = Utils.ParseInt(hiddSiteId.Value, 0);
                        model.IsEnabled = Utils.ParseBool(hiddIsEnabled.Value);
                        model.ServiceType = hiddServiceType.Value; 

                        bll.Save("EDIT", model);
                        WriteLog(GetLogValue("修改发布服务器成功", "Edit", "ServerMachineEdit", true), "", 2); //写日志       
                        Utils.RunJavaScript(this, "alertClose({title:'提示信息',msg:'修改发布服务器成功！'},function(){parent.location.href=parent.location.href;});");
                    }
                }
            }
            catch (Exception exp)
            {
                Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
            }
        }
        #endregion
        
    }
}
