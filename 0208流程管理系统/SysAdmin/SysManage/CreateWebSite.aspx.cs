using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Data;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月19日
    功能描述： 新建站点
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class CreateWebSite : AllPower.Web.Admin.AdminPage
    {
        public string check = "checked";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //绑定列表控件
                TemplateDataBind();
            }
        }

        #region 分页数据绑定
        // 分页控件数据绑定
        private void TemplateDataBind()
        {
            WebSiteTemplate bll = new WebSiteTemplate();
            DataTable dt = bll.GetList("ALL",Utils.getOneParams(""));
            if (dt.Rows.Count > 0)
            {
                this.rptTemplateList.DataSource = dt;
                this.rptTemplateList.DataBind();
            }
        }        
        #endregion

        protected void Create_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("New"))
            {
                string strValue = Utils.ReqFromParameter("chkID");
                if (!strValue.Equals(""))
                {
                    Response.Redirect("~/SysAdmin/SysManage/NewWebSet.aspx?TemplateID=" + strValue+"&NodeCode="+NodeCode);
                }
                else
                {
                    Utils.RunJavaScript(this, "alert({msg:'请选择要使用的模板！',title:'提示信息'})");
                }
            }
            else
            {
                Utils.RunJavaScript(this, "alert({msg:'你没有创建站点的权限，请联系站点管理员！',title:'提示信息'})");
            }
        }
    }
}
