#region 程序集引用
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using KingTop.BLL.Content;
using System.Data;
using System.Text;
using System.Collections;

using KingTop.Web.Admin;
using KingTop.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年4月12日
    功能描述： 专题栏目显示
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class ShowSpecial : AdminPage
    {
        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            PageInit();
        }
        #endregion

        #region NodeCode重载
        /// <summary>
        /// NodeCode重载
        /// </summary>
        public override string NodeCode
        {
            get
            {
                if (!string.IsNullOrEmpty(base.NodeCode))
                {
                    Session["NodeCode"] = base.NodeCode;
                }
                if (Session["NodeCode"] != null && !string.IsNullOrEmpty(Session["NodeCode"].ToString()))
                {
                    return Session["NodeCode"].ToString();
                }
                else
                {
                    Session.Abandon();
                    return "";
                }
            }
        }
        #endregion

        #region PageInit
        private void PageInit()
        {
            BLL.SysManage.Special special;
            BLL.SysManage.SpecialMenu specialMenu;
            KingTop.Model.SelectParams selParam;
            DataSet ds;

            ds = new DataSet();
            selParam = new KingTop.Model.SelectParams();
            special = new KingTop.BLL.SysManage.Special();
            specialMenu = new KingTop.BLL.SysManage.SpecialMenu();

            selParam.I1 = SiteID;
            ds.Tables.Add(special.GetList("ALL", selParam));
            ds.Tables.Add(specialMenu.GetList("ALL", selParam));

            if (ds != null && ds.Tables.Count > 1 && ds.Tables[0] != null && ds.Tables[1] != null && ds.Tables[0].Rows.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {
                ds.Relations.Add("Special_Menu", ds.Tables[0].Columns["ID"], ds.Tables[1].Columns["SpecialID"]);
                rptSpecial.DataSource = ds;
                rptSpecial.DataBind();
            }
        }
        #endregion
    }
}
