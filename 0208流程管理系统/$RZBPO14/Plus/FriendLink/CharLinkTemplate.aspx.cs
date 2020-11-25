﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Web.Admin;
using System.Data;
using AllPower.Common;
using AllPower.BLL.SysManage;
using AllPower.Config;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月15日    功能描述： 文字链接模板
 * 
--===============================================================*/
#endregion
namespace AllPower.WEB.main.Plus.FriendLink
{
    public partial class CharLinkTemplate : System.Web.UI.Page
    {
        #region 参数/业务操作类

        AllPower.BLL.LinkManage.FriendLinkClass bllLinkClass = new AllPower.BLL.LinkManage.FriendLinkClass();
        BLL.LinkManage.FriendLinkConfig bllFriendLinkConfig = new AllPower.BLL.LinkManage.FriendLinkConfig();
        BLL.LinkManage.FriendLink bllFriendLink = new AllPower.BLL.LinkManage.FriendLink();

        #endregion

        #region 初始化
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageData();
            }
        }

        //加载信息列表
        void PageData()
        {
            AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();       //查询的参数

            DataTable dt = bllFriendLinkConfig.GetList("ONE", Utils.getOneParams("1"));
            if (dt != null && dt.Rows.Count > 0)
            {
                sp.I1 = Utils.ParseInt(dt.Rows[0]["ShowCount"], 18);                 //显示的条数
                sp.I2 = Utils.ParseBoolToInt(dt.Rows[0]["IsCommend"]);               //是否推荐
                sp.I3 = Utils.ParseBoolToInt(dt.Rows[0]["IsEnable"]);                //是否启用
                sp.S1 = "1";                                                         //链接的类型

                string linkClass = dt.Rows[0]["ClassID"].ToString();                 //链接的分类
                if (Utils.ValidateNumber(linkClass))
                {
                    sp.S2 = linkClass;
                }
                else if ("0".Equals(linkClass))
                {
                    sp.S2 = "";
                }
                else
                {
                    DataTable dtClass = bllLinkClass.GetList("GETBYNAME", Utils.getOneParams(linkClass));
                    if (dtClass.Rows.Count > 0)
                    {
                        sp.S2 = dtClass.Rows[0]["ID"].ToString();
                    }
                }
                sp.S3 = SiteID.ToString();                                            //站点的ID
            }

            //绑定数据列表
            rptCharLink.DataSource = bllFriendLink.GetList("SELECTBYCONFIG", sp);
            rptCharLink.DataBind();

            dt.Dispose();
        }
        #endregion

        #region 获取当前站点的信息(ID，目录等)

        //获取当前站点的文件夹名称
        protected string GetSiteDir()
        {
            string path = Server.MapPath("../../config/SiteParam.config");
            string siteDir = Utils.XmlRead(path, "SiteParamConfig/SiteDir", "");
            if (siteDir.Length < 0)                     //如果站点目录为空时,通过ID从数据库中取
            {
                SysWebSite bllWebSite = new SysWebSite();
                DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(SiteID.ToString()));
                siteDir = dt.Rows[0]["Directory"].ToString();
            }
            return siteDir;
        }

        //站点的ID
        public int SiteID
        {
            get
            {
                string path = Server.MapPath("../../config/SiteParam.config");
                string siteId = Utils.XmlRead(path, "SiteParamConfig/SiteID", "");
                if (siteId.Length > 0)
                {
                    return Utils.ParseInt(siteId, 1);
                }
                else
                {
                    Session.Abandon();
                    return 1;
                }
            }
            set
            {
                Session["SiteID"] = value;
            }
        }

        //获取站点文件夹
        private string _SiteDir;
        public string SiteDir
        {
            get
            {
                if (Session["SiteDir"] != null)
                {
                    this._SiteDir = Session["SiteDir"].ToString();
                }
                else
                {
                    this._SiteDir = GetSiteDir();
                    Session["SiteDir"] = this._SiteDir;
                }
                return this._SiteDir;
            }
            set { Session["SiteDir"] = value; }
        }
        #endregion
    }
}
