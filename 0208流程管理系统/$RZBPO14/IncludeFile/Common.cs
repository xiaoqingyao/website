using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.IO;
using AllPower.Common;

namespace AllPower.FrontPublic
{
    public class Common : System.Web.UI.Page
    {

        #region 分页参数
        public int TotalPageCount = 1;
        public int TotalRecordCount = 0;
        #endregion

        #region 配置参数,需要调用GetMenu()
        public string ConfigPath = string.Empty;
        public string CreateHtmlExt = string.Empty;
        public string WebUrl = string.Empty;
        public string ImgUrl = string.Empty;
        #endregion


        public string SqlCheck(string str)
        {
            if (string.IsNullOrEmpty(str))
                return "";

            str = Server.UrlDecode(str);
            str = str.Length > 50 ? str.Substring(0, 50) : str;

            str = str.ToLower();
            str = str.Replace("exec", "*");
            str = str.Replace("insert", "*");
            str = str.Replace("delete", "*");
            str = str.Replace("truncate", "*");
            str = str.Replace("declare", "*");
            str = str.Replace("drop", "*");
            str = str.Replace("0x", "Ox");
            str = str.Replace("update", "*");
            str = str.Replace("'", "''");

            return str;
        }

        public int ParseInt(object originalValue, int defaultValue)
        {
            int targetValue;

            try
            {
                targetValue = int.Parse(originalValue.ToString().Trim());
            }
            catch
            {
                targetValue = defaultValue;
            }

            return targetValue;
        }


        public DataSet GetRecord(string sql)
        {
            return SQLHelper.ExecuteDataSet(SQLHelper.ConnectionStringLocalTransaction, CommandType.Text, sql);
        }

        public DataTable GetMenu()
        {
            string configPath = string.Empty;
            string virPathLevel = "";
            int siteid = 1;
            for (int i = 0; i < 8; i++)
            {
                configPath = Server.MapPath(virPathLevel + "config");
                if (Directory.Exists(configPath))
                {
                    string xmlPath = Path.Combine(configPath, "SiteParam.config");
                    siteid = Utils.ParseInt(Utils.XmlRead(xmlPath, "SiteParamConfig/SiteID", ""), 1);
                    CreateHtmlExt = Utils.XmlRead(xmlPath, "SiteParamConfig/CreateFileExt", "");
                    string sitedir = Utils.XmlRead(xmlPath, "SiteParamConfig/SiteDir", "");
                    WebUrl = GetWebUrl(Utils.XmlRead(xmlPath, "SiteParamConfig/SiteDomain", ""), Utils.XmlRead(xmlPath, "SiteParamConfig/SiteRootURL", ""), sitedir);

                    xmlPath = Path.Combine(configPath, "Upload.config");
                    ImgUrl = GetImgUrl(Utils.XmlRead(xmlPath, "UploadConfig/ImageUrl", ""), Utils.XmlRead(xmlPath, "UploadConfig/ImageSavePath", ""), sitedir);
                    break;
                }
                virPathLevel += "../";
            }
            AllPower.BLL.SysManage.ModuleNode bllObj = new AllPower.BLL.SysManage.ModuleNode();
            DataTable dt = bllObj.SiteMenu_GetNodeFromCache(siteid);
            return dt;
        }

        private string GetWebUrl(string url1, string url2, string sitedir)
        {
            string reUrl;
            if (string.IsNullOrEmpty(url1))
            {
                reUrl = url2;

                if (string.IsNullOrEmpty(reUrl))
                    reUrl = "/";

                if (reUrl.Substring(reUrl.Length - 1) == "/")
                    reUrl = reUrl + sitedir;
                else
                    reUrl = reUrl + "/" + sitedir;
            }
            else
            {
                reUrl = url1;
            }

            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }

        private string GetImgUrl(string url1, string url2, string sitedir)
        {
            string reUrl;

            if (string.IsNullOrEmpty(url1))
            {
                reUrl = "/" + url2 + "/" + sitedir + "/Images";
                reUrl = reUrl.Replace("//", "/");
            }
            else
            {
                reUrl = url1;
            }
            if (reUrl.Substring(reUrl.Length - 1) != "/")
            {
                reUrl = reUrl + "/";
            }

            return reUrl;
        }

        public DataRow[] GetNodeByParentNode(string parentNode, DataTable dt)
        {
            DataRow[] dr = dt.Select("ParentNode='" + parentNode + "'", "NodelOrder");
            return dr;
        }

        #region 分页列表
        #region 分页
        public DataTable SplitDataBind(string sql, int CurrentPage, int PageSize, string OrderStr)
        {
            DataSet ds = GetData(sql, CurrentPage, PageSize, OrderStr);
            TotalRecordCount = Utils.ParseInt(ds.Tables[0].Rows[0][0].ToString(), 0);
            if (TotalRecordCount < 1 || PageSize < 1)
            {
                TotalPageCount = 1;
            }
            else
            {
                TotalPageCount = TotalRecordCount / PageSize;
                if ((TotalRecordCount % PageSize) > 0)
                    TotalPageCount++;
            }
            return ds.Tables[1];
        }
        #endregion

        #region 执行查询，得到分页数据
        public DataSet GetData(string sql, int pageIndex, int pageSize, string OrderStr)
        {
            SqlParameter[] prams = new SqlParameter[]{
                new SqlParameter("@Id",""),
                new SqlParameter("@Table",""),             
                new SqlParameter("@Where",""),
                new SqlParameter("@Cou",""),
                new SqlParameter("@NewPageIndex",pageIndex),
                new SqlParameter("@PageSize",pageSize), 
                new SqlParameter("@order",OrderStr),
               new  SqlParameter("@isSql", 1),
                new  SqlParameter("@strSql",sql)
            };
            return SQLHelper.ExecuteDataSet(SQLHelper.ConnectionStringLocalTransaction,
                      CommandType.StoredProcedure, "proc_Pager", prams);
        }
        #endregion
        #endregion

        #region 左边栏目
        public string FirstMenuDir = string.Empty;
        public string GetMenuUrl(string nodeCode, DataTable dt)
        {

            string reUrl = string.Empty;
            DataRow[] dr = dt.Select("NodeCode='" + nodeCode + "'");
            if (dr[0]["NodeType"].ToString() == "0")
            {
                if (dr[0]["ColumnType"].ToString() == "2")  //单页
                {
                    reUrl = WebUrl + FirstMenuDir + "/" + dr[0]["NodelEngDesc"].ToString() + "." + CreateHtmlExt;
                }
                else if (dr[0]["ColumnType"].ToString() == "3")  //外部栏目
                {
                    reUrl = dr[0]["LinkURL"].ToString();
                }
                else  //普通栏目
                {
                    reUrl = GetMenuDir(nodeCode, dt);
                    reUrl = WebUrl + reUrl;
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(dr[0]["DefaultTemplate"].ToString()))  //如果有栏目首页
                {
                    reUrl = GetMenuDir(nodeCode, dt);
                }
                else  //读取最终极第一个子栏目
                {
                    reUrl = GetMenuSubDir(nodeCode, dt);
                }
            }
            return reUrl;
        }

        private string GetMenuSubDir(string nodeCode, DataTable dt)
        {
            string reDir = string.Empty;
            DataRow[] dr = dt.Select("parentNode='" + nodeCode + "'", "NodelOrder");
            if (dr.Length > 0)
            {
                if (dr[0]["NodeType"].ToString() == "0")
                {
                    if (dr[0]["ColumnType"].ToString() == "2")  //单页
                    {
                        reDir = WebUrl + FirstMenuDir + "/" + dr[0]["NodelEngDesc"].ToString() + "." + CreateHtmlExt;
                    }
                    else if (dr[0]["ColumnType"].ToString() == "3")  //外部栏目
                    {
                        reDir = dr[0]["LinkURL"].ToString();
                    }
                    else  //普通栏目
                    {
                        reDir = GetMenuDir(nodeCode, dt);
                        reDir = WebUrl + reDir;
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(dr[0]["DefaultTemplate"].ToString()))  //如果有栏目首页
                    {
                        reDir = GetMenuDir(nodeCode, dt);
                    }
                    else  //读取最终极第一个子栏目
                    {
                        GetMenuSubDir(dr[0]["NodeCode"].ToString(), dt);
                    }
                }
            }

            return reDir;
        }

        private string GetMenuDir(string nodeCode, DataTable dt)
        {
            string reDir = string.Empty;
            for (int i = 6; i <= nodeCode.Length; i = i + 3)
            {
                DataRow[] dr1 = dt.Select("NodeCode='" + nodeCode.Substring(0, i) + "'");
                reDir += dr1[0]["NodeDir"].ToString() + "/";
            }
            if (reDir.Length > 0)
            {
                reDir = reDir.Substring(0, reDir.Length - 1);
            }
            return reDir;
        }
        #endregion
    }
}
