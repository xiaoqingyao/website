using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

namespace KingTop.WEB.SysAdmin.Model
{
    /// <summary>
    /// SysField 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://www.hqb.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。

    [System.Web.Script.Services.ScriptService]
    public class SysField : System.Web.Services.WebService
    {

        #region 检验标题是否有重复
        [WebMethod]
        public bool CheckTitleRepeat(string tableName, string fieldName, string fieldValue)
        {
            BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.CheckTitleRepeat(tableName, fieldName, fieldValue);
        }
        #endregion

        #region 更新模型列表中的排序
        /// <summary>
        /// 更新模型列表中的排序
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="id"></param>
        /// <param name="orderValue"></param>
        [WebMethod]
        public void SetOrder(string tableName, string id, string orderValue)
        {
            // 如果没有设置排序值则忽略
            if (string.IsNullOrEmpty(id))
            {
                return;
            }
            else
            {
                BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
                ajaxDeal.SetOrder(tableName, id, orderValue);
            }
        }
        #endregion

        #region  获取推荐的作者

        [WebMethod]
        public string[] GetRecommendAuthor()
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaxDeal.GetRecommendAuthor();
        }
        #endregion

        #region  获取推荐的来源

        [WebMethod]
        public string[] GetRecommendSource()
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaxDeal.GetRecommendSource();
        }
        #endregion

        #region 通过表名返回表的所有字段 模型编辑页调用

        [WebMethod]
        public string[] GetTableFieldByID(string tableID)
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaxDeal.GetTableFieldByID(tableID);
        }
        #endregion

        #region 模型字段列表中更改所属字段分组

        [WebMethod]
        public void EditFileModelGroupID(string fieldID, string fieldGroupID)
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            ajaxDeal.EditFileModelGroupID(fieldID, fieldGroupID);
        }
        #endregion

        #region 获取模型名称
        [WebMethod]
        public string GetModelName(string modelID)
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaxDeal.GetModelName(modelID);
        }
        #endregion

        #region 通过标签变量ID获取标签变量值
        [WebMethod]
        public string GetLabelVarValue(string labelVarID)
        {
            BLL.Content.ModelAjaxDeal ajaxDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaxDeal.GetLabelVarValue(labelVarID).ToString();
        }
        #endregion

        #region 检测模型是否重名
        [WebMethod]
        public bool CheckModelRepeat(string tbName)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.CheckModelRepeat(tbName);
        }
        #endregion

        #region 添加子模型分组
        [WebMethod]
        public string AddSubModelGroup(string groupName)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.AddSubModelGroup(groupName);
        }
        #endregion

        #region 子模型列表
        [WebMethod]
        public DataTable GetSubModelList(string subModelGroupID)
        {
            DataTable dt;
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal;

            ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            dt = ajaDeal.GetSubModelList(subModelGroupID);
            dt.TableName = "SubModel";

            return dt;
        }
        #endregion

        #region 获取子模型字段
        [WebMethod]
        public string GetSubModelField(string tableName)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.GetSubModelField(tableName);
        }
        #endregion

        #region 加载字模型记录
        [WebMethod]
        public string InitSubModelField(string tableName, string parentID)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.GetSubModelRs(tableName, parentID);
        }
        #endregion

        #region 加载模型编辑页记录关联
        [WebMethod]
        public DataTable GetOriginalRelatedRS()
        {
            int relateType;
            string originalValue;
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal;
            DataTable dt;

            ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            originalValue = HttpContext.Current.Request.Form["originalValue"];

            try
            {
                relateType = int.Parse(HttpContext.Current.Request.Form["relateType"]);
                dt = ajaDeal.GetOriginalRelatedRS(relateType, originalValue);
            }
            catch
            {
                dt = null;
            }

            return dt;
        }
        #endregion

        #region 关联记录 -- 搜索记录
        [WebMethod]
        public DataTable GetSourcelRelatedRS()
        {
            string serachValue;
            string brandID;
            string catelogryID;
            int relateType;
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal;
            DataTable dt;

            serachValue = HttpContext.Current.Request.Form["serachValue"];
            brandID = HttpContext.Current.Request.Form["brandID"];
            catelogryID = HttpContext.Current.Request.Form["catelogryID"];

            try
            {
                relateType = int.Parse(HttpContext.Current.Request.Form["relateType"]);
                ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
                dt = ajaDeal.GetSourcelRelatedRS(serachValue, brandID,catelogryID, relateType);
            }
            catch
            {
                dt = null;
            }

            return dt;
        }
        #endregion

        #region 加载品牌
        [WebMethod]
        public DataTable GetGoodsBrand()
        {
            string tableName;
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal;

            tableName = HttpContext.Current.Request.Form["tableName"];
            ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.GetGoodsBrand(tableName);
        }
        #endregion

        #region 相册图片同步
        [WebMethod]
        public void AlbumsContentSync(string tableName,string fieldName, string newValue, string id, string imgPath)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            ajaDeal.AlbumsContentSync(tableName, fieldName, newValue, id, imgPath);
        }
        #endregion

        #region 获取当前站点配置ShopSet.config信息
        [WebMethod]
        public string GetShopSetConfig(string siteID)
        {
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.GetShopSetConfig(siteID);
        }
        #endregion

        
        #region 获取会员等级
        [WebMethod]
        public DataTable GetMemberGroup()
        {
            string siteID;
            KingTop.BLL.Content.ModelAjaxDeal ajaDeal;

            siteID = HttpContext.Current.Request.Form["siteID"];
            ajaDeal = new KingTop.BLL.Content.ModelAjaxDeal();
            return ajaDeal.GetMemberGroup(siteID);
        }
        #endregion
    }
}
