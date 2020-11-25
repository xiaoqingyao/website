#region 引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Xml;
using System.Xml.XPath;

using AllPower.Web.Admin;
using AllPower.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年7月16日    功能描述： 采集任务编辑
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class TaskEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.Task task;
        protected string jsMessage;
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            task = new AllPower.BLL.Collection.Task();

            if (!IsPostBack)
            {
                PageInit();
            }

            if (this.Action.ToLower() == "edit")
            {
                if (string.IsNullOrEmpty(this.ID))
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='TaskList.aspx';})";
                }
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataTable dt;
            dt = task.GetHttpHeaderConfig();

            if (dt != null)
            {
                ddlCollectionHttpHeaderConfigID.DataTextField = "Name";
                ddlCollectionHttpHeaderConfigID.DataValueField = "ID";
                ddlCollectionHttpHeaderConfigID.DataSource = dt;
                ddlCollectionHttpHeaderConfigID.DataBind();
            }
            ddlCollectionHttpHeaderConfigID.Items.Insert(0, new ListItem("--------请选择---------", ""));

            if (this.Action.ToLower() == "edit")
            {
                btnSave.Text = "修改";
                txtEnName.Enabled = false;
                dt = task.GetByID(ID);

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr;

                    dr = dt.Rows[0];
                    txtName.Text = dr["Name"].ToString();
                    txtEnName.Text = dr["EnName"].ToString();
                    txtBrief.Text = dr["Brief"].ToString();
                    ddlEncodeType.SelectedValue = dr["EncodeType"].ToString();
                    txtHistoryHoldDays.Text = dr["HistoryHoldDays"].ToString();
                    txtMaxDownAmount.Text = dr["MaxDownAmount"].ToString();
                    chkIsEnabledThread.Checked = Utils.ParseBool(dr["IsEnabledThread"].ToString());
                    txtResourceWaitInterval.Text = dr["ResourceWaitInterval"].ToString();
                    txtTimeOut.Text = dr["TimeOut"].ToString();
                    txtWaitInterval.Text = dr["WaitInterval"].ToString();
                    txtWaitCount.Text = dr["WaitCount"].ToString();
                    chkIsLogin.Checked = Utils.ParseBool(dr["IsLogin"]);
                    chkIsSaveSpiderFile.Checked = Utils.ParseBool(dr["IsSaveSpiderFile"]);
                    txtUrlPrefix.Text = dr["UrlPrefix"].ToString();
                    txtImgSavePath.Text = dr["ImgSavePath"].ToString();
                    txtFlashSavePath.Text = dr["FlashSavePath"].ToString();
                    txtOtherSavePath.Text = dr["OtherSavePath"].ToString();
                    ddlCollectionHttpHeaderConfigID.SelectedValue = dr["CollectionHttpHeaderConfigID"].ToString();
                    txtTableNameList.Text = dr["TableNameList"].ToString();

                    if (Utils.ParseBool(dr["IsLogin"]))  // 登陆配置
                    {
                        ddlMethod.SelectedValue = dr["Method"].ToString();
                        txtLoginUrl.Text = dr["LoginUrl"].ToString();
                        txtUsernameControl.Text = dr["UsernameControl"].ToString();
                        txtUsername.Text = dr["Username"].ToString();
                        txtPasswordControl.Text = dr["PasswordControl"].ToString();
                        txtPassword.Text = dr["Password"].ToString();
                        txtLoginValidate.Text = dr["LoginValidate"].ToString();
                        txtLoginCookie.Text = dr["LoginCookie"].ToString();
                    }
                }
            }
        }
        #endregion

        #region 保存/更新
        protected void Save(object sender, EventArgs e)
        {
            AllPower.Model.Collection.Task mTask;
            string transType;                       // 操作类型
            string msg;                             // 操作结果

            mTask = new AllPower.Model.Collection.Task();
            transType = "NEW";

            if (this.Action.ToLower() == "edit")         // 编辑
            {
                mTask.ID = this.ID;
                transType = "EDIT";
            }
            else // 添加
            {
                mTask.AddMan = this.UserNo;
            }

            mTask.Name = txtName.Text.Trim();
            mTask.EnName = txtEnName.Text.Trim();
            mTask.Brief = txtBrief.Text.Trim();
            mTask.EncodeType = ddlEncodeType.SelectedValue;
            mTask.HistoryHoldDays = Utils.ParseInt(txtHistoryHoldDays.Text.Trim(), 0);
            mTask.MaxDownAmount = Utils.ParseInt(txtMaxDownAmount.Text.Trim(), 0);
            mTask.IsEnabledThread = chkIsEnabledThread.Checked;
            mTask.ResourceWaitInterval = Utils.ParseInt(txtResourceWaitInterval.Text.Trim(),1000);
            mTask.TimeOut = Utils.ParseFloat(txtTimeOut.Text.Trim(), 0);
            mTask.WaitInterval = Utils.ParseFloat(txtWaitInterval.Text.Trim(), 0);
            mTask.WaitCount = Utils.ParseInt(txtWaitCount.Text.Trim(), 0);
            mTask.IsLogin = chkIsLogin.Checked;
            mTask.IsSaveSpiderFile = chkIsSaveSpiderFile.Checked;
            mTask.UrlPrefix = txtUrlPrefix.Text;
            mTask.ImgSavePath = txtImgSavePath.Text;
            mTask.FlashSavePath = txtFlashSavePath.Text;
            mTask.OtherSavePath = txtOtherSavePath.Text;
            mTask.CollectionHttpHeaderConfigID = ddlCollectionHttpHeaderConfigID.SelectedValue;
            mTask.TableNameList = txtTableNameList.Text;

            if (mTask.IsLogin)  // 登陆配置
            {
                mTask.Method = ddlMethod.SelectedValue;
                mTask.LoginUrl = txtLoginUrl.Text.Trim();
                mTask.UsernameControl = txtUsernameControl.Text.Trim();
                mTask.Username = txtUsername.Text;
                mTask.PasswordControl = txtPasswordControl.Text.Trim();
                mTask.Password = txtPassword.Text;
                mTask.LoginValidate = txtLoginValidate.Text;
                mTask.LoginCookie = txtLoginCookie.Text;
            }

            msg = task.Save(transType, mTask);

            if (msg == "1")
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alertClose({msg:\"恭喜您，更新成功！\",title:\"操作提示\"},function(){location.href='TaskList.aspx';});";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，操作成功，是否继续添加？\")){location.href=\"TaskList.aspx\";}";
                }
            }
            else
            {
                if (msg == "-100")
                {
                    jsMessage += "alert({msg:\"数据保存成功，但创建目录过程中发生异常,请确定相应目录是否可写。\",title:\"操作提示\"});";
                }
                else
                {
                    jsMessage += "alert({msg:'对不起，操作失败，请重试。',title:'操作提示'});";
                }
            }
        }
        #endregion
    }
}
