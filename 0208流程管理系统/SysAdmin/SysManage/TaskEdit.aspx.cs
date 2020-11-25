using System;
using System.Collections;
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
    功能描述： 任务计划管理
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TaskEdit : AdminPage
    {
        #region 变量成员
        AllPower.BLL.SysManage.SysTask bll = new AllPower.BLL.SysManage.SysTask();
        AllPower.Model.SysManage.SysTask model = new AllPower.Model.SysManage.SysTask();
        string TaskType = HttpContext.Current.Request.QueryString["TaskType"];
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                //绑定数据
                BindData();
                //编辑时赋值        
                if (Action == "EDIT")
                {
                    btnEdit.Text = Utils.GetResourcesValue("Common", "Update");                    

                    DataRow dr = bll.GetList("ONE", Utils.getOneParams(Utils.ReqUrlParameter("TaskName"))).Rows[0];
                    txtTaskName.Text = dr["TaskName"].ToString();
                    ddlFrequencyType.SelectedValue = dr["FrequencyType"].ToString();
                    switch (dr["FrequencyType"].ToString())
                    {
                        case ("Month"):
                            {
                                ddlStartDay.SelectedValue = dr["StartDay"].ToString();
                                ddlStartHour.SelectedValue = dr["StartHour"].ToString();
                                ddlStartDay.Enabled = true;
                                ddlStartWeekday.Enabled = false;
                                ddlStartHour.Enabled = true;
                                trFrequency.Visible = true;
                                trFrequency2.Visible = false;
                                break;
                            }
                        case ("Week"):
                            {
                                ddlStartWeekday.SelectedValue = dr["StartWeekday"].ToString();
                                ddlStartHour.SelectedValue = dr["StartHour"].ToString();
                                ddlStartDay.Enabled = false;
                                ddlStartWeekday.Enabled = true;
                                ddlStartHour.Enabled = true;
                                trFrequency.Visible = true;
                                trFrequency2.Visible = false;
                                break;
                            }
                        case ("Day"):
                            {
                                ddlStartHour.SelectedValue = dr["StartHour"].ToString();
                                ddlStartDay.Enabled = false;
                                ddlStartWeekday.Enabled = false;
                                ddlStartHour.Enabled = true;
                                trFrequency.Visible = true;
                                trFrequency2.Visible = false;
                                break;
                            }
                        case ("Hour"):
                            {
                                ddlStartDay.Enabled = false;
                                ddlStartWeekday.Enabled = false;
                                ddlStartHour.Enabled = false;
                                trFrequency.Visible = true;
                                trFrequency2.Visible = false;
                                break;
                            }
                        case ("Period"):
                            {
                                if (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) % (7 * 24 * 60) == 0)
                                {
                                    txtPeriodIntervalMinute.Text = (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) / (7 * 24 * 60)).ToString();
                                    ddlPeriod.SelectedValue = "Week";
                                }
                                else if (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) % (24 * 60) == 0)
                                {
                                    txtPeriodIntervalMinute.Text = (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) / (24 * 60)).ToString();
                                    ddlPeriod.SelectedValue = "Day";
                                }
                                else if (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) % 60 == 0)
                                {
                                    txtPeriodIntervalMinute.Text = (Utils.ParseInt(dr["PeriodIntervalMinute"].ToString(), 0) / 60).ToString();
                                    ddlPeriod.SelectedValue = "Hour";
                                }
                                else
                                {
                                    txtPeriodIntervalMinute.Text = dr["PeriodIntervalMinute"].ToString();
                                    ddlPeriod.SelectedValue = "Minute";
                                }
                                trFrequency.Visible = false;
                                trFrequency2.Visible = true;
                                break;
                            }
                    }
                    txtDescription.Text = dr["Description"].ToString();


                    //根据不同的任务类型显示不同的任务参数
                    switch (TaskType)
                    {
                        case ("Backup"):
                            {                                
                                break;
                            }
                        case ("Publish"):
                            {
                                //根据定义键得到对应值 并显示
                                ddlServerMachine.SelectedValue = getTaskParameters(dr["TaskParameters"].ToString())["ServerMachine"];
                                break;
                            }
                        case ("Create"):
                            {                                
                                break;
                            }
                        case ("Gather"):
                            {                                
                                break;
                            }
                    }

                    hiddSiteId.Value = dr["SiteId"].ToString();
                    hiddTaskType.Value = dr["TaskType"].ToString();
                    hiddIsEnabled.Value = dr["IsEnabled"].ToString();

                    txtTaskName.Enabled = false;
                }
            }

            //根据不同的任务类型显示不同的界面
            switch (TaskType)
            {
                case ("Backup"):
                    {
                        trPublish.Visible = false;
                        trCreate.Visible = false;
                        trGather.Visible = false;
                        break;
                    }
                case ("Publish"):
                    {
                        trPublish.Visible = true;
                        trCreate.Visible = false;
                        trGather.Visible = false;
                        break;
                    }
                case ("Create"):
                    {
                        trPublish.Visible = false;
                        trCreate.Visible = true;
                        trGather.Visible = false;
                        break;
                    }
                case ("Gather"):
                    {
                        trPublish.Visible = false;
                        trCreate.Visible = false;
                        trGather.Visible = true;
                        break;
                    }
            }
        }
        #endregion 

        #region 返回所有定时参数键值对
        private Dictionary<string, string> getTaskParameters(string TaskParameters)
        {
            Dictionary<string, string> DicTaskParameters = new Dictionary<string, string>();
            string[] arrTaskParameters = TaskParameters.Split('&');
            foreach (string s in arrTaskParameters)
            {
                string[] ss = s.Split('=');
                DicTaskParameters.Add(ss[0], ss[1]);
            }
            return DicTaskParameters;
        }
        #endregion        

        #region 绑定数据
        private void BindData()
        {
            //绑定开始时间
            BindStartTime();
            //绑定发布服务器列表
            BindddlServerMachine();
        }
        #endregion

        #region 数据绑定用到方法
        /// <summary>
        /// 绑定开始时间
        /// </summary>
        private void BindStartTime()
        { 
            //日期
            for (int i = 1; i <= 31; i++)
            {
                ddlStartDay.Items.Add(new ListItem(i.ToString() + "日", i.ToString()));
            }
            //星期
            for (int i = 0; i <= 23; i++)
            {
                ddlStartHour.Items.Add(new ListItem(i.ToString() + "点", i.ToString()));
            }
            ddlStartWeekday.Enabled = false;
            trFrequency2.Visible = false;
        }

        /// <summary>
        /// 绑定发布服务器列表
        /// </summary>
        private void BindddlServerMachine()
        {
            AllPower.BLL.SysManage.ServerMachine bllServerMachine = new AllPower.BLL.SysManage.ServerMachine();
            ddlServerMachine.DataSource = bllServerMachine.GetList("ALL", Utils.getOneParams("")).DefaultView;
            ddlServerMachine.DataValueField = "ServerMachineName";
            ddlServerMachine.DataTextField = "ServerMachineName";
            ddlServerMachine.DataBind();
        }
        #endregion

        #region 新增/编辑
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //给实体类赋值
            model.TaskName = txtTaskName.Text;
            model.FrequencyType = ddlFrequencyType.SelectedValue;
            model.Description = txtDescription.Text;
            model.NodeCode = NodeCode;
            switch (ddlFrequencyType.SelectedValue)
            {
                case ("Month"):
                    {
                        model.StartDay = Utils.ParseInt(ddlStartDay.SelectedValue,0);
                        model.StartHour = Utils.ParseInt(ddlStartHour.SelectedValue, 0);
                        break;
                    }
                case ("Week"):
                    {
                        model.StartWeekday = Utils.ParseInt(ddlStartWeekday.SelectedValue, 0);
                        model.StartHour = Utils.ParseInt(ddlStartHour.SelectedValue, 0);
                        break;
                    }
                case ("Day"):
                    {
                        model.StartHour = Utils.ParseInt(ddlStartHour.SelectedValue, 0);
                        break;
                    }
                case ("Hour"):
                    {
                        break;
                    }
                case ("Period"):
                    {
                        switch (ddlPeriod.SelectedValue)
                        {
                            case ("Minute"):
                                {
                                    model.PeriodIntervalMinute = Utils.ParseInt(txtPeriodIntervalMinute.Text, 0);
                                    break;
                                }
                            case ("Hour"):
                                {
                                    model.PeriodIntervalMinute = Utils.ParseInt(txtPeriodIntervalMinute.Text, 0)*60;
                                    break;
                                }
                            case ("Day"):
                                {
                                    model.PeriodIntervalMinute = Utils.ParseInt(txtPeriodIntervalMinute.Text, 0)*24*60;
                                    break;
                                }
                            case ("Week"):
                                {
                                    model.PeriodIntervalMinute = Utils.ParseInt(txtPeriodIntervalMinute.Text, 0)*7*24*60;
                                    break;
                                }
                        }
                        break;
                    }
            }

            //根据不同的任务类型保存不同的任务参数
            switch (TaskType)
            {
                case ("Backup"):
                    {
                        model.TaskParameters = "";
                        break;
                    }
                case ("Publish"):
                    {
                        //多个参数用"&"分隔
                        model.TaskParameters = string.Format("ServerMachine={0}", ddlServerMachine.SelectedValue);
                        break;
                    }
                case ("Create"):
                    {
                        model.TaskParameters = "";
                        break;
                    }
                case ("Gather"):
                    {
                        model.TaskParameters = "";
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
                    model.TaskType = TaskType;

                    bll.Save("NEW", model);
                    WriteLog(GetLogValue("新增计划任务成功", "New", "TaskEdit", true), "", 2); //写日志       
                    Utils.RunJavaScript(this, "alertClose({title:'提示信息',msg:'新增计划任务成功！'},function(){parent.location.href=parent.location.href;});");
                }
                //编辑
                else
                {
                    if (IsHaveRightByOperCode("Edit"))
                    {
                        model.SiteId = Utils.ParseInt(hiddSiteId.Value, 0);
                        model.IsEnabled = Utils.ParseBool(hiddIsEnabled.Value);
                        model.TaskType = hiddTaskType.Value;

                        bll.Save("EDIT", model);
                        WriteLog(GetLogValue("修改计划任务成功", "Edit", "TaskEdit", true), "", 2); //写日志       
                        Utils.RunJavaScript(this, "alertClose({title:'提示信息',msg:'修改计划任务成功！'},function(){parent.location.href=parent.location.href;});");
                    }
                }
            }
            catch (Exception exp)
            {
                Utils.RunJavaScript(this, "alert({msg:'" + exp.Message + "',title:'提示信息'})");
            }
        }
        #endregion

        #region 备份频率类型改变
        protected void ddlFrequencyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlFrequencyType.SelectedValue)
            {
                case ("Month"):
                    {
                        ddlStartDay.Enabled = true;
                        ddlStartWeekday.Enabled = false;
                        ddlStartHour.Enabled = true;
                        trFrequency.Visible = true;
                        trFrequency2.Visible = false;
                        break;
                    }
                case ("Week"):
                    {
                        ddlStartDay.Enabled = false;
                        ddlStartWeekday.Enabled = true;
                        ddlStartHour.Enabled = true;
                        trFrequency.Visible = true;
                        trFrequency2.Visible = false;
                        break;
                    }
                case ("Day"):
                    {
                        ddlStartDay.Enabled = false;
                        ddlStartWeekday.Enabled = false;
                        ddlStartHour.Enabled = true;
                        trFrequency.Visible = true;
                        trFrequency2.Visible = false;
                        break;
                    }
                case ("Hour"):
                    {
                        ddlStartDay.Enabled = false;
                        ddlStartWeekday.Enabled = false;
                        ddlStartHour.Enabled = false;
                        trFrequency.Visible = true;
                        trFrequency2.Visible = false;
                        break;
                    }
                case ("Period"):
                    {
                        trFrequency.Visible = false;
                        trFrequency2.Visible = true;
                        break;
                    }
            }
        }
        #endregion
        
    }
}
