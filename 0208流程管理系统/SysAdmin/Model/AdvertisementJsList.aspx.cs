using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower;
using AllPower.Common;
using AllPower.Web.Admin;
using System.Text;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年4月28日
    功能描述： 广告jd列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class AdvertisementJsList : AdminPage
    {
        #region 页面的加载
         DataTable dtType = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();    //初始化绑定             
            }
        }


        /// <summary>
        /// 初始化数据绑定
        /// </summary>
        void PageInit()
        {
            dtType = Utils.GetXmlDataSet("../Configuraion/Model/AdvertisingType.xml").Tables[0];
            rptModelFileGroup.DataSource = dtType;
            rptModelFileGroup.DataBind();
            SetRight(this.Page, rptModelFileGroup);
        }
        #endregion
    }
}
