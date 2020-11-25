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
    功能描述： 友情链接点击数操作
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace AllPower.WEB.main.Plus.FriendLink
{
    public partial class LinkClickCount : System.Web.UI.Page
    {
        #region  URL参数
        private string _id = null;

        /// <summary>
        /// 操作ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("LinkId");
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
            BLL.LinkManage.FriendLink bllLink = new AllPower.BLL.LinkManage.FriendLink();
            //更新点击数
            bllLink.FriendLinkSet("CLICK", "", ID);

            //跳转到链接页面
            DataTable dt = bllLink.GetList("ONE", Utils.getOneParams(ID));
            if (dt.Rows.Count > 0)
            {
                Response.Redirect(dt.Rows[0]["WebUrl"].ToString());
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('此链接已被删除或不存在！');window.close();</script>");
            }
            dt.Dispose();
        }
        #endregion
    }
}
