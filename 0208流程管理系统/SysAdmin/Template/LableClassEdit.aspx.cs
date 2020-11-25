using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using AllPower.Common;

using AllPower.Web.Admin;
/*================================================================
    Copyright (C) 2010 华强北在线          功能描述： 方案添加/修改 
// 更新日期        更新人      更新原因/内容
//2010-9-10        胡志瑶      加日志，加验证
--===============================================================*/
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class LableClassAdd : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PageInit();
            }
        }
        /// <summary>
        /// 网站列表
        /// </summary>
        private void PageInit()
        {
            DataTable dt = new AllPower.BLL.SysManage.SysWebSite().GetList("ALL", Utils.getOneParams(""));
            if (dt != null)
            {
                ddlSiteList.Items.Add(new ListItem("请选择网站", "0"));
                foreach (DataRow dr in dt.Rows)
                {
                    ddlSiteList.Items.Add(new ListItem(dr["SiteName"].ToString(), dr["SiteId"].ToString()));
                }
            }
            hidClassID.Value = "0";

            string action = Request.QueryString["action"];
            if (action == "edit")
            {
                BindData();
            }
        }
        /// <summary>
        /// 绑定修改的分类信息
        /// </summary>
        private void BindData()
        {
            string classId = Request.QueryString["ID"];
            if (!string.IsNullOrEmpty(classId))
            { 
                DataTable dt = new AllPower.BLL.Template.Lable().GetLable("ONELABLECLASS", Utils.getOneParams(classId)).Tables[0];
                if (dt != null)
                {
                    txtDescription.Text = dt.Rows[0]["Description"].ToString();
                    txtLableName.Text = dt.Rows[0]["ClassName"].ToString();
                    ddlSiteList.SelectedValue = dt.Rows[0]["SiteId"].ToString();
                    hidClassID.Value = dt.Rows[0]["ClassID"].ToString();
                }
                btnSubmit.Text = "修改";
            }
        }

        /// <summary>
        /// 添加/修改
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string siteId = ddlSiteList.SelectedValue;
            string className = txtLableName.Text.Trim();
            string description = txtDescription.Text.Trim();

            if (siteId == "0")
            {
                Response.Write("<script>alert(\"请选择站点!\")</script>");
                return;
            }
            if (string.IsNullOrEmpty(className))
            {
                Response.Write("<script>alert(\"请填写分类名称!\")</script>");
                return;
            }

            AllPower.Model.Template.LableClassInfo model = new AllPower.Model.Template.LableClassInfo();
            model.SiteID = Convert.ToInt32(siteId);
            model.ClassName = className;
            model.Description = description;
            model.IsSystem = 0;
            model.ClassID = Convert.ToInt32(hidClassID.Value);

            string tranType = "ADDCLASS";
            if (btnSubmit.Text == "修改")
            {
                tranType = "UpdateClass";
            }

            int row = new AllPower.BLL.Template.Lable().SaveLableClass(tranType, model);
            if (row == 1)
            {
                Response.Redirect("LableClassList.aspx");
                WriteLog(GetLogValue(LogTitle, Action, "LableClass", true), "", 2);           //写日志;
                Utils.RunJavaScript(this, "type=0" + ";title='" + Utils.AlertMessage(className) + "';id='" + model.ClassID + "'");
            }
            else
            {
                Response.Write("<script>alert(\"添加失败!\")</script>");
                return;
            }
        }
    }
}
