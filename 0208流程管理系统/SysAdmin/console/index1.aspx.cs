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
using AllPower.Web.Admin;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线

    作者:      肖丹
    创建时间： 2010年4月23日

    功能描述： 头部菜单
 
// 更新日期        更新人      更新原因/内容
// 5月10日         陈顺         套新模板
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.console
{
    public partial class index1 : AdminPage
    {
        ModuleNode objMNode = new ModuleNode();
        protected string strNode = "";
        protected string strNodes = "";
        protected string strUserGrop = "";
        protected string userid = "0";
        protected int siteid = 0;
        protected string stringdata = "";
        private DataTable dt;
        private StringBuilder sb = new StringBuilder();
        private int arrNum = 1;
        public string modulecode = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

            dt = objMNode.GetModeNodeFromCache();
           
 userid = GetLoginAccountId();
            if (!Page.IsPostBack)
            {
               
                siteid = SiteID;
                Bind();
                GetUserGropName();
                stringdata = sb.ToString();
            }
        }

      


        private void Bind()
        {
            DataTable dtNode = objMNode.GetModeNodeFromCache();
            DataRow[] dr;
            AllPower.BLL.SysManage.Top top = new AllPower.BLL.SysManage.Top();

            //公告  201008027         胡志瑶       1.加上长度
            //rptMessage.DataSource = top.GetMessage(3, siteid.ToString(), UserNo, userid);
            //rptMessage.DataBind();

            dr = dtNode.Select("WebSiteID=" + siteid + " AND ParentNode='0'", "NodelOrder asc,NodeCode asc");
            for (int i = 0; i < dr.Length; i++)
            {
                if (userid == "0" || HasLeftMenuRights(dr[i]["NodeCode"].ToString()))
                {
                    string strIcon = dr[i]["NodelIcon"].ToString() == "" ? "../img/sicon.gif" : dr[i]["NodelIcon"].ToString();
                    strNode = strNode + "<li><a style='color:#555;' href='javascript:treecontent(" + i + ");'  title='" + dr[i]["NodeName"].ToString() + "'>" + dr[i]["NodeName"].ToString() + "</a></li>";
                    if(i<5)
                                            strNodes = strNodes + "<div id=\"treecontent" + i + "\" title=\"" + dr[i]["NodeName"].ToString() + "\"><div style=\"cursor:pointer; padding-top: 5px; \" id=\"tree" + (i + 1) + "\"></div></div>";
                    

                    modulecode = dr[i]["NodeCode"].ToString();
                    CreateSubTree(dr[i]["NodeCode"].ToString(), "data" + i);

                }
            }
        }

       

        private void BindChild(string NodeCode, DataTable dt)
        {
            //DataTable dtMNode = objMNode.GetList("GETPARENTNODE", Utils.getTwoParams(NodeCode, SiteID.ToString()));
            DataRow[] dr = dt.Select("ParentNode='" + NodeCode + "' and WebSiteID=" + siteid, "NodelOrder asc,NodeCode asc");
            strNode = strNode + "<ul style='display:none;'>";
            for (int k = 0; k < dr.Length; k++)
            {
                if (userid == "0" || HasLeftMenuRights(dr[k]["NodeCode"].ToString()))
                {
                    strNode = strNode + "<li><a href='left.aspx?modulecode=" + dr[k]["NodeCode"] + "' target='frameLeft'>" + dr[k]["NodeName"].ToString() + "</a></li>";
                }
            }
            strNode = strNode + "</ul></li>";
        }


        /// <summary>
        /// 递归生成根编号为NoId的树
        /// </summary>
        /// <param Name="NoId">所要生成子树的根节点</param>
        private void CreateSubTree(string NoId,string DataName)
        {

            DataRow[] dr2 = dt.Select("NodeCode='" + NoId + "'");
            if (dr2.Length > 0)
            {
              
                if (HasLeftMenuRights(NoId) || int.Parse(userid) == 0)
                {
                    DataRow[] dr1 = dt.Select("ParentNode='" + NoId + "' AND IsLeftDisplay=1", "NodelOrder asc,NodeCode asc");


                    if (dr1.Length > 0)
                    {
                       

                        if (NoId == modulecode.Substring(0, 3))
                        {
                            CreateSubTree(dr1, DataName);
                        }
                        else
                        {
                            if (dr2[0]["parentnode"].ToString() == modulecode)
                                arrNum=1;

                            sb.Append(""+DataName+".push({ text: '" + dr2[0]["NodeName"] + "', treelevel: " + arrNum + ", isleaf: 0 });");

                            arrNum++;

                            CreateSubTree(dr1, DataName);
                            arrNum--;
                            // modulecode = dr1[0]["NodeCode"].ToString();
                        }
                    }
                    else
                    {



                        if (dr2[0]["ModuleUrl"].ToString().IndexOf('?') > 0)
                        {

                            sb.Append("" + DataName + ".push({ text: '" + dr2[0]["NodeName"] + "', treelevel: " + arrNum + ", isleaf: 1, tabid: '" + dr2[0]["NodeCode"] + "', url: '" + dr2[0]["ModuleUrl"] + "&NodeCode=" + dr2[0]["NodeCode"] + "&IsFirst=1' });");


                        }
                        else
                        {

                            sb.Append("" + DataName + ".push({ text: '" + dr2[0]["NodeName"] + "', treelevel: " + arrNum + ", isleaf: 1, tabid: '" + dr2[0]["NodeCode"] + "', url: '" + dr2[0]["ModuleUrl"] + "?NodeCode=" + dr2[0]["NodeCode"] + "&IsFirst=1' });");


                        }
                    }
                }
                else if (modulecode == NoId)
                {
                    modulecode = null;
                }
            }
            
        }

        void CreateSubTree(DataRow[] dr1, string DataName)
        {
            for (int i = 0; i < dr1.Length; i++)
            {
                if (modulecode == null)
                    modulecode = dr1[i]["NodeCode"].ToString();



                CreateSubTree(dr1[i]["NodeCode"].ToString(), DataName);//递归
            }
        }

        private void GetUserGropName()
        {
            if (userid == "0")
            {
                string xml = Server.MapPath("~/SysAdmin/Configuraion/adminLoginInfo.config");
                strUserGrop = Utils.XmlRead(xml, "/root/UserGropName", "");
            }
            else
            {
                UserGroup bllUserGrop = new UserGroup();
                DataTable dt = bllUserGrop.GetList("LOGINUSERGROP", Utils.getTwoParams(siteid.ToString(), userid)).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    strUserGrop = dt.Rows[0]["UserGroupName"].ToString();
                }
            }
        }
    }
}
