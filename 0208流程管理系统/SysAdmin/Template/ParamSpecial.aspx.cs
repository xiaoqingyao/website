using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using AllPower.Common;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
        作者： 何伟
    创建时间： 2010年10月22日    功能描述： 专题标签参数设置
 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class ParamSpecial : AdminPage
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
            //获得专题列表
            AllPower.BLL.SysManage.Special bllSpecial = new AllPower.BLL.SysManage.Special();
            DataTable dt = bllSpecial.GetList("SPECIAL", Utils.getOneNumParams(SiteID));
            ListItem item;
            foreach (DataRow dr in dt.Rows)
            {
                item = new ListItem();
                item.Text = dr["Name"].ToString();
                item.Value = dr["ID"].ToString();
                ddlSpecial.Items.Add(item);
            }
            ddlSpecial.Items.Insert(0, new ListItem("--请选择--", ""));
        }
        #endregion
    }
}
