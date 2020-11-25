using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.Model;
using System.Data;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月20日
    功能描述： 模板编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class TemplateEdit : AllPower.Web.Admin.AdminPage
    {
        //站点模板表实体类
        AllPower.BLL.SysManage.WebSiteTemplate bll = new AllPower.BLL.SysManage.WebSiteTemplate();

        #region  URL参数
        private string _templateid = null;
        public string TemplateID
        {
            get
            {
                if (this._templateid == null)
                {
                    this._templateid = Request.QueryString["TemplateID"];
                    // 参数格式验证，非法则重置为空字符串
                }
                return this._templateid;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        #region 页面初始化
        private void PageInit()
        {
            //编辑
            if (this.Action == "EDIT")
            {
                DataTable dt;
                SelectParams selParams = new SelectParams();
                selParams.S1 = TemplateID;
                dt = bll.GetList("ONE", selParams);

                btnTemplateEdit.Text = Utils.GetResourcesValue("Common", "Update");

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    txtTemplateName.Text = Utils.HtmlDecode(dr["TemplateName"].ToString());
                    hidLogTitle.Value = Utils.HtmlDecode(dr["TemplateName"].ToString());
                    hdnID.Value = TemplateID;
                }
            }
        }
        #endregion

        protected void btnTemplateEdit_Click(object sender, EventArgs e)
        {
            string id = hdnID.Value;
            string returnMsg = "";
            string tranType = "NEW";
            AllPower.Model.SysManage.WebSiteTemplate mode = new AllPower.Model.SysManage.WebSiteTemplate();


            if (id != "")   // 修改关键字
            {
                #region 修改模板
                // 权限验证，是否具有修改权限
                if (IsHaveRightByOperCode("Edit"))
                {
                    tranType = "EDIT";
                    mode.TemplateID = Utils.ParseInt(id,0);
                    mode.TemplateName = this.txtTemplateName.Text;
                    returnMsg = bll.Save(tranType, mode);
                    try
                    {
                        if (Convert.ToInt32(returnMsg) > 0)
                        {
                            WriteLog("修改" + txtTemplateName.Text + "模板成功", "", 2);// 写入操作日志
                            Utils.RunJavaScript(this, "type=1;title='" + txtTemplateName.Text.Replace("'", "\\'") + "';");
                        }
                    }
                    catch
                    {
                        WriteLog("修改" + txtTemplateName.Text + "模板失败", returnMsg, 2);
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");                        
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有编辑模板的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
            else
            {
                #region 新增模板
                // 权限验证，是否具有新增权限
                if (IsHaveRightByOperCode("New"))
                {
                    tranType = "NEW";
                    mode.TemplateName = this.txtTemplateName.Text;
                    returnMsg = bll.Save(tranType, mode);
                    try
                    {
                        if (Convert.ToInt32(returnMsg) > 0)
                        {
                            WriteLog("新增"+txtTemplateName.Text+"模板成功", "", 2);// 写入操作日志
                           Utils.RunJavaScript(this, "type=0;title='" + txtTemplateName.Text.Replace("'", "\\'") + "';");
                        }
                    }
                    catch
                    {
                        WriteLog("新增" + txtTemplateName.Text + "模板失败", returnMsg, 2);
                        Utils.RunJavaScript(this, "type=2;errmsg='" + returnMsg.Replace("'", "\\'").Replace("\r\n", "<br>") + "';");                        
                    }
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'你没有新增模板的权限，请联系站点管理员！',title:'提示信息'})");
                }
                #endregion
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TemplateManage.aspx?NodeID=" + NodeID);
        }
    }
}
