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

using AllPower.Web.Admin;
using AllPower.Common;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年4月20日
    功能描述： 专题信息列表
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SpecialInfoList : System.Web.UI.Page
    {
        #region 私有变量成员
        protected int showType = 0;              // 显示类型 1 显示所有 2 显示专题信息 3 显示专题栏目
        private string _spcialID;                // 所属专题ID
        private string _specialMenuID;           // 所属栏目ID
        private string searchValue = null;       // 标题搜索内容
        protected string urlParam;               // 要传递的参数
        protected string backBtn = string.Empty; // 返回按钮代码
        #endregion

        #region 属性
        /// <summary>
        /// 专题主键
        /// </summary>
        public string SpecialID
        {
            get 
            {
                if (string.IsNullOrEmpty(this._spcialID))
                {
                    this._spcialID = Utils.ReqUrlParameter("SpecialID");
                }

                return this._spcialID;
            }
        }

        /// <summary>
        /// 专题栏目主键
        /// </summary>
        public string SpecialMenuID
        {
            get 
            {
                if (string.IsNullOrEmpty(this._specialMenuID))
                {
                    this._specialMenuID = Utils.ReqUrlParameter("SpecialMenuID");
                }

                return this._specialMenuID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SplitDataBind();
            }
        }
        #endregion

        #region 分页
        // 分页控件数据绑定
        private void SplitDataBind()
        {
            if (string.IsNullOrEmpty(this.SpecialID) && string.IsNullOrEmpty(this.SpecialMenuID)) // 显示所有            {
                this.showType = 1;
                this.urlParam = "";
            }
            else if (string.IsNullOrEmpty(this.SpecialMenuID))  // 显示专题信息
            {
                this.showType = 2;
                urlParam = "SpecialID=" + SpecialID + "&NodeCode=" + Request.QueryString["NodeCode"];
                backBtn = "<input type=\"button\" value=\"返回\" onclick=\"location.href='SpecialList.aspx?"+ urlParam +"'\" />";
            }
            else  // 显示专题栏目
            {
                urlParam = "SpecialID=" + SpecialID + "&SpecialMenuID=" + SpecialMenuID + "&NodeCode=" + Request.QueryString["NodeCode"];
                backBtn = "<input type=\"button\" value=\"返回\" onclick=\"location.href='SpecialMenuList.aspx?ID="+ SpecialID +"&" + urlParam + "'\" />";
                this.showType = 3;
            }
            AllPower.Model.Pager p = new AllPower.Model.Pager();
            AllPower.BLL.SysManage.SpecialInfoList objsource = new AllPower.BLL.SysManage.SpecialInfoList();

            p.Aspnetpage = Split;
            p.RptControls = rptSpecialInfo;
            objsource.PageData(p,this.SpecialID,this.SpecialMenuID,searchValue);
        }
        #endregion

        #region 搜索
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.searchValue = Common.Utils.cutBadStr(txtTitle.Text);
            SplitDataBind();
        }
        #endregion

        #region 删除
        protected void SpecialInfo_Del(object sender, CommandEventArgs e)
        { 
            AllPower.BLL.SysManage.SpecialInfoList sepcialInfo;

            sepcialInfo = new AllPower.BLL.SysManage.SpecialInfoList();
            sepcialInfo.Delete(e.CommandName,e.CommandArgument.ToString());
            SplitDataBind();
        }
        #endregion 
    }
}
