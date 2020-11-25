#region 引用程序集

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;

using Wuqi.Webdiyer;
using KingTop.Common;
using KingTop.BLL.Content;
using KingTop.Web.Admin;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      吴岸标
    创建时间： 2010年6月28日
    功能描述： 模型字段特定属性配置
--===============================================================*/
#endregion

namespace KingTop.WEB.SysAdmin.Model
{
    public partial class FieldListConfig : AdminPage
    {
        #region 变量成员
        private string _configType;         // 配置类型  1 搜索 2 列表 3 编辑
        BLL.Content.FieldManage fileManage;
        protected string configTypeName;    
        protected string jsMessage;         // 提示信息
        private string _fieldName;
        private string _modelName;
        #endregion

        #region 属性
        /// <summary>
        /// 所属模型名称
        /// </summary>
        public string ModelName
        {
            get 
            {
                if (string.IsNullOrEmpty(this._modelName))
                {
                    this._modelName = Request.QueryString["ModelName"];
                }

                return this._modelName;
            }
        }
        /// <summary>
        /// 字段名称
        /// </summary>
        public string FieldName
        {
            get 
            {
                if (string.IsNullOrEmpty(this._fieldName))
                {
                    this._fieldName = Request.QueryString["FieldName"];
                }

                return this._fieldName;
            }
        }
        /// <summary>
        /// 配置类型  1 搜索 2 列表 3 编辑
        /// </summary>
        public string ConfigType
        {
            get
            {
                if (string.IsNullOrEmpty(this._configType))
                {
                    this._configType = Request.QueryString["ConfigType"];
                }

                return this._configType;
            }
        }
        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isValidate;

            isValidate = IsHaveRightByOperCode("Edit");

            fileManage = new FieldManage(null, null);
            if (!IsPostBack)
            {
                PageInit();
            }

            switch (ConfigType)     // 配置类型名称
            {
                case "1":   // 搜索
                    configTypeName = "搜索栏";
                    break;
                case "2":   // 列表
                    configTypeName = "列表页";
                    break;
                case "3":   // 编辑
                    configTypeName = "编辑页";
                    break;
            }

            if (!isValidate)
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑字段的权限，请与管理员联系。'},function(){parent.Closed();});";
            }
        }
        #endregion

        #region 初始数据加载
        private void PageInit()
        {
            DataTable dtFieldAttr;

            if (!string.IsNullOrEmpty(ConfigType) && !string.IsNullOrEmpty(this.ID))
            {
                dtFieldAttr = fileManage.GetSpecialFieldAtrr(ConfigType, this.ID);
                FieldAttribute.ActiveViewIndex = Utils.ParseInt(ConfigType, 1) - 1;

                if (dtFieldAttr != null && dtFieldAttr.Rows.Count > 0)
                {
                    DataRow dr;

                    dr = dtFieldAttr.Rows[0];
                    txtFieldAlias.Text = dr["FieldAlias"].ToString();  // 字段别名
                    labFieldName.Text = dr["FieldAlias"].ToString();   // 字段别名
                    hdnBasicField.Value = dr["BasicField"].ToString(); // 基本字段类型

                    switch (ConfigType)
                    {
                        case "1":   // 搜索
                            hdnEnable.Value = dr["IsSearch"].ToString();                    // 是否在搜索栏显示
                            ddlSearchUIType.SelectedValue = dr["SearchUIType"].ToString();  // 搜索界面范围
                            txtSearchWidth.Text = dr["SearchWidth"].ToString();             // 搜索框长度

                            txtSearchOrders.Text = dr["SearchOrders"].ToString();           // 搜索框排序

                            break;
                        case "2":   // 列表
                            hdnEnable.Value = dr["IsListEnable"].ToString();                            // 是否在列表显示

                            txtListWidth.Text = dr["ListWidth"].ToString();                             // 列宽
                            ddlListAlignment.SelectedValue = dr["ListAlignment"].ToString();            // 对齐方式
                            txtListOrders.Text = dr["ListOrders"].ToString();                           // 排序
                            chkListIsLink.Checked = Utils.ParseBool(dr["ListIsLink"]);                  // 是否加链接

                            txtListLinkUrl.Text = dr["ListLinkUrl"].ToString();                         // 链接地址和参数

                            chkListIsOrder.Checked = Utils.ParseBool(dr["ListIsOrder"]);                // 是否排序
                            radlListOrderOption.SelectedValue = dr["ListOrderOption"].ToString();       // 排序类型
                            radlThumbDisplayType.SelectedValue = dr["ThumbDisplayType"].ToString();     // 缩略图显示方式

                            break;
                        case "3":   // 编辑
                            hdnEnable.Value = dr["IsInputValue"].ToString();                // 是否在编辑页中显示

                            txtMessage.Text = dr["Message"].ToString();                     // 提示信息
                            txtTextBoxHieght.Text = dr["TextBoxHieght"].ToString();         // 文本框高
                            txtTextBoxWidth.Text = dr["TextBoxWidth"].ToString();           // 文本框宽
                            txtDefaultValue.Text = dr["DefaultValue"].ToString();           // 默认值

                            txtDataColumnLength.Text = dr["DataColumnLength"].ToString();   // 字段表长度

                            break;
                    }
                }
            }
        }
        #endregion

        #region 更新
        public void btnFieldAttribute_Click(object sender, EventArgs e)
        {
            Hashtable hsFieldValue;
            int effectRow;
            bool isValidate;
            string  fieldAttrName;

            fieldAttrName = string.Empty;
            isValidate = IsHaveRightByOperCode("Edit");
            if (isValidate)
            {

                if (!string.IsNullOrEmpty(this.ID) && !string.IsNullOrEmpty(ConfigType))
                {
                    hsFieldValue = new Hashtable();
                    hsFieldValue.Add("FieldAlias", txtFieldAlias.Text);
                    hsFieldValue.Add("ID", this.ID);
                    hsFieldValue.Add("ConfigType", ConfigType);

                    switch (ConfigType)
                    {
                        case "1":   // 搜索
                            hsFieldValue.Add("IsSearch", true);                                     // 是否在搜索栏显示
                            hsFieldValue.Add("SearchUIType", ddlSearchUIType.SelectedValue);        // 搜索界面范围
                            hsFieldValue.Add("SearchWidth", txtSearchWidth.Text);                   // 搜索框长度
                            hsFieldValue.Add("SearchOrders", txtSearchOrders.Text);                 // 搜索框排序
                            fieldAttrName = "IsSearch";
                            break;
                        case "2":   // 列表
                            hsFieldValue.Add("IsListEnable", true);                                 // 是否在列表显示
                            hsFieldValue.Add("ListWidth", txtListWidth.Text);                       // 列宽
                            hsFieldValue.Add("ListAlignment", ddlListAlignment.SelectedValue);      // 对齐方式
                            hsFieldValue.Add("ListOrders", txtListOrders.Text);                     // 排序
                            hsFieldValue.Add("ListIsLink", chkListIsLink.Checked);                  // 是否加链接
                            hsFieldValue.Add("ListLinkUrl", txtListLinkUrl.Text);                   // 链接地址和参数
                            hsFieldValue.Add("ListIsOrder", chkListIsOrder.Checked);                // 是否排序   
                            hsFieldValue.Add("ListOrderOption", radlListOrderOption.SelectedValue); // 排序类型
                            hsFieldValue.Add("ThumbDisplayType", radlThumbDisplayType.SelectedValue);// 缩略图显示方式
                            fieldAttrName = "IsListEnable";
                            break;
                        case "3":   // 编辑
                            hsFieldValue.Add("IsInputValue", true);                                 // 是否在编辑页中显示
                            hsFieldValue.Add("Message", txtMessage.Text);                           // 提示信息
                            hsFieldValue.Add("TextBoxHieght", txtTextBoxHieght.Text);               // 文本框高
                            hsFieldValue.Add("TextBoxWidth", txtTextBoxWidth.Text);                 // 文本框宽
                            hsFieldValue.Add("DefaultValue", txtDefaultValue.Text);                 // 默认值
                            hsFieldValue.Add("DataColumnLength", txtDataColumnLength.Text);         // 字段表长度
                            fieldAttrName = "IsInputValue";
                            break;
                    }

                    effectRow = fileManage.EditSpecialFieldAtrr(hsFieldValue);

                    if (effectRow > 0)  // 更新成功
                    {
                        jsMessage = "alertClose({title:'操作提示',msg:'恭喜您，" + configTypeName + "参数设置成功！'},function(){parent.location=parent.location;});";
                        WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 成功。", null, 2);
                    }
                    else  // 更新失败
                    {
                        if (effectRow == -100)
                        {
                            jsMessage = "alertClose({title:'操作提示',msg:'对不起，缺省值更新失败,请重试。'},function(){parent.Closed();});";
                            WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 失败。", "缺省值更新失败", 3);
                        }
                        else if (effectRow == -200)
                        {
                            jsMessage = "alertClose({title:'操作提示',msg:'对不起，数据类型长度更新失败,请重试。'},function(){parent.Closed();});";
                            WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 失败。", "数据类型长度更新失败", 3);
                        }
                        else if (effectRow == -300)
                        {
                            jsMessage = "alertClose({title:'操作提示',msg:'缺省值及数据长度更新失败，暂不处理当前字段的数据类型。'},function(){parent.Closed();});";
                            WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 失败。", "缺省值及数据长度更新失败，暂不处理当前字段的数据类型", 3);
                        }
                        else
                        {
                            jsMessage = "alertClose({title:'操作提示',msg:'对不起，操作失败,请重试。'},function(){parent.Closed();});";
                            WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 失败。", "操作失败", 3);
                        }
                    }
                }
                else
                {
                    jsMessage = "alertClose({title:'操作提示',msg:'对不起，设置失败，参数传递错误。'},function(){parent.Closed();});";
                    WriteLog("设置模型" + ModelName + "字段" + FieldName + "(" + this.ID + ")" + "的属性 " + fieldAttrName + " 失败。", "操作失败", 3);
                }
            }
            else
            {
                jsMessage = "alertClose({title:'操作提示',msg:'对不起，您没有编辑模型的权限，请与管理员联系。'},function(){parent.Closed();});";
            }
        }
        #endregion
    }
}
