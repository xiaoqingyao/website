using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using AllPower.Common;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:     胡志瑶
    创建时间： 2010年10月27日
    功能描述： 期刊列表类型
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.SysAdmin.Template
{
    public partial class PeriodicalType : AllPower.Web.Admin.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //获得期刊模型字段               
                DataTable dt = new BLL.Content.FieldManage("", "").GetList("GETFIELDBYTABLENAME", Utils.getOneParams("K_U_PeriodicalArticle"));
                StringBuilder strBtns = new StringBuilder();
                foreach (DataRow dr in dt.Rows)
                {
                    strBtns.Append("<input type=button class=abtn id=" + dr["Name"] + " value=" + dr["FieldAlias"] + " onclick=showDailog('" + dr["Name"] + "') /> ");
                }
                literFields.Text = strBtns.ToString();
                AllPower.BLL.Template.Lable lableBll = new AllPower.BLL.Template.Lable();

                //页面初始化
                string id = Request.QueryString["id"];
                if (id != null)
                {
                    DataTable tab = lableBll.GetLable("OneLable", Utils.getOneParams(id)).Tables[0];
                    if (tab.Rows.Count > 0)
                    {
                        ltlJs.Text = "<script>SetAttribute('" + tab.Rows[0]["LableContent"].ToString().Replace("\r\n", "::br::") + "');</script>";                        
                    }
                }
              
            }
        }
    }
}
