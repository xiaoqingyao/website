using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Text.RegularExpressions;

using Wuqi.Webdiyer;
using KingTop.Common;
using KingTop.BLL;
using KingTop.Web.Admin;


namespace KingTop.Web.Admin
{
    public partial class ControlFormList : AdminPage
    {
        protected BLL.Content.CustomForm bllCustomForm = new KingTop.BLL.Content.CustomForm();
        protected BLL.Content.ControlManageList ctrManageList ;
                
        /// <summary>
        /// 缓存当前表
        /// </summary>
        public DataTable StrTable
        {
            get { return ViewState["StrTableName"] as DataTable; }
            set { ViewState["StrTableName"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // 权限验证（是否登陆或登陆超时）
           ctrManageList = new BLL.Content.ControlManageList(hdnModelID.Value, hdnTableName.Value);
           if (!IsPostBack)
           {
               PageInit();
           }
        }
        
        /// <summary>
        /// 初始化
        /// </summary>
        private void PageInit()
        {
            BLL.Content.CustomForm bllCustomForm = new BLL.Content.CustomForm();
            //得到当前表名
            DataTable dtManage = bllCustomForm.GetList("ONE", Utils.getOneParams(hdnModelID.Value));
            if (dtManage.Rows.Count > 0)
            {
                if (!Utils.ParseBool(dtManage.Rows[0]["IsPub"]))  //是否启用
                {
                    Utils.UrlRedirect(this, "", "此表单回复信息不能被查看!");
                    return;
                }
                StrTable = dtManage;
                SplitDataBind();               
            }
            else
            {
                Utils.UrlRedirect(this, "", "你的输入有误!", 5);
            }
            dtManage.Dispose();
        }

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {           
            string[] splitParam;
            // 初始加载时的SQL各参数
            splitParam = ctrManageList.GetSQLParam("", hdnShowCol.Value);
            KingTop.Model.Pager split;            
            split = new KingTop.Model.Pager();
            split.Aspnetpage = Split;
            split.RptControls = rptListInfo;
            bllCustomForm.FormListPageData(split, hdnTableName.Value.Trim(), splitParam[1], splitParam[2], hdnForignTableCol.Value);
        }

        protected void Split_PageChanged(object src, EventArgs e)
        {
            SplitDataBind();
        }

        /// <summary>
        /// 获取管理员回复查看信息
        /// </summary>
        /// <param Name="ReplyAdminContent"></param>
        /// <param Name="QuestionCode"></param>
        /// <returns></returns>
        public string GetReplyValue(string ReplyAdminContent, string QuestionCode)
        {
            DataRow dr = StrTable.Rows[0];
            string strValue = null;
            switch (dr["browseType"].ToString())  //浏览管理员回复类型
            {
                case "1":  //所有人都可以看
                    strValue = ReplyAdminContent;
                    break;
                case "2": //会员可以查看
                    //先判断会员是否登录,如果已经登录,则返回信息,否则返回只能被会员查看提示
                    strValue = "<font color='red'>此回复只能被会员查看</font>";
                    break;
                case "3": //问题码验证
                    strValue = "<a onlick='' href='javascript:void(0)'>输入问题码查看回复</a>";
                    break;
                default:
                    strValue = "";
                    break;
            }
            return strValue;
        }

        /// <summary>
        /// 获取回复是否是要显示
        /// </summary>
        /// <returns></returns>
        public string GetReplyDisplay()
        {
            DataRow dr = StrTable.Rows[0];
            if (Utils.ParseBool(dr["IsReply"]))  //是否要回复 
            {
                return "block";
            }
            else
            {
                return "none";
            }
        }
        #endregion   
    }
}
