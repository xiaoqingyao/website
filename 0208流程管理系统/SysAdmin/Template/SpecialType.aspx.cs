using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.BLL.SysManage;
using AllPower.Common;
using System.Data;
using AllPower.Web.Admin;
#region 版权注释
/*----------------------------------------------------------------------------------------
// Copyright (C) 2010 华强北在线 
// 作者：胡志瑶// 创建日期：2010-10-22
// 功能描述：专题类型标签
// 更新日期        更新人      更新原因/内容
//
----------------------------------------------------------------------------------------*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class SpecialType : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSpecialMenu();
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

        private void BindSpecialMenu()
        {
            Special special = new Special();
            DataTable dtSpecial = special.GetList("SPECIAL", Utils.getOneNumParams(SiteID));
            SpecialMenu specialMenu = new SpecialMenu();
            DataTable dtMenu = specialMenu.GetList("ALL", Utils.getOneNumParams(SiteID));
            ListItem item;
            foreach (DataRow dr in dtSpecial.Rows)
            {
                item = new ListItem(dr["Name"].ToString(), dr["ID"].ToString());
                item.Attributes.Add("disabled", "disabled");
                Menu.Items.Add(item);
                foreach (DataRow drMenu in dtMenu.Select("IsDel = 0"))
                {
                    if (drMenu["SpecialID"].ToString() == dr["ID"].ToString())
                    {
                        item = new ListItem("　|--" + drMenu["Name"].ToString(), drMenu["ID"].ToString());
                        Menu.Items.Add(item);
                    }
                }
               
            }
            Menu.Items.Add(new ListItem("", ""));
            Menu.SelectedValue = "";

        }
     
    }
}
