using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.Common;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年9月15日
    功能描述： 系统标签/通用列表类型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.WEB.SysAdmin.Template
{
    public partial class CategoryType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KingTop.BLL.Template.Lable lableBll = new KingTop.BLL.Template.Lable();
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
    }
}
