using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllPower.Common;
using AllPower.BLL.SysManage;
using System.Data;
using AllPower.Web.Admin;
using System.Text;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      陈顺
    创建时间： 2010年4月19日
    功能描述： 站点管理 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class WebSiteManage : AdminPage
    {
        AllPower.BLL.SysManage.SysWebSite bllWebSite = new AllPower.BLL.SysManage.SysWebSite();
        StringBuilder sbLog = new StringBuilder(16);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        private void PageInit()
        {
            //绑定列表控件
            SplitDataBind();
            //把当前url全部参数存入cookie中 
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"), SystemConst.intMaxCookiePageCount);
            //判断权限
            SetRight(this, rptWebSiteList);
        }

        #region 分页数据绑定
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            AllPower.Model.Pager p = new AllPower.Model.Pager();

            if (StrKeySearch != "")
            {
                dicWhere.Add("SiteName", Utils.UrlDecode(StrKeySearch));
                txtSearch.Text = StrKeySearch;
            }

            p.Aspnetpage = Split;
            p.RptControls = rptWebSiteList;
            p.DicWhere = dicWhere;
            bllWebSite.PageData(p);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            if (base.IsPageChanged())
            {
                SplitDataBind();
            }
        }
        #endregion

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            OnDel(Request.Form["chkId"]);
        }

        void OnDel(string id)
        {
            if (base.IsHaveRightByOperCode("Delete"))
            {
                string tranType;    // 事务类型
                string returnMsg = "1";   // 事务返回信息

               
                string idList = string.Empty;
                if (!string.IsNullOrEmpty(id))
                {
                    id = id.Replace(", ", ",");
                    string[] arrid = id.Split(',');
                    for (int i = 0; i < arrid.Length; i++)
                    {
                        if (string.IsNullOrEmpty(idList))
                            idList = arrid[i].Split('|')[0];
                        else
                            idList +=","+ arrid[i].Split('|')[0];

                        //删除文件夹
                        Utils.DirectoryDelete(Server.MapPath ("/"+arrid[i].Split('|')[1]));
                    }
                }
                //删除站点信息
                tranType = "DEL";
                returnMsg = bllWebSite.SysWebSiteSet(tranType, "", idList);
                //
                int result = Utils.ParseInt(returnMsg, 0);
                //删除用户组权限表中该站点所有记录(根据NodeID)
                //UserGroup bllUserGrop = new UserGroup();
                //ModuleNode bllModelNode = new ModuleNode();
                //DataTable dtModeNode = bllModelNode.GetList("WEBSITE",Utils.getOneParams(id));
                //if (dtModeNode.Rows.Count > 0)
                //{
                //    string UserGropNodeid = string.Empty;
                //    foreach (DataRow dr in dtModeNode.Rows)
                //    {
                //        UserGropNodeid += dr["NodeID"].ToString() + ",";
                //    }
                //    UserGropNodeid += UserGropNodeid.Substring(0, UserGropNodeid.Length - 1);
                //    bllUserGrop.UserGroupSet("DEL", "", UserGropNodeid);
                //}
                ////删除节点表中该站点所有记录,根据siteid
                //bllModelNode.ModuleNodeSet("WebSiteID", "", id);
                //删除用户站点表中该站点所有数据,根据siteid
                //删除用户/用户组表中该站点所有信息,根据usergropid
                //删除用户组表中该站点所有信息,根据siteid

                if (result <= 0)  //操作失败
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "站点", false), returnMsg, 3); //写日志
                    JavascriptMsg("提示信息", "操作失败，请重试！");
                }
                else //操作成功
                {
                    WriteLog(GetLogValue(LogTitle, "Del", "WebSiteManage", true), "", 2); //写日志
                    JavascriptMsg("提示信息", "操作成功！");
                }
                PageInit();
            }
            else
            {
                sbLog.Append("失败，没有权限！");
                JavascriptMsg("提示信息", "删除操作失败，没有权限！");
            }
        }


        protected void btnQuery_Click(object sender, EventArgs e)
        {
            if (IsHaveRightByOperCode("Query"))
            {
                Utils.UrlRedirect("WebSiteManage.aspx?NodeCode=" + NodeCode + "&keySearch=" + Utils.UrlEncode(txtSearch.Text.Trim())); //页面跳转 
            }
        }

        private void JavascriptMsg(string msgTitle, string msgContent)
        {
            Utils.RunJavaScript(this, "nmsgtitle='" + msgTitle + "';nmsgcontent='" + msgContent + "';");
        }
    }
}
