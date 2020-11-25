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
    功能描述： 定时任务管理
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TaskManage : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.SysTask bll = new AllPower.BLL.SysManage.SysTask();
        string TaskType = HttpContext.Current.Request.QueryString["TaskType"];
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                //判断权限
                SetRight(this.Page, rptTaskList);
            }
        }
        #endregion

        #region 绑定数据
        private void BindData()
        {
            rptTaskList.DataSource = bll.GetList("TASKTYPE", Utils.getOneParams(TaskType));
            rptTaskList.DataBind();
        }
        #endregion

        #region 新增
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                Utils.RunJavaScript(this, "openframe({ title: '新增任务计划', url: 'TaskEdit.aspx?TaskType=" + TaskType + "&Action=new&NodeCode=" + NodeCode + "', width: '400', height: '230' })");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有新增新增任务计划的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 编辑
        public void Task_Edit(object sender, CommandEventArgs e)
        {
            if (IsHaveRightByOperCode("Edit"))
            {
                Utils.RunJavaScript(this, "openframe({ title: '新增任务计划', url: 'TaskEdit.aspx?TaskType=" + TaskType + "&Action=edit&TaskName=" + e.CommandArgument.ToString() + "&NodeCode=" + NodeCode + "', width: '400', height: '230' })");
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有新增任务计划的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 删除
        protected void btndel_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"].Replace(", ", ","));
        }

        public void Task_Del(object sender, CommandEventArgs e)
        {
            OnDel(e.CommandArgument.ToString());
        }

        private void OnDel(string ServerMachineName)
        {
            if (IsHaveRightByOperCode("Delete"))
            {
                try
                {
                    bll.SysTaskSet("DEL", "", ServerMachineName);
                    WriteLog(GetLogValue("删除计划任务成功", "Del", "TaskManage", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'删除计划任务成功!',title:'提示信息'})");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有删除计划任务的权限!',title:'提示信息'})");
            }
        }
        #endregion

        #region 修改状态
        public void Task_State(object sender, CommandEventArgs e)
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
                    bll.SysTaskSet("STATE", iEnable.ToString(), strState[0]);
                    WriteLog(GetLogValue("修改计划任务状态成功", "State", "TaskManage", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alert({msg:'修改计划任务状态成功!',title:'提示信息'})");
                }
                catch (Exception exp)
                {
                    Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'您没有修改计划任务状态的权限!',title:'提示信息'})");
            }
        }
        #endregion
    }
}
