#region 引用程序集
using System;
using System.Collections;
using System.Configuration;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Xml;
using System.Xml.XPath;

using AllPower.Common;
using AllPower.Model;
using AllPower.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月11日
    功能描述： 推荐区域
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Model
{
    public partial class RecommendAreaEdit : AdminPage
    {
        #region 变量成员
        private AllPower.BLL.Content.RecommendArea recommendArea;
        protected string jsMessage;         // js处理提示信息
        private string _specialID;          // 专题信息
        #endregion

        #region 属性
        public string SpecialID
        {
            get
            {
                if (string.IsNullOrEmpty(this._specialID))
                {
                    this._specialID = Utils.ReqUrlParameter("SpecialID");
                }

                return this._specialID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            recommendArea = new AllPower.BLL.Content.RecommendArea();

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 更新
        protected void RecommendArea_Edit(object sender, EventArgs e)
        {
            AllPower.Model.Content.RecommendArea mRecommendArea;
            string tranType;    // 操作类型
            string effectRow;   // 更新结果
            string listUrl;     // 返回路径

            tranType = "EDIT";
            listUrl = "RecommendAreaList.aspx?SpecialID=" + SpecialID;
            mRecommendArea = new AllPower.Model.Content.RecommendArea();
            mRecommendArea.Name = txtName.Text.Trim();
            mRecommendArea.SiteID = Utils.ParseInt(ddlSiteID.SelectedValue, 1);
            mRecommendArea.FieldName = "RA_" + txtFieldName.Text.Trim();
            mRecommendArea.FieldLength = Utils.ParseInt(txtFieldLength.Text.Trim(), 512);
            mRecommendArea.SpecialID = SpecialID;

            if (string.Equals(Action.ToLower(), "add")) // 添加
            {
                string[] tableID;

                tranType = "NEW";
                tableID = GetTableID("0", "K_RecommendArea");
                mRecommendArea.AddMan = UserNo;
                mRecommendArea.ID = tableID[0];
                mRecommendArea.Orders = Utils.ParseInt(tableID[1], 999);
                mRecommendArea.IsDel = false;
                mRecommendArea.IsEnable = true;
            }
            else
            {
                mRecommendArea.ID = ID; // 更新
            }

           effectRow = recommendArea.Save(tranType, mRecommendArea);    

           if (string.Equals(Action.ToLower(), "edit")) // 更新
           {
               if (string.Equals(effectRow,"1"))  // 编辑成功
               {
                   jsMessage = "if(window.confirm(\"恭喜您，更新成功！\")){location.href=\"" + listUrl + "\";}";
               }
               else  // 失败
               {
                   jsMessage = "alert({msg:'对不起操作失败，请重试。',title:'操作提示'});";
               }
           }
           else
           {
               if (string.Equals(effectRow, "1"))  // 添加成功
               {
                   jsMessage = "if(!window.confirm(\"恭喜您，添加成功,是否继续添加？\")){location.href=\"" + listUrl + "\";}";
               }
               else   // 失败
               {
                   jsMessage = "alert({msg:'对不起操作失败，请重试。',title:'操作提示'});";
               }
           }

           PageInit();  // 重新加载数据
        }
        #endregion

        #region 加载数据
        private void PageInit()
        {
            BLL.SysManage.SysWebSite webSite;
            DataTable dtWebSite;

            // 绑定站点
            webSite = new AllPower.BLL.SysManage.SysWebSite();
            dtWebSite = webSite.GetList("ALL", new SelectParams());
            ddlSiteID.DataValueField = "SiteID";
            ddlSiteID.DataTextField = "SiteName";
            ddlSiteID.DataSource = dtWebSite;
            ddlSiteID.DataBind();

            if(string.Equals(Action.ToLower(),"edit")) // 编辑
            {
                DataTable dtRecommendArea;
                SelectParams selParam;

                selParam = new SelectParams();
                selParam.S1 = ID;
                dtRecommendArea = recommendArea.GetList("ONE", selParam);

                btnEdit.Text = "修改";
                if (dtRecommendArea != null && dtRecommendArea.Rows.Count > 0)
                {
                    DataRow dr; // 当前编辑的记录

                    dr = dtRecommendArea.Rows[0];
                    txtFieldLength.Text = dr["FieldLength"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtFieldName.Text = dr["FieldName"].ToString().Replace("RA_","");
                    ddlSiteID.SelectedValue = dr["SiteID"].ToString();
                }
            }

        }
        #endregion
    }
}
