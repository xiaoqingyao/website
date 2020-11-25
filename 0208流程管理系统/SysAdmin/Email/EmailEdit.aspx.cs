using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AllPower.Web.Admin;
using AllPower.Common;
using System.Data;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      朱存群
    创建时间： 2010年4月15日
    功能描述： 添加自定义字段
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.Admin.Emails
{
    public partial class EmailEdit : AllPower.Web.Admin.AdminPage
    {
        AllPower.Model.Emails.InnerEmail model = new AllPower.Model.Emails.InnerEmail();
        AllPower.BLL.Emails.InnerEmail bll = new AllPower.BLL.Emails.InnerEmail();
        StringBuilder sbLog = new StringBuilder();
        int result = 0;
        #region 属性字段
        private string _cid = null;
        private string _urlid = null;
        private string _cname = "";
        private string temp = "0";
        public string ManageMethod //操作方法
        {
            get
            {
                string _method = "";
                if (Action=="EDIT")
                {
                    _method = Utils.GetResourcesValue("Orgin", "Modify");
                }
                else if (Action == "ADD")
                {
                    _method = Utils.GetResourcesValue("Orgin", "Add");
                }
                return _method;
            }
        }
        
        #endregion

        /// <summary>
        /// 页面加载
        /// </summary>     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Action == "EDIT")
                {
                    BindData();
                }
                PageInit();
            }
        }

        /// <summary>
        /// 页面初始化
        /// </summary>
        protected void PageInit()
        {
            lblSender.Text = "zcq_26@126.com";
            OptionsDictionary Rang = new OptionsDictionary("emailrang");//邮件类型
            foreach (KeyValuePair<string, string> dict in Rang.getDictionary2)
            {
                this.ddlRang.Items.Add(new ListItem(dict.Value, dict.Key.ToString()));
            }           
        }

        #region 编辑时加载数据
        protected void BindData()
        {
            DataTable dt = bll.GetList("ONE", Utils.getOneParams(ID));
            DataView drv = dt.DefaultView;
            this.lblSender.Text = drv[0]["SendID"].ToString();
            this.txtReceiver.Text = drv[0]["ReceiveID"].ToString();
            this.txtTitle.Text = drv[0]["ReceiveID"].ToString();
            this.txtContent.Text = drv[0]["ReceiveID"].ToString();
        }
        #endregion

        #region 添加|修改树级
        protected void btnNew_Click(object sender, EventArgs e)
        {            
            if (base.IsHaveRightByOperCode("New"))
            {
                //================添加======================//
                if (Action == "ADD")
                {
                    DateTime Time = System.DateTime.Now;
                    model.SendID = lblSender.Text;
                    model.ReceiveId = txtReceiver.Text.Trim();
                    model.Title = txtTitle.Text.Trim();
                    model.Content = txtContent.Text.Trim();
                    model.AddTime = Time;
                    model.Attachments = "";
                    model.ClassID = Utils.ParseInt(ddlRang.SelectedValue,1);
                    model.ID = Guid.NewGuid().ToString();
                    model.IsDelete = false;
                    model.IsDraft = false;
                    model.Period = 365;
                    model.SendTime = Time;
                    model.Size = 100;
                    model.Status = 0;
                    model.NodeCode = NodeCode;
                    model.SiteID = SiteID;

                    temp = bll.Save("NEW", model);
                    result = Utils.ParseInt(temp, 0);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(LogTitle, "Add", "InnerEmailModel", true), "", 2); //写日志;
                            Utils.UrlRedirect(this, "EmailList.aspx", "添加成功");
                            break;                   
                        case 0:
                            WriteLog(GetLogValue(LogTitle, "Add", "InnerEmailModel", false), temp, 3); //写日志                      
                            Utils.RunJavaScript(this, "alert({msg:'添加数据失败,请重试！',title:'提示信息'})");
                            break;
                    }
                }
                //编辑链接进来后的发送操作：例如对草稿箱中的邮件进行发送//
                else if (Action == "EDIT")
                {
                    DateTime Time = System.DateTime.Now;
                    model.SendID = lblSender.Text;
                    model.ReceiveId = txtReceiver.Text.Trim();
                    model.Title = txtTitle.Text.Trim();
                    model.Content = txtContent.Text.Trim();
                    model.Attachments = "";
                    model.ClassID = Utils.ParseInt(ddlRang.SelectedValue, 1);
                    model.ID = ID;
                    model.IsDelete = false;
                    model.IsDraft = true;
                    model.Period = 365;
                    model.AddTime = Time;
                    model.SendTime = Time;
                    model.Size = 100;
                    model.Status = 0;
                    model.NodeCode = NodeCode;
                    model.SiteID = SiteID;

                    temp = bll.Save("EDIT", model);
                    result = Utils.ParseInt(temp, 3);
                    switch (result)
                    {
                        case 1:
                            WriteLog(GetLogValue(LogTitle, "Update", "InnerEmailModel", true), "", 2); //写日志;
                            Utils.UrlRedirect(this, "CategoryList.aspx", "修改成功");
                            break;
                        case 0:
                            Utils.RunJavaScript(this, "alert({msg:'修改失败，请重试！',title:'提示信息'})");
                            break;
                        case 2:
                            Utils.RunJavaScript(this, "alert({msg:'重复的名称，请换个！',title:'提示信息'})");
                            break;
                        case 3:
                            WriteLog(GetLogValue(LogTitle, "Update", "InnerEmailModel", false), temp, 3); //写日志                      
                            Utils.RunJavaScript(this, "alert({msg:'修改数据失败,请重试！',title:'提示信息'})");
                            break;
                    }
                }
            }
            else
            {
                Utils.UrlRedirect(this, "CategoryList.aspx", "失败，无新增操作权限请联系管理员");
            }
        }
        #endregion

        #region 保存到草稿箱
        protected void btnSave_Click(object sender, EventArgs e)
        {
            DateTime Time = System.DateTime.Now;
            model.SendID = lblSender.Text;
            model.ReceiveId = txtReceiver.Text.Trim();
            model.Title = txtTitle.Text.Trim();
            model.Content = txtContent.Text.Trim();
            model.Attachments = "";
            model.ClassID = Utils.ParseInt(ddlRang.SelectedValue, 1);
            model.ID = ID;
            model.IsDelete = false;
            model.IsDraft = false;
            model.Period = 365;
            model.AddTime = Time;
            model.Size = 100;
            model.Status = 0;
            model.NodeCode = NodeCode;
            model.SiteID = SiteID;

            temp = bll.Save("EDIT", model);
            result = Utils.ParseInt(temp, 3);
            switch (result)
            {
                case 1:
                    WriteLog(GetLogValue(LogTitle, "Update", "InnerEmailModel", true), "", 2); //写日志;
                    Utils.UrlRedirect(this, "CategoryList.aspx", "修改成功");
                    break;
                case 0:
                    Utils.RunJavaScript(this, "alert({msg:'修改失败，请重试！',title:'提示信息'})");
                    break;
                case 2:
                    Utils.RunJavaScript(this, "alert({msg:'重复的名称，请换个！',title:'提示信息'})");
                    break;
                case 3:
                    WriteLog(GetLogValue(LogTitle, "Update", "InnerEmailModel", false), temp, 3); //写日志                      
                    Utils.RunJavaScript(this, "alert({msg:'修改数据失败,请重试！',title:'提示信息'})");
                    break;
            }
        }
        #endregion
    }
}

