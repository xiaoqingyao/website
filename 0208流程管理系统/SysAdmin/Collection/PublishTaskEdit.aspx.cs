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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年8月18日    功能描述： 发布任务编辑
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Collection
{
    public partial class PublishTaskEdit : AdminPage
    {
        #region 变量成员
        private BLL.Collection.PublishTask publishTask;
        protected string jsMessage;
        protected string opType;                        // 操作类型
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            publishTask = new AllPower.BLL.Collection.PublishTask();
            opType = "Add";

            if (!IsPostBack)
            {
                PageInit();
            }

            if (this.Action.ToLower() == "edit")
            {
                if (string.IsNullOrEmpty(this.ID))
                {
                    jsMessage += "alertClose({title:\"操作提示\",msg:\"参数丢失，请重试。\"},function(data){location.href='PublishTaskList.aspx';})";
                }
            }
        }
        #endregion

        #region 初始加载
        private void PageInit()
        {
            DataTable dt;

            publishTask.CollectionTaskBind(ddlCollectionTaskID);

            if (this.Action.ToLower() == "edit")
            {
                btnSave.Text = "修改";
                dt = publishTask.GetByID(ID);
                opType = "Edit";

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr;

                    dr = dt.Rows[0];
                    ddlDBType.SelectedValue = dr["DBType"].ToString();
                    txtDBEncodeType.Text = dr["DBEncodeType"].ToString();
                    txtDMCode.Text = dr["DMCode"].ToString();
                    txtHostName.Text = dr["HostName"].ToString();
                    txtHostPort.Text = dr["HostPort"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                    txtUsername.Text = dr["Username"].ToString();
                    ddlCollectionTaskID.SelectedValue = dr["CollectionTaskID"].ToString();
                    txtBatchAmount.Text = dr["BatchAmount"].ToString();
                    txtDBName.Text = dr["DBName"].ToString();

                    if (dr["HostName"].ToString().Trim() == "")  // 当前站点
                    {
                        ddlPublishType.SelectedValue = "1";
                        txtOtherDir.Text = dr["OtherDir"].ToString();
                        txtImageDir.Text = dr["ImageDir"].ToString();
                        txtFlashDir.Text = dr["FlashDir"].ToString();
                    }
                    else
                    {
                        ddlPublishType.SelectedValue = "2";
                    }

                    if (Utils.ParseBool(dr["IsDataSourceDel"].ToString()))
                    {
                        radlIsDataSourceDel.SelectedValue = "1";
                    }
                    else
                    {
                        radlIsDataSourceDel.SelectedValue = "0";
                    }
                }
            }
        }
        #endregion

        #region 保存/更新
        protected void Save(object sender, EventArgs e)
        {
            AllPower.Model.Collection.PublishTask mPublishTask;
            string transType;                       // 操作类型
            string msg;                             // 操作结果

            mPublishTask = new AllPower.Model.Collection.PublishTask();
            transType = "NEW";

            if (this.Action.ToLower() == "edit")         // 编辑
            {
                mPublishTask.ID = this.ID;
                transType = "EDIT";
            }
            else // 添加
            {
                mPublishTask.AddMan = this.UserNo;
                mPublishTask.ID = Guid.NewGuid().ToString();
            }

            mPublishTask.DMCode = txtDMCode.Text.Trim();
            mPublishTask.Name = txtName.Text.Trim();
            mPublishTask.IsDataSourceDel = Utils.ParseBool(radlIsDataSourceDel.SelectedValue);
            mPublishTask.BatchAmount = Utils.ParseInt(txtBatchAmount.Text.Trim(), 10);
            mPublishTask.CollectionTaskID = ddlCollectionTaskID.SelectedValue;
            mPublishTask.DBType = Utils.ParseInt(ddlDBType.SelectedValue, 1);

            if (ddlPublishType.SelectedValue == "2") // 发布至其它位置
            {
                mPublishTask.HostName = txtHostName.Text.Trim();
                mPublishTask.HostPort = txtHostPort.Text.Trim();
                mPublishTask.Password = txtPassword.Text.Trim();
                mPublishTask.Username = txtUsername.Text.Trim();
                mPublishTask.DBEncodeType = txtDBEncodeType.Text.Trim();
                mPublishTask.DBName = txtDBName.Text.Trim();
            }
            else
            {
                mPublishTask.ImageDir = txtImageDir.Text.Trim();
                mPublishTask.FlashDir = txtFlashDir.Text.Trim();
                mPublishTask.OtherDir = txtOtherDir.Text.Trim();
            }

            msg = publishTask.Save(transType, mPublishTask);

            if (msg == "1")
            {
                if (this.Action.ToLower() == "edit")
                {
                    jsMessage += "alertClose({msg:\"恭喜您，更新成功！\",title:\"操作提示\"},function(){location.href='PublishTaskList.aspx';});";
                }
                else
                {
                    jsMessage += "if(!window.confirm(\"恭喜您，操作成功，是否继续添加？\")){location.href=\"PublishTaskList.aspx\";}";
                }
            }
            else
            {
                jsMessage += "alert({msg:'对不起，操作失败，请重试。',title:'操作提示'});";
            }
        }
        #endregion
    }
}
