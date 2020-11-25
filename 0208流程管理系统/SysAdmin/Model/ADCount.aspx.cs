using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using System.Data;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月18日
    功能描述： 广告点击数操作
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.Web.Admin
{
    public partial class ADCount : System.Web.UI.Page
    {
        #region  URL参数
        private string _action = null;
        private string _id = null;
        /// <summary>
        /// 获取用户操作
        /// </summary>
        public string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToUpper();
                    if (_action == "")
                    {
                        _action = "NEW";
                    }
                }

                return this._action;
            }
        }

        /// <summary>
        /// 操作ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("adID");
                }

                return this._id;
            }
        }

        #endregion

        #region 页面初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 初始化操作
        /// </summary>
        void PageInit()
        {
            BLL.Content.Advertisement bllAdvertisement = new AllPower.BLL.Content.Advertisement();
            if (Action == "VIEW") //浏览操作
            {
                bllAdvertisement.AdvertisementSet("View", "", ID);
            }
            else if (Action == "CLICK")
            {
                bllAdvertisement.AdvertisementSet("Click", "", ID);
                DataTable dt = bllAdvertisement.GetList("one", Utils.getOneParams(ID));
                if (dt.Rows.Count > 0)                                  //判断当前的广告是否被删除
                {
                    Response.Redirect(dt.Rows[0]["LinkUrl"].ToString());
                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">alert('此广告已被删除或不存在！');window.close();</script>");
                }
                dt.Dispose();
            }
        }
        #endregion
    }
}
