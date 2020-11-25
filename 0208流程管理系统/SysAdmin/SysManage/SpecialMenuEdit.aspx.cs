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
    Copyright (C) 2010 华强北在线    作者:      吴岸标    创建时间： 2010年4月20日    功能描述： 专题栏目编辑
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion

namespace AllPower.WEB.SysAdmin.SysManage
{
    public partial class SpecialMenuEdit : AdminPage
    {
        #region 变量
        protected string isCreateHtml;
        protected string noCreateHtml;
        protected string jsMessage;                     // js处理提示信息
        protected string _backParam = string.Empty;     // 要返回的参数
        private string _spcialID;
        #endregion

        #region URL参数
        public string BackParam
        {
            get
            {
                if (string.IsNullOrEmpty(this._backParam))
                {
                    foreach (string key in Request.QueryString.Keys)
                    {
                        if (key.ToLower() != "id")
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
                }

                return this._backParam;
            }
        }
        public string SpecialID
        {
            get
            {
                if (string.IsNullOrEmpty(_spcialID))
                {
                    this._spcialID = Utils.ReqUrlParameter("SpecialID");
                }
                return this._spcialID;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            // 验证是否登陆或超时

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 页面数据加载
        public void PageInit()
        {
            AllPower.BLL.Content.ModelManage modelManage;  // 模型业务操作类
            AllPower.BLL.SysManage.Special special;        // 专题栏目操作类
            AllPower.Model.SelectParams selParam;
            DataTable modelDT;
            DataTable specialDT;
            bool isValidate;

            modelManage = new AllPower.BLL.Content.ModelManage();
            special = new AllPower.BLL.SysManage.Special();
            selParam = new AllPower.Model.SelectParams();
            modelDT = modelManage.GetList("ALL", selParam);
            selParam.I1 = SiteID;
            specialDT = special.GetList("ALL", selParam);
            ddlModelID.DataTextField = "Title";
            ddlModelID.DataValueField = "ID";
            ddlModelID.DataSource = modelDT;
            ddlModelID.DataBind();
            ddlSpecialID.DataTextField = "Name";
            ddlSpecialID.DataValueField = "ID";
            ddlSpecialID.DataSource = specialDT;
            ddlSpecialID.DataBind();
            ddlSpecialID.SelectedValue = this.SpecialID;

            if (string.Equals(this.Action, "EDIT") && !string.IsNullOrEmpty(this.ID))
            {
                AllPower.BLL.SysManage.SpecialMenu specialMenu;        // 专题业务操作类
                DataTable specialMenuDT;

                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改当前记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {

                    specialMenu = new AllPower.BLL.SysManage.SpecialMenu();
                    selParam.S1 = this.ID;
                    specialMenuDT = specialMenu.GetList("ONE", selParam);

                    if (specialMenuDT != null && specialMenuDT.Rows.Count > 0)
                    {
                        ddlModelID.SelectedValue = specialMenuDT.Rows[0]["SpecialID"].ToString();
                        ddlSpecialID.SelectedValue = specialMenuDT.Rows[0]["ModelID"].ToString();
                        txtDescription.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["Desc"].ToString());
                        txtDirectoryName.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["DirectoryName"].ToString());
                        txtMetaDescription.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["MetaDescription"].ToString());
                        txtMetaKeyword.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["MetaKeyword"].ToString());
                        txtName.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["Name"].ToString());
                        txtRSTemplatePath.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["RSTemplatePath"].ToString());
                        txtTemplatePath.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["TemplatePath"].ToString());
                        txtTips.Text = Utils.HtmlDecode(specialMenuDT.Rows[0]["Tips"].ToString());
                        ddlModelID.SelectedValue = specialMenuDT.Rows[0]["ModelID"].ToString();

                        if (Utils.ParseBool(specialMenuDT.Rows[0]["Ishtml"].ToString()))
                        {
                            isCreateHtml = "checked=\"checked\"";
                        }
                        else
                        {
                            noCreateHtml = "checked=\"checked\"";
                        }
                        radlOpenType.SelectedValue = specialMenuDT.Rows[0]["OpenType"].ToString();
                        radlListPageSaveType.SelectedValue = specialMenuDT.Rows[0]["ListPageSaveType"].ToString();
                        ddlPagePostfix.SelectedValue = specialMenuDT.Rows[0]["PagePostfix"].ToString();
                        btnEdit.Text = "修改";
                    }
                    else
                    {
                        btnEdit.Text = "添加";
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

        #region 专题栏目更新
        protected void Special_Edit(object sender, EventArgs e)
        {
            AllPower.Model.SysManage.SpecialMenu mSpecial;     // 专题模型
            AllPower.BLL.SysManage.SpecialMenu special;        // 业务操作类
            string tranType;                                  // 操作类型
            string listUrl;                                   // 返回路径
            string returnMsg;                                 // 返回信息
            bool isValidate;                                  // 权限验证
            string[] tableID;                                 // 新增时表主键及排序    

            mSpecial = new AllPower.Model.SysManage.SpecialMenu();
            special = new AllPower.BLL.SysManage.SpecialMenu();

            returnMsg = string.Empty;
            tranType = "EDIT";
            listUrl = "SpecialMenuList.aspx?" + BackParam;
            mSpecial.Desc = Utils.HtmlEncode(txtDescription.Text);
            mSpecial.DirectoryName = Utils.HtmlEncode(txtDirectoryName.Text.Trim());
            mSpecial.Ishtml = Utils.ParseBool(Utils.ReqFromParameter("radIsCreateHtml"));
            mSpecial.ListPageSaveType = Utils.ParseInt(radlListPageSaveType.SelectedValue, 1);
            mSpecial.MetaDescription = Utils.HtmlEncode(txtMetaDescription.Text);
            mSpecial.MetaKeyword = Utils.HtmlEncode(txtMetaKeyword.Text);
            mSpecial.Name = Utils.HtmlEncode(txtName.Text.Trim());
            mSpecial.OpenType = Utils.ParseInt(radlOpenType.SelectedValue, 1);
            mSpecial.PagePostfix = Utils.ParseInt(ddlPagePostfix.SelectedValue, 1);
            mSpecial.TemplatePath = Utils.HtmlEncode(txtTemplatePath.Text.Trim());
            mSpecial.Tips = Utils.HtmlEncode(txtTips.Text.Trim());
            mSpecial.ModelID = ddlModelID.SelectedValue;
            mSpecial.SpecialID = ddlSpecialID.SelectedValue;

            if (!string.Equals(this.Action.ToLower(), "edit"))
            {
                isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                if (!isValidate)
                {
                    jsMessage = "type=2;errmsg=\"对不起，您没有添加专题的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    tranType = "NEW";
                    tableID = GetTableID("0", "K_SpecialMenu");
                    mSpecial.ID = tableID[0];
                    mSpecial.Orders = Utils.ParseInt(tableID[1], 100);
                    mSpecial.IsDel = false;
                    returnMsg = special.Save(tranType, mSpecial);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=0;title=\"" + mSpecial.Name + " \";id=\"" + mSpecial.ID + "\"";
                        WriteLog("新增专题栏目 " + mSpecial.Name + "(ID:" + mSpecial.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，操作失败。\";type=2;id=\"" + mSpecial.ID + "\";";
                        WriteLog("新增专题栏目 " + mSpecial.Name + "(ID:" + mSpecial.ID + ") 失败！", returnMsg, 3);
                    }

                }
            }
            else
            {
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改当前记录的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    mSpecial.ID = this.ID;
                    returnMsg = special.Save(tranType, mSpecial);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=1;title=\"" + mSpecial.Name + " \";id=\"" + mSpecial.ID + "\"";
                        WriteLog("更新专题栏目 " + mSpecial.Name + "(ID:" + mSpecial.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，更新失败，请重试。\";type=2;id=\"" + mSpecial.ID + "\";";
                        WriteLog("更新专题栏目 " + mSpecial.Name + "(ID:" + mSpecial.ID + ") 失败。", returnMsg, 3);
                    }
                }
            }
        }
        #endregion

    }
}
