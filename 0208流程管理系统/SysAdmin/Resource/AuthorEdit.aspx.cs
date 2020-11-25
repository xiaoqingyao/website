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
    功能描述： 作者编辑
 
// 更新日期        更新人      更新原因/内容
//
--===============================================================*/
#endregion


namespace AllPower.Web.Admin
{
    public partial class AuthorEdit : AdminPage
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
                        if (key != null)
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

        #region 添加/更新
        protected void Author_Edit(object sender, CommandEventArgs e)
        {
            string id;
            string returnMsg;          // 事务返回信息
            string tranType;           // 事务类型，添加或修改  
            AllPower.Model.Resource.Author mAuthor;
            AllPower.BLL.Resource.Author author;
            bool isValidate;                           // 权限验证
            string[] tableID;                          // 新增时表主键及排序                     

            id = hdnID.Value;
            returnMsg = "";
            tranType = "NEW";
            mAuthor = new AllPower.Model.Resource.Author();
            author = new AllPower.BLL.Resource.Author();

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
                    mAuthor.ID = id;
                    mAuthor.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mAuthor.Orders = Utils.ParseLong(txtOrders.Text.Trim(), 0);
                    mAuthor.BriefIntroduction = Utils.HtmlEncode(txtBriefIntroduction.Text.Trim());
                    mAuthor.Email = Utils.HtmlEncode(txtEmail.Text.Trim());
                    mAuthor.Fax = txtFax.Text.Trim();
                    mAuthor.HomePage = Utils.HtmlEncode(txtHomePage.Text.Trim());
                    mAuthor.IM = Utils.HtmlEncode(txtIM.Text.Trim());
                    mAuthor.IsEnable = Utils.ParseInt(radlIsEnable.SelectedValue, 0);
                    mAuthor.LinkAddress = Utils.HtmlEncode(txtLinkAddress.Text.Trim());
                    mAuthor.Tel = txtTel.Text.Trim();
                    mAuthor.IsRecommend = chkIsRecommend.Checked;
                    mAuthor.IsTop = chkIsTop.Checked;

                    try
                    {
                        if (txtBirthday.Text.Trim() != "")
                        {
                            mAuthor.Birthday = DateTime.Parse(txtBirthday.Text.Trim());
                        }
                        else
                        {
                            mAuthor.Birthday = null;
                        }
                    }
                    catch
                    {
                        jsMessage += "alert({title:'操作提示',msg:'日期格式错误'}";
                        return;
                    }

                    mAuthor.Company = Utils.HtmlEncode(txtCompany.Text.Trim());
                    mAuthor.Department = Utils.HtmlEncode(txtDepartment.Text.Trim());
                    mAuthor.Gender = Utils.ParseInt(radlGender.SelectedValue, 0);
                    mAuthor.TypeName = radlTypeName.SelectedValue;
                    mAuthor.Username = Utils.HtmlEncode(txtUsername.Text.Trim());
                    mAuthor.ZipCode = txtZipCode.Text.Trim();
                    mAuthor.Photo = txtPhone.Text;
                    returnMsg = author.Save(tranType, mAuthor);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=1;title=\"" + mAuthor.Name + " \";id=\"" + mAuthor.ID + "\"";
                        WriteLog("更新作者 " + mAuthor.Name + "(ID:" + mAuthor.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，更新失败，请重试。\";type=2;id=\"" + mAuthor.ID + "\";";
                        WriteLog("更新作者 " + mAuthor.Name + "(ID:" + mAuthor.ID + ") 失败。", returnMsg, 3);
                    }
                }
            }
            else  // 添加作者
            {
                isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                if (!isValidate)
                {
                    jsMessage = "type=2;errmsg=\"对不起，您没有添加作者的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
                else
                {
                    tableID = GetTableID("0", "K_Author");
                    mAuthor.ID = tableID[0];
                    mAuthor.Orders = Utils.ParseLong(tableID[1], 0);
                    mAuthor.AddDate = DateTime.Now;
                    mAuthor.AddMan = UserNo;
                    mAuthor.SiteID = SiteID.ToString();
                    mAuthor.Name = Utils.HtmlEncode(txtName.Text.Trim());
                    mAuthor.BriefIntroduction = Utils.HtmlEncode(txtBriefIntroduction.Text.Trim());
                    mAuthor.Email = Utils.HtmlEncode(txtEmail.Text.Trim());
                    mAuthor.Fax = txtFax.Text.Trim();
                    mAuthor.HomePage = Utils.HtmlEncode(txtHomePage.Text.Trim());
                    mAuthor.IM = Utils.HtmlEncode(txtIM.Text.Trim());
                    mAuthor.IsEnable = Utils.ParseInt(radlIsEnable.SelectedValue, 0);
                    mAuthor.LinkAddress = Utils.HtmlEncode(txtLinkAddress.Text.Trim());
                    mAuthor.Tel = txtTel.Text.Trim();
                    mAuthor.IsRecommend = chkIsRecommend.Checked;
                    mAuthor.IsTop = chkIsTop.Checked;

                    try
                    {
                        if (txtBirthday.Text.Trim() != "")
                        {
                            mAuthor.Birthday = DateTime.Parse(txtBirthday.Text.Trim());
                        }
                    }
                    catch
                    {
                        jsMessage = "errmsg=\"对不起，操作失败,日期格式错误。\";type=2;id=\"" + mAuthor.ID + "\";";
                        WriteLog("新增作者 " + mAuthor.Name + "(ID:" + mAuthor.ID + ") 失败！", "日期格式错误", 3);
                        return;
                    }

                    mAuthor.Company = Utils.HtmlEncode(txtCompany.Text.Trim());
                    mAuthor.Department = Utils.HtmlEncode(txtDepartment.Text.Trim());
                    mAuthor.Gender = Utils.ParseInt(radlGender.SelectedValue, 0);
                    mAuthor.TypeName = radlTypeName.SelectedValue;
                    mAuthor.Username = Utils.HtmlEncode(txtUsername.Text.Trim());
                    mAuthor.ZipCode = txtZipCode.Text.Trim();
                    mAuthor.Photo = txtPhone.Text;
                    returnMsg = author.Save(tranType, mAuthor);

                    if (string.Equals(returnMsg, "1"))  // 成功
                    {
                        jsMessage = "type=0;title=\"" + mAuthor.Name + " \";id=\"" +mAuthor.ID + "\"";
                        WriteLog("新增作者 " + mAuthor.Name + "(ID:" + mAuthor.ID + ") 成功！", null, 2);
                    }
                    else   // 失败
                    {
                        jsMessage = "errmsg=\"对不起，操作失败。\";type=2;id=\"" + mAuthor.ID + "\";";
                        WriteLog("新增作者 " + mAuthor.Name + "(ID:" + mAuthor.ID + ") 失败！", returnMsg, 3);
                    }
                }
            }
        }
        #endregion

        #region 初始化页面数据
        private void PageInit()
        {
            bool isValidate;

            if (this.Action.ToLower() == "edit")
            {
                AllPower.BLL.Resource.Author source;
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
                        jsMessage = "alertClose({title:'操作提示',msg:'参数丢失。'},function(){location.href='AuthorList.aspx?" + BackParam + "';})";
                    }
                    else
                    {
                        source = new AllPower.BLL.Resource.Author();
                        selParams = new SelectParams();
                        selParams.S1 = this.ID;
                        dt = source.GetList("ONE", selParams);

                        btnAuthor.Text = Utils.GetResourcesValue("Common", "Update");

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            DataRow dr = dt.Rows[0];

                            txtBirthday.Text = dr["Birthday"].ToString();
                            txtBriefIntroduction.Text = Utils.HtmlDecode(dr["BriefIntroduction"].ToString());
                            txtCompany.Text = Utils.HtmlDecode(dr["Company"].ToString());
                            txtDepartment.Text = Utils.HtmlDecode(dr["Department"].ToString());
                            txtEmail.Text = dr["Email"].ToString();
                            txtFax.Text = dr["Fax"].ToString();
                            txtHomePage.Text = Utils.HtmlDecode(dr["HomePage"].ToString());
                            txtIM.Text = Utils.HtmlDecode(dr["IM"].ToString());
                            txtLinkAddress.Text = Utils.HtmlDecode(dr["LinkAddress"].ToString());
                            txtName.Text = Utils.HtmlDecode(dr["Name"].ToString());
                            txtOrders.Text = dr["Orders"].ToString();
                            txtTel.Text = dr["Tel"].ToString();
                            txtUsername.Text = Utils.HtmlDecode(dr["Username"].ToString());
                            txtZipCode.Text = dr["ZipCode"].ToString().Trim();
                            ControlUtils.RadlSetValue(radlGender, dr["Gender"]);
                            ControlUtils.RadlSetValue(radlIsEnable, dr["IsEnable"]);
                            ControlUtils.RadlSetValue(radlTypeName, dr["TypeName"]);
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
