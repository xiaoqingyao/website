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
    功能描述： 推荐区域位置更新
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.WEB.SysAdmin.Model
{
    public partial class RecommendAreaPositionEdit : AdminPage
    {
        #region 变量成员
        private AllPower.BLL.Content.RecommendAreaPosition recommendAreaPosition;
        protected string areaID;
        protected string jsMessage;         // js处理提示信息
        private string _specialID;          // 专题ID
        protected string fontColor;         // 字体颜色
        #endregion

        #region 属性        /// <summary>
        /// 专题
        /// </summary>
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
            recommendAreaPosition = new AllPower.BLL.Content.RecommendAreaPosition();
            areaID = Request.QueryString["areaID"];

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 更新
        protected void RecommendAreaPosition_Edit(object sender, EventArgs e)
        {
            AllPower.Model.Content.RecommendAreaPosition mRecommendAreaPosition;
            string tranType;    // 操作类型
            string effectRow;   // 更新结果
            string listUrl;     // 返回路径

            tranType = "EDIT";
            listUrl = "RecommendAreaPositionList.aspx?ID=" + areaID + "&SpecialID=" + SpecialID;
            mRecommendAreaPosition = new AllPower.Model.Content.RecommendAreaPosition();
            mRecommendAreaPosition.Name = txtName.Text.Trim();
            mRecommendAreaPosition.Tags = txtTags.Text.Trim();
            mRecommendAreaPosition.RecommendAreaID = ddlRecommendAreaID.SelectedValue;
            mRecommendAreaPosition.FontColor = Request.Form["FontColor"];
            mRecommendAreaPosition.FontStyle = ddlFontSylte.SelectedValue;

            if (string.Equals(Action.ToLower(), "add")) // 添加
            {
                string[] tableID;

                tranType = "NEW";
                tableID = GetTableID("0", "K_RecommendAreaPosition");
                mRecommendAreaPosition.AddMan = UserNo;
                mRecommendAreaPosition.ID = tableID[0];
                mRecommendAreaPosition.Orders = Utils.ParseInt(tableID[1], 999);
                mRecommendAreaPosition.IsDel = false;
                mRecommendAreaPosition.IsEnable = true;
            }
            else
            {
                mRecommendAreaPosition.ID = ID; // 更新
            }

           effectRow = recommendAreaPosition.Save(tranType, mRecommendAreaPosition);    

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
            BLL.Content.RecommendArea recommendArea;
                DataTable dtRecommendArea;
                recommendArea = new BLL.Content.RecommendArea();

                dtRecommendArea = recommendArea.GetList("AREANAME", new AllPower.Model.SelectParams());
                ddlRecommendAreaID.DataTextField = "Name";
                ddlRecommendAreaID.DataValueField = "ID";
                ddlRecommendAreaID.DataSource = dtRecommendArea;
                ddlRecommendAreaID.DataBind();

                if (string.Equals(Action.ToLower(), "edit")) // 编辑
                {
                    DataTable dtRecommendAreaPosition;
                    SelectParams selParam;

                    selParam = new SelectParams();
                    selParam.S1 = ID;
                    dtRecommendAreaPosition = recommendAreaPosition.GetList("ONE", selParam);
                    btnEdit.Text = "修改";

                    if (dtRecommendAreaPosition != null && dtRecommendAreaPosition.Rows.Count > 0)
                    {
                        DataRow dr; // 当前编辑的记录

                        dr = dtRecommendAreaPosition.Rows[0];
                        txtName.Text = dr["Name"].ToString();
                        txtTags.Text = dr["Tags"].ToString();
                        fontColor = dr["FontColor"].ToString();
                        ddlFontSylte.SelectedValue = dr["FontSylte"].ToString();
                        ddlRecommendAreaID.SelectedValue = dr["RecommendAreaID"].ToString();
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(areaID))
                    {
                        ddlRecommendAreaID.SelectedValue = areaID;
                    }
                }

        }
        #endregion
    }
}
