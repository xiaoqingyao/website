using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using AllPower.BLL.SysManage;
using AllPower.Common;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线

    作者:      陈顺
    创建时间： 2010年3月31日

    功能描述： 左侧菜单
 
// 更新日期        更新人      更新原因/内容
// 4月27日         陈顺        改为jquery树

// 5月10日         陈顺        套新模板
--===============================================================*/
#endregion

namespace AllPower.Web.Admin.console
{
    public partial class left : AdminPage
    {
        public string strTree = string.Empty;
        public string strTopName = string.Empty;
        public string modulecode = string.Empty;
        public string curLink = string.Empty;
        private int userid;
        private StringBuilder sb = new StringBuilder();
        private DataTable dt;
        private int arrNum = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModuleNode objMNode = new ModuleNode();
                DataRow[] dr;

                //绑定站点列表
                BindSiteList();

                //默认第一个为左边显示                
                userid = Utils.ParseInt(GetLoginAccountId(), 0);
                modulecode = Request["modulecode"];
                dt=objMNode.GetModeNodeFromCache();
                
                if (string.IsNullOrEmpty(modulecode))
                {
                    dr = dt.Select("ParentNode='0' and WebSiteID="+SiteID,"NodelOrder asc,NodeCode asc");
                    modulecode = dr[0]["NodeCode"].ToString();
                }
                CreateSubTree(modulecode.Substring(0, 3));
                strTree = sb.ToString();
            }
        }

        protected void BindSiteList()
        {
            AllPower.BLL.SysManage.SysWebSite bllSysWebSite = new AllPower.BLL.SysManage.SysWebSite();
            DataTable dt = bllSysWebSite.GetList("USERIDSITE", Utils.getOneParams(base.GetLoginAccountId()));
            ddlChangeSite.DataSource = dt;
            ddlChangeSite.DataTextField = "SiteName";
            ddlChangeSite.DataValueField = "SiteID";
            ddlChangeSite.DataBind();
            ddlChangeSite.SelectedValue = SiteID.ToString();
        }

        /// <summary>
        /// 递归生成根编号为NoId的树
        /// </summary>
        /// <param Name="NoId">所要生成子树的根节点</param>
        #region old
        //private void CreateSubTree(string NoId)
        //{
            
        //    DataRow[] dr2 = dt.Select("NodeCode='" + NoId + "'");
        //    if (dr2.Length > 0)
        //    {
        //        if (NoId == modulecode.Substring(0, 3))
        //        {
        //            strTopName = dr2[0]["NodeName"].ToString();
        //        }
        //        if (IsLeftMenuRights(NoId) || userid == 0)
        //        {
        //            DataRow[] dr1 = dt.Select("ParentNode='" + NoId + "' AND IsLeftDisplay=1", "NodelOrder asc,NodeCode asc");
        //            if (dr1.Length > 0)
        //            {
        //                if (modulecode == NoId)
        //                {
        //                    modulecode = dr1[0]["NodeCode"].ToString();
        //                }
        //                if (NoId == modulecode.Substring(0, 3))
        //                {
        //                    CreateSubTree(dr1);
        //                }
        //                else if (dr2[0]["ParentNode"].ToString() == modulecode.Substring(0, 3))
        //                {
        //                    sb.Append("<li><span class='folder'>" + dr2[0]["NodeName"] + "</span><ul>");
        //                    CreateSubTree(dr1);
        //                    sb.Append("</ul></li>");
        //                }
        //                else
        //                {
        //                    sb.Append("<ul><li><span class='folder'>" + dr2[0]["NodeName"] + "</span>");
        //                    CreateSubTree(dr1);
        //                    sb.Append("</li></ul>");
        //                }

        //            }
        //            else
        //            {
        //                if (dr2[0]["ModuleUrl"].ToString().IndexOf('?') > 0)
        //                {
        //                    sb.Append("<li><span class='file'>" + "<a href='" + dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "' target='frameRight'>" + dr2[0]["NodeName"] + "</a></span></li>");
        //                    if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
        //                    {
        //                        curLink = dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"];
        //                    }
        //                }
        //                else
        //                {
        //                    sb.Append("<li><span class='file'>" + "<a href='" + dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"] + "' target='frameRight'>" + dr2[0]["NodeName"] + "</a></span></li>");
        //                    if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
        //                    {
        //                        curLink = dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"];
        //                    }
        //                }
        //            }
        //        }
        //        else if (modulecode == NoId)
        //        {
        //            modulecode = null;
        //        }
        //    }
        //    if (Request.QueryString["pageType"] == "main")
        //    {
        //        curLink = "main.aspx";
        //    }
        //}
        #endregion

        public bool IsLeftMenuRights(string NodeCode)
        {
            AllPower.BLL.SysManage.RightTool RightToo = new AllPower.BLL.SysManage.RightTool();
            return RightToo.HasLeftMenuRights(int.Parse(GetLoginAccountId()), GetLoginUserGroupCode(), NodeCode);
        }

        private void CreateSubTree(string NoId)
        {

            DataRow[] dr2 = dt.Select("NodeCode='" + NoId + "'");
            if (dr2.Length > 0)
            {
                if (NoId == modulecode.Substring(0, 3))
                {
                    strTopName = dr2[0]["NodeName"].ToString();
                    //sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|0|" + dr2[0]["NodeName"] + "|#\";");
                    sb.Append("d.add(" + dr2[0]["NodeCode"] + "," + dr2[0]["ParentNode"] + ",'" + dr2[0]["NodeName"] + "','');\r\n");
                    arrNum++;
                }
                if (IsLeftMenuRights(NoId) || userid == 0)
                {
                    DataRow[] dr1 = dt.Select("ParentNode='" + NoId + "' AND IsLeftDisplay=1", "NodelOrder asc,NodeCode asc");
                    if (dr1.Length > 0)
                    {
                        if (modulecode == NoId)
                        {
                            modulecode = dr1[0]["NodeCode"].ToString();
                        }
                        if (NoId == modulecode.Substring(0, 3))
                        {
                            CreateSubTree(dr1);
                        }
                        
                        else
                        {
                            //sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|" + dr2[0]["ParentNode"] + "|" + dr2[0]["NodeName"] + "|#\";");
                            sb.Append("d.add(" + dr2[0]["NodeCode"] + "," + dr2[0]["ParentNode"] + ",'" + dr2[0]["NodeName"] + "','');\r\n");
                            arrNum++;
                            CreateSubTree(dr1);
                        }
                    }
                    else
                    {
                        if (dr2[0]["ModuleUrl"].ToString().IndexOf('?') > 0)
                        {
                            //sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|" + dr2[0]["ParentNode"] + "|" + dr2[0]["NodeName"] + "|" + dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "\";");
                            sb.Append("d.add(" + dr2[0]["NodeCode"] + "," + dr2[0]["ParentNode"] + ",'" + dr2[0]["NodeName"] + "','" + dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "&IsFirst=1','" + dr2[0]["NodeName"] + "');\r\n");
                            arrNum++;
                            if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
                            {
                                curLink = dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "&IsFirst=1";
                            }
                        }
                        else
                        {
                            //sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|" + dr2[0]["ParentNode"] + "|" + dr2[0]["NodeName"] + "|" + dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"] + "\";");
                            sb.Append("d.add(" + dr2[0]["NodeCode"] + "," + dr2[0]["ParentNode"] + ",'" + dr2[0]["NodeName"] + "','" + dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"] + "&IsFirst=1','" + dr2[0]["NodeName"] + "');\r\n");
                            arrNum++;
                            if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
                            {
                                curLink = dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"]+"&IsFirst=1";
                            }
                        }
                    }
                }
                else if (modulecode == NoId)
                {
                    modulecode = null;
                }
            }
            if (Request.QueryString["pageType"] == "main")
            {
                curLink = "main.aspx";
            }
        }


        //private void CreateSubTree(string NoId)
        //{

        //    DataRow[] dr2 = dt.Select("NodeCode='" + NoId + "'");
        //    if (dr2.Length > 0)
        //    {
        //        if (NoId == modulecode.Substring(0, 3))
        //        {
        //            strTopName = dr2[0]["NodeName"].ToString();
        //            sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|0|" + dr2[0]["NodeName"] + "|#\";");
        //            arrNum++;
        //        }
        //        if (IsLeftMenuRights(NoId) || userid == 0)
        //        {
        //            DataRow[] dr1 = dt.Select("ParentNode='" + NoId + "' AND IsLeftDisplay=1", "NodelOrder asc,NodeCode asc");
        //            if (dr1.Length > 0)
        //            {
        //                if (modulecode == NoId)
        //                {
        //                    modulecode = dr1[0]["NodeCode"].ToString();
        //                }
        //                if (NoId == modulecode.Substring(0, 3))
        //                {
        //                    CreateSubTree(dr1);
        //                }
        //                //else if (dr2[0]["ParentNode"].ToString() == modulecode.Substring(0, 3))
        //                //{
        //                //    sb.Append("<li><span class='folder'>" + dr2[0]["NodeName"] + "</span><ul>");
        //                //    CreateSubTree(dr1);
        //                //    sb.Append("</ul></li>");
        //                //}
        //                else
        //                {
        //                    sb.Append("Tree["+arrNum+"]  = \""+dr2[0]["NodeCode"]+"|"+dr2[0]["ParentNode"]+"|" + dr2[0]["NodeName"] + "|#\";");
        //                    arrNum++;
        //                    CreateSubTree(dr1);
        //                }
        //            }
        //            else
        //            {
        //                if (dr2[0]["ModuleUrl"].ToString().IndexOf('?') > 0)
        //                {
        //                    sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|" + dr2[0]["ParentNode"] + "|" + dr2[0]["NodeName"] + "|" + dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "\";");
        //                    arrNum++;
        //                    if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
        //                    {
        //                        curLink = dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"];
        //                    }
        //                }
        //                else
        //                {
        //                    sb.Append("Tree[" + arrNum + "]  = \"" + dr2[0]["NodeCode"] + "|" + dr2[0]["ParentNode"] + "|" + dr2[0]["NodeName"] + "|" + dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"] + "\";");
        //                    arrNum++;
        //                    if (modulecode == dr2[0]["NodeCode"].ToString().Trim())
        //                    {
        //                        curLink = dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"];
        //                    }
        //                }
        //            }
        //        }
        //        else if (modulecode == NoId)
        //        {
        //            modulecode = null;
        //        }
        //    }
        //    if (Request.QueryString["pageType"] == "main")
        //    {
        //        curLink = "main.aspx";
        //    }
        //}

        void CreateSubTree(DataRow[] dr1)
        {
            for (int i = 0; i < dr1.Length; i++)
            {
                if (modulecode == null)
                    modulecode = dr1[i]["NodeCode"].ToString();

                CreateSubTree(dr1[i]["NodeCode"].ToString());//递归
            }
        }

        protected void ddlChangeSite_SelectedIndexChanged(object sender, EventArgs e)
        {
            SiteID = Utils.ParseInt(ddlChangeSite.SelectedValue,1);
            AllPower.BLL.SysManage.SysWebSite webObj = new SysWebSite();
            DataTable dt=webObj .GetList("ONE",Utils.getOneParams(SiteID.ToString ()));
            if (dt.Rows.Count > 0)
            {
                SiteDir = dt.Rows[0]["Directory"].ToString();
            }
            Utils.RunJavaScript(Page, "parent.location.href='Index.aspx'");
        }
    }
}
