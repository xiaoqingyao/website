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
using System.Xml.Linq;

using AllPower.Common;
using AllPower.Model;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年3月10日
    功能描述： 关键字编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.Web.Admin
{
    public partial class KeywordEdit : AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;     // js提示
        protected string _backParam = string.Empty;     // 要返回的参数
        #endregion

        #region 属性
        public string BackParam
        {
            get
            {
                if (string.IsNullOrEmpty(this._backParam))
                {
                    foreach (string key in Request.QueryString.Keys)
                    {
                        if (string.IsNullOrEmpty(this._backParam))
                        {
                            this._backParam = key + "=" + Request.QueryString[key];
                        }
                        else
                        {
                            this._backParam += "&" + key + "=" + Request.QueryString[key];
                        }
                    }

                }

                return this._backParam;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 添加/修改
        protected void Keyword_Edit(object sender,CommandEventArgs e)
        {
            string id;
            string returnMsg;          // 事务返回信息
            string tranType;           // 事务类型，添加或修改  
            AllPower.Model.Resource.Keyword mKeyword;
            AllPower.BLL.Resource.Keyword keyword;
            bool isValidate;                           // 权限验证
            string[] tableID;                          // 新增时表主键及排序                     

            id = hdnID.Value;
            returnMsg = "";
            tranType = "NEW"; 
            mKeyword = new AllPower.Model.Resource.Keyword();
            keyword = new AllPower.BLL.Resource.Keyword();

            if (id != "")   // 修改关键字            {
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改当前记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    tranType = "EDIT";
                    mKeyword.ID = id;
                    mKeyword.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mKeyword.Orders = Utils.ParseLong(txtOrders.Text.Trim(), 0);
                    mKeyword.TypeName = radlTypeName.SelectedValue;
                    mKeyword.LastOperatorDate = DateTime.Now;
                    returnMsg = keyword.Save(tranType, mKeyword);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=1;title=\"" + mKeyword.Name + " \";id=\"" + mKeyword.ID + "\"";
                        WriteLog("更新关键字 " + mKeyword.Name + "(ID:" + mKeyword.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，更新失败，请重试。\";type=2;id=\"" + mKeyword.ID + "\";";
                        WriteLog("更新关键字 " + mKeyword.Name + "(ID:" + mKeyword.ID + ") 失败。", returnMsg, 3);
                    }
                }
            }
            else   // 添加关键字            {
                isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                if (!isValidate)
                {
                    jsMessage = "type=2;errmsg=\"对不起，您没有添加关键字的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                    return;
                }
                else
                {
                    tableID = GetTableID("0", "K_Keyword");
                    mKeyword.ID = tableID[0];
                    mKeyword.Orders = Utils.ParseLong(tableID[1], 0);
                    mKeyword.LastOperatorDate = DateTime.Now;
                    mKeyword.ID = GetTableID("0", "K_Keyword")[0];
                    mKeyword.AddDate = DateTime.Now;
                    mKeyword.AddMan = UserNo;
                    mKeyword.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mKeyword.ReferenceNum = 0;
                    mKeyword.SiteID = SiteID.ToString();
                    mKeyword.TypeName = radlTypeName.SelectedValue;
                    returnMsg = keyword.Save(tranType, mKeyword);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=0;title=\"" + mKeyword.Name + " \";id=\"" + mKeyword.ID + "\"";
                        WriteLog("新增关键字 " + mKeyword.Name + "(ID:" + mKeyword.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，操作失败。\";type=2;id=\"" + mKeyword.ID + "\";";
                        WriteLog("新增关键字 " + mKeyword.Name + "(ID:" + mKeyword.ID + ") 失败！", returnMsg, 3);
                    }
                }
            }
        }
        #endregion

        #region 加载页面初始数据
        private void PageInit()
        {
            bool isValidate;

            if (this.Action.ToLower() == "edit")
            {
                AllPower.BLL.Resource.Keyword keyword;
                SelectParams selParams;
                DataTable dt;

                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改当前记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    if (this.ID == "")
                    {
                        jsMessage = "alertClose({title:'操作提示',msg:'参数丢失。'},function(){location.href='KeyWordList.aspx?" + BackParam + "';})";
                    }
                    else
                    {
                        keyword = new AllPower.BLL.Resource.Keyword();
                        selParams = new SelectParams();
                        selParams.S1 = this.ID;
                        dt = keyword.GetList("ONE", selParams);
                        btnKeyWord.Text = Utils.GetResourcesValue("Common", "Update");

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            DataRow dr = dt.Rows[0];

                            txtName.Text = Utils.HtmlDecode(dr["Name"].ToString());
                            txtOrders.Text = dr["Orders"].ToString();
                            ControlUtils.RadlSetValue(radlTypeName, dr["TypeName"].ToString());
                            hdnID.Value = this.ID;
                        }
                    }
                }
            }
            else
            {
                isValidate = IsHaveRightByOperCode("New");  // 添加权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有添加记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
            }
        }
        #endregion
    }
}
