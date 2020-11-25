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
using AllPower.Common;
using AllPower.Web.Admin;
using AllPower.BLL;
using System.Net;
using System.IO;

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
    public partial class ServerMachineManage : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.ServerMachine bll = new AllPower.BLL.SysManage.ServerMachine();
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                //判断权限
                SetRight(this.Page, rptServerMachineList);
            }
        }
        #endregion 

        #region 绑定数据
        private void BindData()
        {
            rptServerMachineList.DataSource = bll.GetList("ALL", Utils.getOneParams(""));
            rptServerMachineList.DataBind();
        }
        #endregion

        #region 新增
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Utils.RunJavaScript(this, "openframe({ title: '新增发布服务器', url: 'ServerMachineEdit.aspx?Action=new&NodeCode=" + NodeCode + "', width: '400', height: '230' })");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有新增服务器的权限!',title:'提示信息'})");
            }
        }
        #endregion   
    
        #region 编辑
        public void ServerMachine_Edit(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                Utils.RunJavaScript(this, "openframe({ title: '新增发布服务器', url: 'ServerMachineEdit.aspx?Action=edit&ServerMachineName=" + e.CommandArgument.ToString() + "&NodeCode=" + NodeCode + "', width: '400', height: '230' })");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有修改服务器的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 删除
        protected void btndel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        public void ServerMachine_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        private void OnDel(string ServerMachineName)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                try
                {
                    bll.ServerMachineSet("DEL", "", ServerMachineName);
                    WriteLog(GetLogValue("删除发布服务器成功", "Del", "ServerMachineManage", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'删除发布服务器成功!',title:'提示信息'})");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有删除服务器的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 修改状态
        public void ServerMachine_State(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("State"))
            {
                try
                {
                    string[] strState = AllPower.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");
                    int iEnable = AllPower.Common.Utils.BoolToInt(strState[1]);
                    if (iEnable == 1)
                    {
                        iEnable = 0;
                    }
                    else
                    {
                        iEnable = 1;
                    }
                    bll.ServerMachineSet("STATE", iEnable.ToString(), strState[0]);
                    WriteLog(GetLogValue("修改发布服务器状态成功", "State", "ServerMachineManage", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'修改发布服务器状态成功!',title:'提示信息'})");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有修改服务器状态的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 测试连接
        public void ServerMachine_Test(object sender, CommandEventArgs e)
        {
            bool returnBool=false;
            DataRow dr = bll.GetList("ONE", Utils.getOneParams(e.CommandArgument.ToString())).Rows[0];
            switch (dr["ConnectionType"].ToString())
            {
                case ("Local"):
                    {
                        if (Directory.Exists(dr["LocalDirectoryPath"].ToString()))
                        {
                            returnBool = true;
                        }
                        break;
                    }
                case ("Ftp"):
                    {
                        if (CheckFtpPath(dr["FtpServer"].ToString(), dr["FtpUserName"].ToString(), dr["FtpPassword"].ToString(), dr["FtpPort"].ToString(), dr["FtpHomeDirectory"].ToString()))
                        {
                            returnBool = true;
                        }
                        break;
                    }
                case ("Network"):
                    {
                        if (Directory.Exists(dr["NetworkDirectoryPath"].ToString()))
                        {
                            returnBool = true;
                        }
                        break;
                    }
            }
            if (returnBool == true)
            {
                Utils.RunJavaScript(this, "alert({msg:'测试连接成功!',title:'提示信息'})");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'测试连接失败!',title:'提示信息'})");
            }
        }
        #endregion        

        #region 测试连接用到方法
        /// <summary>
        /// 测试ftp是否连接成功
        /// </summary>
        /// <returns>bool</returns>
        public bool CheckFtpPath(string FtpServer, string FtpUserName, string FtpPassword, string FtpPort, string FtpHomeDirectory)
        {
            FtpWebRequest ftpreq = (FtpWebRequest)FtpWebRequest.Create(new Uri(string.Format("ftp://{0}:{1}/{2}", FtpServer, FtpPort, FtpHomeDirectory)));
            ftpreq.Credentials = new NetworkCredential(FtpUserName, FtpPassword);
            ftpreq.Method = WebRequestMethods.Ftp.PrintWorkingDirectory;
            ftpreq.KeepAlive = false;
            try
            {
                ftpreq.GetResponse();
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion
       
    }
}
