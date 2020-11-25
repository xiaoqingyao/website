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
    创建时间： 2010年3月12日
    功能描述： 来源编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.Web.Admin
{
    public partial class SourceEdit : AllPower.Web.Admin.AdminPage
    {
        #region 变量成员
        protected string jsMessage = string.Empty;     // js提示
        protected string _backParam = string.Empty;    // 要返回的参数
        #endregion

        #region 属性
        /// <summary>
        /// 要返回的参数
        /// </summary>
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
        protected void Source_Edit(object sender, CommandEventArgs e)
        {
            string id;
            string returnMsg;          // 事务返回信息
            string tranType;           // 事务类型，添加或修改  
            AllPower.Model.Resource.Source mSource;
            AllPower.BLL.Resource.Source source;
            bool isValidate;                           // 权限验证
            string[] tableID;                          // 新增时表主键及排序                     

            id = hdnID.Value;
            returnMsg = "";
            tranType = "NEW";
            mSource = new AllPower.Model.Resource.Source();
            source = new AllPower.BLL.Resource.Source();

            if (id != "")   // 修改作者
            {
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改当前记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                    return;
                }
                else
                {
                    tranType = "EDIT";
                    mSource.ID = id;
                    mSource.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mSource.Orders = Utils.ParseLong(txtOrders.Text.Trim(), 0);
                    mSource.BriefIntroduction = Utils.HtmlEncode(txtBriefIntroduction.Text.Trim());
                    mSource.Email = Utils.HtmlEncode(txtEmail.Text.Trim());
                    mSource.Fax = txtFax.Text.Trim();
                    mSource.HomePage = Utils.HtmlEncode(txtHomePage.Text.Trim());
                    mSource.IM = Utils.HtmlEncode(txtIM.Text.Trim());
                    mSource.IsEnable = Utils.ParseInt(radlIsEnable.SelectedValue, 0);
                    mSource.LinkAddress = Utils.HtmlEncode(txtLinkAddress.Text.Trim());
                    mSource.LinkMan = Utils.HtmlEncode(txtLinkMan.Text.Trim());
                    mSource.Tel = txtTel.Text.Trim();
                    mSource.IsRecommend = chkIsRecommend.Checked;
                    mSource.IsTop = chkIsTop.Checked;
                    returnMsg = source.Save(tranType, mSource);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=1;title=\"" + mSource.Name + " \";id=\"" + mSource.ID + "\"";
                        WriteLog("更新来源 " + mSource.Name + "(ID:" + mSource.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，更新失败，请重试。\";type=2;id=\"" + mSource.ID + "\";";
                        WriteLog("更新来源 " + mSource.Name + "(ID:" + mSource.ID + ") 失败。", returnMsg, 3);
                    }
                }
            }
            else          // 添加
            {
                isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                if (!isValidate)
                {
                    jsMessage = "type=2;errmsg=\"对不起，您没有添加来源的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    tableID = GetTableID("0", "K_Source");
                    mSource.ID = tableID[0];
                    mSource.Orders = Utils.ParseLong(tableID[1], 0);
                    mSource.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mSource.BriefIntroduction = Utils.HtmlEncode(txtBriefIntroduction.Text.Trim());
                    mSource.Email = Utils.HtmlEncode(txtEmail.Text.Trim());
                    mSource.Fax = txtFax.Text.Trim();
                    mSource.HomePage = Utils.HtmlEncode(txtHomePage.Text.Trim());
                    mSource.IM = Utils.HtmlEncode(txtIM.Text.Trim());
                    mSource.IsEnable = Utils.ParseInt(radlIsEnable.SelectedValue, 0);
                    mSource.LinkAddress = Utils.HtmlEncode(txtLinkAddress.Text.Trim());
                    mSource.LinkMan = Utils.HtmlEncode(txtLinkMan.Text.Trim());
                    mSource.Tel = txtTel.Text.Trim();
                    mSource.ID = GetTableID("0", "K_Source")[0];
                    mSource.AddMan = UserNo;
                    mSource.SiteID = SiteID.ToString();
                    mSource.IsRecommend = chkIsRecommend.Checked;
                    mSource.IsTop = chkIsTop.Checked;

                    returnMsg = source.Save(tranType, mSource);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=0;title=\"" + mSource.Name + " \";id=\"" + mSource.ID + "\"";
                        WriteLog("新增来源 " + mSource.Name + "(ID:" + mSource.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，操作失败。\";type=2;id=\"" + mSource.ID + "\";";
                        WriteLog("新增来源 " + mSource.Name + "(ID:" + mSource.ID + ") 失败！", returnMsg, 3);
                    }
                }
            }
        }
        #endregion

        #region  为页面控件加载初始数据        private void PageInit()
        {
            bool isValidate;

            if (this.Action.ToLower() == "edit")
            {
                AllPower.BLL.Resource.Source source;
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
                        jsMessage = "alertClose({title:'操作提示',msg:'参数丢失。'},function(){location.href='SourceList.aspx?" + BackParam + "';})";
                    }
                    else
                    {
                        source = new AllPower.BLL.Resource.Source();
                        selParams = new SelectParams();
                        selParams.S1 = this.ID;
                        dt = source.GetList("ONE", selParams);

                        btnSource.Text = Utils.GetResourcesValue("Common", "Update");

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            DataRow dr = dt.Rows[0];

                            txtBriefIntroduction.Text = Utils.HtmlDecode(dr["BriefIntroduction"].ToString());
                            txtEmail.Text = Utils.HtmlDecode(dr["Email"].ToString());
                            txtFax.Text = dr["Fax"].ToString();
                            txtHomePage.Text = Utils.HtmlDecode(dr["HomePage"].ToString());
                            txtIM.Text = Utils.HtmlDecode(dr["IM"].ToString());
                            txtLinkAddress.Text = Utils.HtmlDecode(dr["LinkAddress"].ToString());
                            txtLinkMan.Text = Utils.HtmlDecode(dr["LinkMan"].ToString());
                            txtName.Text = Utils.HtmlDecode(dr["Name"].ToString());
                            txtOrders.Text = dr["Orders"].ToString();
                            txtTel.Text = dr["Tel"].ToString();
                            ControlUtils.RadlSetValue(radlIsEnable, dr["IsEnable"]);
                            chkIsTop.Checked = Utils.ParseBool(dr["IsTop"]);
                            chkIsRecommend.Checked = Utils.ParseBool(dr["IsRecommend"]);
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
