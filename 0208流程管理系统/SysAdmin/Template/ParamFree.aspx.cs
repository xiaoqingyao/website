using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
        作者： 何伟
    创建时间： 2010年9月30日    功能描述： 自由标签参数设置
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.Template
{
    public partial class ParamFree : System.Web.UI.Page
    {
        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindColumn();
            }
        }

        //加载数据
        private void BindColumn()
        {
            StringBuilder strBtns = new StringBuilder();
            //获得栏目
            AllPower.BLL.SysManage.ModuleNode module = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = module.Publish_GetNodeFromCache();
            DataRow[] drs = dt.Select("WebSiteID=" + 1 + " and NodeType=0");
            ListItem item;
            foreach (DataRow dr in drs)
            {
                item = new ListItem();
                item.Text = dr["NodeName"].ToString();
                item.Value = dr["NodeCode"].ToString();
                ddlNodeCode.Items.Add(item);
            }
            ddlNodeCode.Items.Insert(0, new ListItem("--请选择--", ""));
        }
        #endregion
    }
}
