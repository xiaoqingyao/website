using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using AllPower.Common;
using AllPower.Web.Admin;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年9月30日
    功能描述： 系统标签/栏目列表类型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class ColumnType : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindColumn();
                AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();
                //页面初始化
                string id = Request.QueryString["id"];
                if (id != null)
                {
                    DataTable dt = lableBll.GetLable("OneLable", Utils.getOneParams(id)).Tables[0];
                    if (dt.Rows.Count > 0)
                    {
                        ltlJs.Text = "<script>SetAttribute('" + dt.Rows[0]["LableContent"].ToString().Replace("\r\n", "").Replace("  ", "") + "');</script>";
                      
                    }

                }               
            }
        }
        private void BindColumn()
        {
            StringBuilder strBtns = new StringBuilder();
            //获得栏目
            AllPower.BLL.SysManage.ModuleNode module = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = module.Publish_GetNodeFromCache();
            DataRow[] drs = dt.Select("WebSiteID=" + SiteID + " and NodeType=0");
             ListItem item;
            foreach (DataRow dr in drs)
            {
                item = new ListItem();
                item.Text = dr["NodeName"].ToString();
                item.Value = dr["NodeCode"].ToString();
                NodeCode.Items.Add(item);
            }
            NodeCode.Items.Insert(0, new ListItem("--请选择--", ""));           
        }
    }
}
