using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KingTop.Common;
#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月12日
    功能描述： 模板字段列表
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion
namespace KingTop.Web.Admin
{
    public partial class ModelFieldList : AdminPage
    {
        protected string jsMessage;

        #region 初始参数       
        private string strKeySearch, strModelId,strType;
        KingTop.BLL.Content.ModelField bllModelField = new KingTop.BLL.Content.ModelField();
        /// <summary>
        /// 查询字段
        /// </summary>
        public string StrKeySearch
        {          
            get
            {
                if (strKeySearch == null)
                {
                    strKeySearch = Utils.UrlDecode(Utils.ReqUrlParameter("keySearch"));
                }                
                return strKeySearch;
            }
        }
        /// <summary>
        /// 字段类型
        /// </summary>
        public string StrType
        {
            get
            {
                if (strType == null)
                {
                    strType = Utils.UrlDecode(Utils.ReqUrlParameter("Type"));
                }
                if (strType == "")
                {
                    return "1";
                }
                return strType;
            }
        }
        /// <summary>
        /// 下拉选中模型ID
        /// </summary>
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("ModelId");
                }
                return strModelId;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }

        /// <summary>
        /// 初始化方法
        /// </summary>
        public void PageInit()
        {          
          SplitDataBind();          
        }

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            Dictionary<string, string> dcWhere = new Dictionary<string, string>();
            if (StrModelId != "")
            {
                dcWhere.Add("modelid", StrModelId);
            }           
            dcWhere.Add("ModelFieldType", StrType);
            KingTop.Model.Pager p = new KingTop.Model.Pager();
            p.Aspnetpage = Split;
            p.RptControls = rptModelFieldList;
            p.DicWhere = dcWhere;
            p.Order = "Orders asc";
            bllModelField.PageData(p);   //执行绑定            
            Utils.SetVisiteList(SystemConst.COOKIES_PAGE_KEY, Session.SessionID, Utils.GetUrlParams().Replace("&", "|"),SystemConst.intMaxCookiePageCount); //把当前url全部参数存入cookie中        
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            SplitDataBind();
        }

        /// <summary>
        /// 截图字符串
        /// </summary>
        /// <param Name="strValue"></param>
        /// <param Name="intLength"></param>
        /// <returns></returns>
        public string GetSubString(string strValue, int intLength)
        {
            return Utils.GetSubString(strValue, intLength, "..");
        }

        protected void lbtnDel_Click(object sender, CommandEventArgs e)
        {            
          bllModelField.ModelFieldSet("DEL", "", e.CommandArgument.ToString());  //删除数据
          PageInit();           
        }

        protected void btnOrder_Click(object sender, CommandEventArgs e)
        {  
            string strOrder = ((sender as Button).Parent.FindControl("txtOrder") as System.Web.UI.HtmlControls.HtmlInputText).Value;  //得到当前项的排序值
            bllModelField.ModelFieldSet("order", strOrder, e.CommandArgument.ToString());  //修改排序
            PageInit();
        }

        public string GetControlsName(string strControls, string strBasicField)
        {
            return bllModelField.GetControlsName(strControls, strBasicField);
        }

        protected void lbtnEnable_Click(object sender, CommandEventArgs e)
        {
            string[] strMessage = KingTop.Common.Utils.strSplit(e.CommandArgument.ToString(), "|");     //分隔传入的两个参数id和是否启用状态
            #region 是否启用状态标识更改
            int iEnable = KingTop.Common.Utils.BoolToInt(strMessage[1]);
            if (iEnable == 1)
            {
                iEnable = 0;
            }
            else
            {
                iEnable = 1;
            }
            #endregion
            string strValue = bllModelField.ModelFieldSet("Enable", iEnable.ToString(), strMessage[0]);  //更改状态
            PageInit();
        }
        #endregion

        #region 创建模型
        protected void CreateModel(object sender, CommandEventArgs e)
        {
            string modelId;         // 模型ID
            string browseUrl;       // 浏览模型地址
            string tableName;       // 模型表名

            modelId = Request.QueryString["modelid"];
            tableName = Request.QueryString["tableName"];

            if (!string.IsNullOrEmpty(modelId) && !string.IsNullOrEmpty(tableName))
            {
                browseUrl = tableName.Replace("K_U_", "") + "edit.aspx?Action=browse";

                BLL.Content.ParseModel model = new BLL.Content.ParseModel(modelId,BLL.Content.ParserType.Content);
                try
                {
                    model.Create();
                    jsMessage = "if(window.confirm(\"恭喜您，创建成功,是否浏览生成后的模型！\")){window.location.href=\"" + browseUrl + "\";}";
                }
                catch
                {
                    jsMessage = "alert({ msg: '操作失败，请重试。', title: '操作结果' })";
                }
            }
            else
            {
                jsMessage = "alert({ msg: '操作失败，参数不足。', title: '操作提示' })";
            }
        }
        #endregion

    }
}
