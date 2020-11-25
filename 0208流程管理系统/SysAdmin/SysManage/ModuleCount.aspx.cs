using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.Web.Admin;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      胡志瑶
    创建时间： 2010年10月15日   
 
// 更新日期        更新人      更新原因/内容
// 
--===============================================================*/
#endregion
namespace KingTop.WEB.SysAdmin.SysManage
{
    public partial class ModuleCount : AdminPage
    {
        private int SearType
        {
            get
            {
                return Request["type"] != null ? int.Parse(Request["type"]) : 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                PageInit();
                btnQuery.Attributes.Add("onclick", "return checkSearch();");
            }
        }
        private void PageInit()
        {
            string startTime = txtDate1.Text;
            string endTime = txtDate2.Text;
            string now = DateTime.Now.ToShortDateString();

            KingTop.Model.SelectParams parms=new KingTop.Model.SelectParams();
            parms.I1 = SiteID;            
            parms.S1 = txtDate1.Text;
            parms.S2 = txtDate2.Text;
            parms.I2 = SearType;

            KingTop.BLL.SysManage.BrowseCount count=new KingTop.BLL.SysManage.BrowseCount();
            DataTable dt = count.GetColumnCount( parms);
          
            reptCount.DataSource = dt;
            reptCount.DataBind();
            
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
            PageInit();
        }
    }
}
