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
    作者:      肖丹
    创建时间： 2010年4月23日
    功能描述： 头部菜单
 
// 更新日期        更新人      更新原因/内容
// 5月10日         陈顺         套新模板
--===============================================================*/
#endregion

namespace AllPower.Web.Admin.console
{
    public partial class Index : AdminPage
    {
        ModuleNode objMNode = new ModuleNode();
        protected string strNode = "";
        protected string strUserGrop = "";
        protected string userid = "0";
        protected int siteid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                userid = GetLoginAccountId();
                siteid = SiteID;
                Bind();
                GetUserGropName();
            }
        }
        private void Bind()
        {
            DataTable dtNode = objMNode.GetModeNodeFromCache();
            DataRow[] dr;
            AllPower.BLL.SysManage.Top top = new AllPower.BLL.SysManage.Top();

            //公告  201008027         胡志瑶       1.加上长度
            rptMessage.DataSource = top.GetMessage(3,siteid.ToString (), UserNo,userid);
            rptMessage.DataBind();

            dr = dtNode.Select("WebSiteID=" + siteid + " AND ParentNode='0'", "NodelOrder asc,NodeCode asc");
            for (int i = 0; i < dr.Length ; i++)
            {
                if (userid == "0" || HasLeftMenuRights(dr[i]["NodeCode"].ToString()))
                {
                    string strIcon = dr[i]["NodelIcon"].ToString() == "" ? "../img/sicon.gif" : dr[i]["NodelIcon"].ToString();
                    strNode = strNode + "<li><img src='" + strIcon + "' /><a href='left.aspx?modulecode=" + dr[i]["NodeCode"] + "' target='frameLeft' title='" + dr[i]["NodeName"].ToString() + "'>" + dr[i]["NodeName"].ToString() + "</a>";
                    //BindChild(dr[i]["NodeCode"].ToString(),dtNode );
                }
            }
        }

        private void BindChild(string NodeCode,DataTable dt)
        {
            //DataTable dtMNode = objMNode.GetList("GETPARENTNODE", Utils.getTwoParams(NodeCode, SiteID.ToString()));
            DataRow[] dr = dt.Select("ParentNode='" + NodeCode + "' and WebSiteID=" + siteid, "NodelOrder asc,NodeCode asc");
            strNode = strNode + "<ul style='display:none;'>";
            for (int k = 0; k < dr.Length ; k++)
            {
                if (userid == "0" || HasLeftMenuRights(dr[k]["NodeCode"].ToString()))
                {
                    strNode = strNode + "<li><a href='left.aspx?modulecode=" + dr[k]["NodeCode"] + "' target='frameLeft'>" + dr[k]["NodeName"].ToString() + "</a></li>";
                }
            }
            strNode = strNode + "</ul></li>";
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
                DataTable dt = bllUserGrop.GetList("LOGINUSERGROP", Utils.getTwoParams(siteid.ToString (), userid)).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    strUserGrop = dt.Rows[0]["UserGroupName"].ToString();
                }
            }
        }
    }
}
