using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Text;
using AllPower.Common;
using AllPower.BLL;
using System.Xml;
using System.IO;
using AllPower.Config;
using AllPower.BLL.SysManage;

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      何伟
    创建时间： 2010年10月22日
    功能描述： 栏目信息接口 
// 更新日期        更新人      更新原因/内容
--===============================================================*/
#endregion
namespace AllPower.WEB.main.Plus.API
{
    /// <summary>
    /// ColumnWebService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://www.360hqb.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务
    [System.Web.Script.Services.ScriptService]
    public class ColumnWebService : System.Web.Services.WebService
    {
        #region 业务操作类/属性

        AllPower.Model.SelectParams sp = new AllPower.Model.SelectParams();                           //查询的参数
        AllPower.BLL.SysManage.ModuleNode bllModul = new AllPower.BLL.SysManage.ModuleNode();         //业务操作对象
        #endregion

        #region 查询站点下的所有栏目
        /// <summary>
        /// 获取当前的站的所有节点信息
        /// </summary>
        /// <param name="siteID">站点的ID</param>
        /// <returns>所有栏目信息列表</returns>
        [WebMethod]
        public XmlDocument GetModulNodeList(string siteID)
        {
            //获取指定的列表信息
            DataTable dt = bllModul.GetList("LISTBYSITE", Utils.getOneParams(siteID));
            string res = DataTableToXMl(dt, "ColumnList", "ModulNode");

            //创建信息列表xml结构文件
            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(new System.IO.MemoryStream(System.Text.Encoding.GetEncoding("UTF-8").GetBytes(res)));
            return xmldoc;
        }
        #endregion

        #region 查询查询父节点下的所有节点
        /// <summary>
        /// 获取当前的节点信息
        /// </summary>
        /// <param name="nodeCode">父节点编号</param>
        /// <returns>子节点信息列表</returns>
        [WebMethod]
        public XmlDocument GetChildNodeList(string parentNodeCode)
        {
            //获取指定的列表信息
            DataTable dt = bllModul.GetList("LISTBYPARENTNODE", Utils.getOneParams(parentNodeCode));
            string res = DataTableToXMl(dt, "ChildNodeList", "ModulNode");

            //创建信息列表xml结构文件
            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(new System.IO.MemoryStream(System.Text.Encoding.GetEncoding("UTF-8").GetBytes(res)));
            return xmldoc;
        }

        #endregion

        #region 查询查询当前节点信息
        /// <summary>
        /// 获取当前的节点信息
        /// </summary>
        /// <param name="nodeCode">节点编号</param>
        /// <returns>节点信息</returns>
        [WebMethod]
        public XmlDocument GetCurrentNode(string nodeCode)
        {
            //获取指定的列表信息
            DataTable dt = bllModul.GetList("ONEBYNODECODE", Utils.getOneParams(nodeCode));
            string res = DataTableToXMl(dt, "ModulNode");

            //创建信息列表xml结构文件
            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(new System.IO.MemoryStream(System.Text.Encoding.GetEncoding("UTF-8").GetBytes(res)));
            return xmldoc;
        }

        #endregion

        #region DataTable转xml结构
        /// <summary>
        /// DataTable转成xml文件
        /// </summary>
        /// <param name="root">根节名</param>
        /// <param name="nodeName">子节名</param>
        /// <param name="dt">DataTable</param>
        /// <returns>xml内容文件字符串</returns>
        public string DataTableToXMl(DataTable dt, string root, string nodeName)
        {
            StringBuilder sb = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                sb.AppendLine("<" + root + ">");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.AppendLine("<" + nodeName + ">");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        switch (dt.Columns[j].ColumnName)
                        {
                            case "NodelIcon":
                            case "MouseOverImg":
                            case "CurrentImg":
                                sb.AppendLine("<" + dt.Columns[j].ColumnName + ">" + GetUploadImgUrl() + dt.Rows[i][j].ToString() + "</" + dt.Columns[j].ColumnName + ">");
                                break;
                            default:
                                sb.AppendLine("<" + dt.Columns[j].ColumnName + ">" + dt.Rows[i][j].ToString() + "</" + dt.Columns[j].ColumnName + ">");
                                break;
                        }
                    }
                    sb.AppendLine("</" + nodeName + ">");
                }
                sb.AppendLine("</" + root + ">");
            }
            else
            {
                sb.Append("<Error>Null</Error>");
            }
            return sb.ToString();
        }

        /// <summary>
        /// DataTable转成xml文件
        /// </summary>
        /// <param name="dt">DataTable</param>
        ///<param name="nodeName">节点名</param>
        /// <returns>xml内容文件字符串</returns>
        public string DataTableToXMl(DataTable dt, string nodeName)
        {
            StringBuilder sb = new StringBuilder();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.AppendLine("<" + nodeName + ">");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        switch (dt.Columns[j].ColumnName)
                        {
                            case "NodelIcon":
                            case "MouseOverImg":
                            case "CurrentImg":
                                sb.AppendLine("<" + dt.Columns[j].ColumnName + ">" + GetUploadImgUrl() + dt.Rows[i][j].ToString() + "</" + dt.Columns[j].ColumnName + ">");
                                break;
                            default:
                                sb.AppendLine("<" + dt.Columns[j].ColumnName + ">" + dt.Rows[i][j].ToString() + "</" + dt.Columns[j].ColumnName + ">");
                                break;
                        }
                    }
                    sb.AppendLine("</" + nodeName + ">");
                }
            }
            else
            {
                sb.Append("<Error>Null</Error>");
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取当前上传文件的URL
        /// </summary>
        /// <returns>url</returns>
        protected string GetUploadImgUrl()
        {
            string reUrl;

            //获取当前的站点信息
            string path = Server.MapPath("../../config/SiteParam.config");
            string siteDir = Utils.XmlRead(path, "SiteParamConfig/SiteDir", "");
            string siteId = Utils.XmlRead(path, "SiteParamConfig/SiteID", "");
            if (siteDir.Length < 0)                         //如果站点目录为空时,通过ID从数据库中取
            {
                SysWebSite bllWebSite = new SysWebSite();
                DataTable dt = bllWebSite.GetList("ONE", Utils.getOneParams(siteId));
                siteDir = dt.Rows[0]["Directory"].ToString();
            }

            string GetUploadImgPath = Server.MapPath("../../config/Upload.config");
            UploadConfig uploadobj = Upload.GetConfig(GetUploadImgPath);

            if (string.IsNullOrEmpty(uploadobj.ImageUrl))
            {
                reUrl = uploadobj.ImageSavePath + "/" + siteDir + "/Images";
            }
            else
            {
                reUrl = uploadobj.ImageUrl;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }
        #endregion
    }
}
