#region 程序集引用
using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AllPower.Common;
using AllPower.Model.Content;
using System.Text;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线

    作者:      吴岸标

    创建时间： 2010年6月21日

    功能描述： 模型字段添加/修改
--===============================================================*/
#endregion

namespace AllPower.Web.Admin
{
    public partial class FieldManageEdit : AdminPage
    {
        #region 变量成员
        private string _isSub = string.Empty;
        private string _modelName;                              // 所属模型名称
        private string _modelID;                                // 所属模型ID
        private string _tableName;                              // 所属模型表
        private string _modelFieldType;                         // 模型字段类型 1为一般模型,2为表单,3为商家
        protected string jsMessage;                             // 操作提示信息，js代码
        private string _urlParm;                                // 传递的参数
        protected string displayListVisible = "display:none;";
        private Hashtable hsFieldParam;                         // 当前模型字段要更新的字段值对
        private BLL.Content.FieldManage fieldManage;            // 业务处理对象
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
        /// 返回的传递参数
        /// </summary>
        public string UrlParam
        {
            get
            {
                if (string.IsNullOrEmpty(this._urlParm))
                {
                    foreach (string key in Request.QueryString.Keys)
                    {
                        if (key.ToLower() != "action" && key.ToLower() != "id") // 排序编辑页中的特定参数
                        {
                            if (string.IsNullOrEmpty(this._urlParm))
                            {
                                this._urlParm = key + "=" + Request.QueryString[key];
                            }
                            else
                            {
                                this._urlParm += "&" + key + "=" + Request.QueryString[key];
                            }
                        }
                    }
                }

                return this._urlParm;
            }
        }

        /// <summary>
        /// 所属模型表
        /// </summary>
        public string TableName
        {
            get
            {
                if (string.IsNullOrEmpty(this._tableName))
                {
                    this._tableName = Request.QueryString["tableName"];
                }

                return this._tableName;
            }
        }

        /// <summary>
        /// 所属模型ID
        /// </summary>
        public string ModelID
        {
            get
            {
                if (string.IsNullOrEmpty(this._modelID))
                {
                    this._modelID = Request.QueryString["ModelID"];
                }

                return this._modelID;
            }
        }

        /// <summary>
        /// 模型字段类型 1为一般模型,2为表单,3为商家
        /// </summary>
        public string ModelFieldType
        {
            get
            {
                if (string.IsNullOrEmpty(this._modelFieldType))
                {
                    this._modelFieldType = Request.QueryString["Type"];
                }

                return this._modelFieldType;
            }
        }
        /// <summary>
        /// 是否显示子模型
        /// </summary>
        public string IsSub
        {
            get
            {
                if (string.IsNullOrEmpty(this._isSub))
                {
                    this._isSub = Request.QueryString["IsSub"];

                    if (this._isSub == null || this._isSub.Trim() == "")
                    {
                        this._isSub = "0";
                    }
                }

                return this._isSub;
            }
        }

        #endregion

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            fieldManage = new AllPower.BLL.Content.FieldManage(ModelID, TableName);

            if (!IsPostBack)
            {
                PageInit();
            }
        }
        #endregion

        #region 页面初始数据加载 PageInit
        void PageInit()
        {
            DataTable dataTableField;
            bool isValidate;
            bool isAdd;

            isAdd = true;

            if (TableName.Substring(0, 4) == "K_F_")
            {
                displayListVisible = "display:block;";

                foreach (ListItem item in radlBasicField.Items)
                {
                    if (item.Value == "3" || item.Value == "11" || item.Value == "12" || item.Value == "14")
                    {
                        item.Enabled = false;
                    }
                }
            }

            if (IsSub == "1")
            {
                foreach (ListItem item in radlBasicField.Items)
                {
                    if (item.Value == "14")
                    {
                        item.Enabled = false;
                    }
                }
            }

            if (this.Action.ToLower() == "edit")
            {
                isAdd = false;
                isValidate = IsHaveRightByOperCode("Edit");  // 修改权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有修改模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
            }
            else
            {
                isValidate = IsHaveRightByOperCode("New");  // 添加权限认证

                if (!isValidate)
                {
                    jsMessage = "errmsg=\"对不起，您没有添加模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                }
            }

            fieldManage.SubModelBind(ddlSubModelName);               // 子模型列表绑定
            fieldManage.SubModelGroupBind(ddlSubModelGroup);         // 子模型分组绑定
            fieldManage.ModelFieldGroupBind(ddlModelFieldGroupId);   // 字段分组
            hdnModelID.Value = ModelID;
            fieldManage.ValidationTypeBind(radlValidationType);      // 绑定验证规则
            dataTableField = fieldManage.DropDownDataTypeBind(ddlDropDownTable, null);  // 绑定数据表
            ddlDropDownTextColumn.DataTextField = "Name";            // 绑定Text列
            ddlDropDownTextColumn.DataValueField = "Name";
            ddlDropDownTextColumn.DataSource = dataTableField;
            ddlDropDownTextColumn.DataBind();
            ddlDropDownValueColumn.DataTextField = "Name";           // 绑定Value列
            ddlDropDownValueColumn.DataValueField = "Name";
            ddlDropDownValueColumn.DataSource = dataTableField;
            ddlDropDownValueColumn.DataBind();

            if (!isAdd) // 编辑
            {
                DataTable dtField;
                AllPower.Model.SelectParams selParam;

                selParam = new AllPower.Model.SelectParams();
                selParam.S1 = ID;
                hdnAction.Value = "edit";
                btnModelField.Text = "修改";
                dtField = fieldManage.GetList("ONE", selParam);

                if (dtField != null && dtField.Rows.Count > 0)
                {
                    hdnBasicField.Value = dtField.Rows[0]["BasicField"].ToString().Trim();
                    BasicFieldInit(dtField.Rows[0]);
                    CommonFieldInit(dtField.Rows[0]);
                }
                else
                {
                    jsMessage = "errmsg=\"对不起，参数传递有误！\";id=\"" + ID + "\"";
                }
            }
            else  // 添加
            {
                hdnAction.Value = "add";
            }
        }
        #endregion

        #region 添加/更新字段
        protected void btnModelField_Click(object sender, EventArgs e)
        {
            int effectRow;
            string linkURL;
            bool isValidate;                                     // 权限验证

            if (!string.IsNullOrEmpty(this.ModelID))
            {
                hsFieldParam = new Hashtable();

                effectRow = 0;
                linkURL = "FieldManageList.aspx?" + UrlParam;
                AddBasicField();
                AddCommonField();
                hsFieldParam.Add("ModelID", ModelID);

                if (Action.ToLower() == "edit")                 // 编辑
                {
                    isValidate = IsHaveRightByOperCode("Edit"); // 修改权限认证

                    if (!isValidate)
                    {
                        jsMessage = "type=2;errmsg=\"对不起，您没有修改模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                    }
                    else
                    {
                        effectRow = fieldManage.Save(hsFieldParam, ID, hdnOriginalDefaultValue.Value, hdnOriginalDataColumnLength.Value);
                    }
                }
                else   // 添加
                {
                    string[] tableID;

                    isValidate = IsHaveRightByOperCode("New");  // 新增权限认证

                    if (!isValidate)
                    {
                        jsMessage = "type=2;errmsg=\"对不起，您没有添加模型的操作权限，请与管理员联系！\";id=\"" + ID + "\"";
                    }
                    else
                    {
                        tableID = GetTableID("0", "K_ModelField");
                        hsFieldParam.Add("ID", tableID[0]);
                        hsFieldParam.Add("Orders", tableID[1]);
                        effectRow = fieldManage.Save(hsFieldParam, null, null, null);
                    }
                }

                if (isValidate)
                {
                    if (effectRow > 0)
                    {
                        if (Action.ToLower() == "edit")
                        {
                            jsMessage = "type=1;title=\"" + hsFieldParam["Name"] + " \";id=\"" + this.ID + "\"";
                            WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + hsFieldParam["ID"] + ")更新成功", null, 2);
                        }
                        else
                        {
                            jsMessage = "type=0;title=\"" + hsFieldParam["Name"] + " \";id=\"" + this.ID + "\"";
                            WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + hsFieldParam["ID"] + ")添加成功", null, 2);
                        }
                    }
                    else
                    {
                        if (Action.ToLower() == "edit")
                        {
                            if (effectRow == -100)
                            {
                                jsMessage = "errmsg=\"对不起，缺省值更新失败。\";type=2;id=\"" + this.ID + "\";";
                                WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + hsFieldParam["ID"] + ")更新失败", "缺省值更新失败", 3);
                            }
                            else if (effectRow == -200)
                            {
                                jsMessage = "errmsg=\"对不起，数据类型长度更新失败。\";type=2;id=\"" + this.ID + "\";";
                                WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + hsFieldParam["ID"] + ")更新失败", "数据类型长度更新失败", 3);
                            }
                            else if (effectRow == -300)
                            {
                                jsMessage = "errmsg=\"缺省值及数据长度更新失败，暂不处理当前字段的数据类型。\";type=2;id=\"" + this.ID + "\";";
                                WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + this.ID + ")更新失败", "缺省值及数据长度更新失败", 3);
                            }
                            else
                            {
                                jsMessage = "errmsg=\"更新失败。\";type=2;id=\"" + this.ID + "\";";
                                WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + this.ID + ")更新失败", "更新失败", 3);
                            }
                        }
                        else
                        {
                            jsMessage = "errmsg=\"更新失败。\";type=2;id=\"" + hsFieldParam["ID"] + "\";";
                            WriteLog(ModelName + "模型的字段" + hsFieldParam["Name"] + "(" + hsFieldParam["ID"] + ")更新失败", "更新失败", 3);
                        }
                    }
                }
            }
            else
            {
                jsMessage += "alert({title:'操作提示',msg:'对不起，参数传递丢失。'});";
            }
        }
        #endregion

        #region  基本字段属性值初始加载
        private void BasicFieldInit(DataRow drField)
        {
            string basicField;

            basicField = drField["BasicField"].ToString();
            radlBasicField.SelectedValue = drField["BasicField"].ToString();
            hdnOriginalDataColumnLength.Value = drField["DataColumnLength"].ToString();
            hdnOriginalDefaultValue.Value = drField["DefaultValue"].ToString();

            switch (basicField)
            {
                case "1":  // 单文本属性加载
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                  // 文本框宽
                    txtTextBoxMaxLength.Text = drField["TextBoxMaxLength"].ToString();          // 最大字符数
                    radlValidationType.SelectedValue = drField["ValidationType"].ToString();    // 验证规则
                    txtValidationMessage.Text = drField["ValidationMessage"].ToString();        // 提示错误
                    txtTextBoxValidation.Text = drField["TextBoxValidation"].ToString();        // 正则表达式
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                  // 默认值
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();         // 字段表长度
                    break;
                case "2":   // 文本域

                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                  // 宽度
                    txtTextBoxHieght.Text = drField["TextBoxHieght"].ToString();                // 高度
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();         // 字段表长度

                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                  // 默认值

                    break;
                case "3":   // 多行文本（支持HTML）,编辑器类型
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                  // 宽度
                    txtTextBoxHieght.Text = drField["TextBoxHieght"].ToString();                // 高度
                    ddlEditorType.SelectedValue = drField["EditorType"].ToString();             // 编辑器类型
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();         // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                  // 默认值

                    switch (drField["EditorType"].ToString())
                    {
                        case "1":   // CKEditor编辑器
                            radlCKEditorStyle.SelectedValue = drField["EditorStyle"].ToString();
                            break;
                        case "2":   // eWebEditor编辑器
                            radleWebEditorStyle.SelectedValue = drField["EditorStyle"].ToString();
                            break;
                    }
                    break;
                case "4":   // 单选
                case "5":   // 多选
                case "6":   // 下拉列表
                case "7":   // 列表（可选择多列） 
                    DataTable dataTableField;

                    dataTableField = fieldManage.DropDownDataTypeBind(ddlDropDownTable, drField["DropDownTable"].ToString());  // 绑定数据表
                    ddlDropDownTextColumn.DataTextField = "Name";   // 绑定Text列
                    ddlDropDownTextColumn.DataValueField = "Name";
                    ddlDropDownTextColumn.DataSource = dataTableField;
                    ddlDropDownTextColumn.DataBind();
                    ddlDropDownValueColumn.DataTextField = "Name";   // 绑定Value列
                    ddlDropDownValueColumn.DataValueField = "Name";
                    ddlDropDownValueColumn.DataSource = dataTableField;
                    ddlDropDownValueColumn.DataBind();
                    radlDropDownDataType.SelectedValue = drField["DropDownDataType"].ToString();// 选项数据来源方式

                    foreach (ListItem item in ddlDropDownTable.Items)
                    {
                        if (item.Text == drField["DropDownTable"].ToString())
                        {
                            item.Selected = true;
                            break;
                        }
                    }

                    if (string.Equals(drField["DropDownDataType"].ToString(), "1"))             // 文本框输入方式
                    {
                        txtOptionsValue.Text = drField["OptionsValue"].ToString();              // 选项
                    }
                    else if (string.Equals(drField["DropDownDataType"].ToString(), "2"))        // 数据库读取方式
                    {
                        fieldManage.DDLByTextSelected(ddlDropDownTable, drField["DropDownTable"].ToString());// 数据表
                        ddlDropDownTextColumn.SelectedValue = drField["DropDownTextColumn"].ToString();      // Text列
                        ddlDropDownValueColumn.SelectedValue = drField["DropDownValueColumn"].ToString();    // Value列
                        txtDropDownSqlWhere.Text = drField["DropDownSqlWhere"].ToString();                   // sql查询条件
                        txtDropDownSql.Text = drField["DropDownSql"].ToString();                             // sql语句
                    }

                    if (basicField == "4" || basicField == "5")                   // 单选或多选有每行显示项数
                    {
                        txtOptionCount.Text = drField["OptionCount"].ToString();  // 每行显示项数
                    }

                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();          // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                   // 默认值
                    break;
                case "8":   // 数字
                case "9":   // 货币
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                    // 文本框宽
                    txtMinValue.Text = drField["MinValue"].ToString();                            // 最小值
                    txtMaxValue.Text = drField["MaxValue"].ToString();                            // 最大值
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                    // 默认值

                    if (basicField == "8")
                    {
                        NumberCount.SelectedValue = drField["NumberCount"].ToString();           // 小数位数
                    }
                    break;
                case "10":  // 日期时间
                    radlDateFormatOption.SelectedValue = drField["DateFormatOption"].ToString();  // 日期和时间格式
                    radlDateDefaultOption.SelectedValue = drField["DateDefaultOption"].ToString();// 默认值类型
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                    // 文本框长度
                    txtDefaultValue.Text = drField["DateDefaultOption"].ToString();               // 自定义默认值
                    break;
                case "11":  // 图片
                case "12":  // 文件
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                           // 文本框宽度
                    radlIsUpload.SelectedValue = drField["IsUpload"].ToString();                         // 是否启用上传
                    txtMaxSize.Text = drField["MaxSize"].ToString();                                     // 允许大小
                    txtImageType.Text = drField["ImageType"].ToString();                                 // 允许类型
                    chkIsSaveFileSize.Checked = Utils.ParseBool(drField["IsSaveFileSize"].ToString());   // 是否在数据库中保存文件大小
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();                  // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                           // 默认值

                    if (basicField == "11")
                    {
                        txtThumbWidth.Text = drField["ThumbWidth"].ToString();      // 缩略图宽 
                        txtThumbHeight.Text = drField["ThumbHeight"].ToString();    // 缩略图高

                        if (Utils.ParseBool(drField["IsAlbums"].ToString()))        // 启用相册
                        {
                            radlIsAlbums.SelectedValue = "1";

                            if(Utils.ParseBool(drField["IsAlbumsUploadThumb"].ToString())) // 相册启用缩略图上传
                            {
                               radlIsAlbumsUploadThumb.SelectedValue = "1";
                            }

                            if (Utils.ParseBool(drField["IsAlbumsDesc"].ToString()))       // 相册启用描述
                            {
                                radlIsAlbumsDesc.SelectedValue = "1";
                            }
                        }
                    }

                    if (Utils.ParseBool(drField["IsMultiFile"].ToString()))                   // 启用多文件
                    {
                        radlIsMultiFile.SelectedValue = "1";
                        txtTextBoxHieght.Text = drField["TextBoxHieght"].ToString();          // 高度
                    }
                    else
                    {
                        radlIsMultiFile.SelectedValue = "0";
                    }
                    break;
                case "13":  // 隐藏域
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();             // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                      // 默认值
                    break;
                case "14":  // 子模型
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();             // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                      // 默认值
                    ddlSubModelName.SelectedValue = drField["SubModelName"].ToString();
                    ddlRelatedType.SelectedValue = drField["RelatedType"].ToString();               // 子模型关联类型
                    ddlSubModelGroup.SelectedValue = drField["SubModelGroupID"].ToString();
                    ddlSubModelGroup.Enabled = false;
                    ddlSubModelName.Enabled = false;
                    ddlRelatedType.Enabled = false;
                    break;
                default: // 系统自定义字段
                    txtTextBoxWidth.Text = drField["TextBoxWidth"].ToString();                  // 宽度
                    txtTextBoxHieght.Text = drField["TextBoxHieght"].ToString();                // 高度
                    txtDataCoulumnLength.Text = drField["DataColumnLength"].ToString();         // 字段表长度
                    txtDefaultValue.Text = drField["DefaultValue"].ToString();                  // 默认值
                    break;
            }
        }
        #endregion

        #region 字段公共属性加载
        private void CommonFieldInit(DataRow drField)
        {
            txtName.Text = drField["Name"].ToString();                                      // 字段名
            txtName.ReadOnly = true;
            ddlModelFieldGroupId.SelectedValue = drField["ModelFieldGroupId"].ToString();   // 所属字段分组

            txtFieldAlias.Text = drField["FieldAlias"].ToString();                          // 字段别名
            txtMessage.Text = drField["Message"].ToString();                                // 提示信息

            if (Utils.ParseBool(drField["IsInterface"].ToString()))                        // 是否显示在接口列表中
            {
                radlIsInterface.SelectedValue = "1";
            }
            else
            {
                radlIsInterface.SelectedValue = "0";
            }

            if (Utils.ParseBool(drField["IsRequired"].ToString()))                         // 是否必填
            {
                radlIsRequired.SelectedValue = "1";
            }
            else
            {
                radlIsRequired.SelectedValue = "0";
            }

            if (Utils.ParseBool(drField["IsInputValue"].ToString()))                       // 是否从页面上输入值
            {
                radlIsInputValue.SelectedValue = "1";
            }
            else
            {
                radlIsInputValue.SelectedValue = "0";
            }
            if (Utils.ParseBool(drField["IsEnable"].ToString()))                            // 是否启用
            {
                radlIsEnable.SelectedValue = "1";
            }
            else
            {
                radlIsEnable.SelectedValue = "0";
            }

            if (Utils.ParseBool(drField["IsListVisible"].ToString()))                       // 是否在前台列表显示
            {
                radlIsListVisible.SelectedValue = "1";
            }
            else
            {
                radlIsListVisible.SelectedValue = "0";
            }

            chkIsSearch.Checked = Utils.ParseBool(drField["IsSearch"].ToString());          // 是否搜索条件
            chkIsListEnable.Checked = Utils.ParseBool(drField["IsListEnable"].ToString());  // 列表是否显示

            if (Utils.ParseBool(drField["IsRss"].ToString()))                               // 是否RSS字段
            {
                radlIsRss.SelectedValue = "1";
            }
            else
            {
                radlIsRss.SelectedValue = "0";
            }

            if (Utils.ParseBool(drField["IsSearch"].ToString())) // 在搜索栏中显示
            {
                ddlSearchUIType.SelectedValue = drField["SearchUIType"].ToString();             // 搜索界面方式
                txtSearchWidth.Text = drField["SearchWidth"].ToString();                        // 搜索框长度
                txtSearchOrders.Text = drField["SearchOrders"].ToString();                      // 搜索框排序
            }

            if (Utils.ParseBool(drField["IsListEnable"].ToString()))  // 在列表列中显示
            {
                txtListWidth.Text = drField["ListWidth"].ToString();                            // 列宽
                ddlListAlignment.SelectedValue = drField["ListAlignment"].ToString();           // 对齐方式
                txtListOrders.Text = drField["ListOrders"].ToString();                          // 显示顺序
                chkListIsLink.Checked = Utils.ParseBool(drField["ListIsLink"].ToString());      // 是否加链接

                chkListIsOrder.Checked = Utils.ParseBool(drField["ListIsOrder"].ToString());    // 是否排序 
                radlThumbDisplayType.SelectedValue = drField["ThumbDisplayType"].ToString();    // 列表缩略图显示方式

                if (Utils.ParseBool(drField["ListIsLink"].ToString()))  // 加链接
                {
                    txtListLinkUrl.Text = drField["ListLinkUrl"].ToString();                        // 链接地址和参数
                }

                if (Utils.ParseBool(drField["ListIsOrder"].ToString())) // 排序
                {
                    radlListOrderOption.SelectedValue = drField["ListOrderOption"].ToString();      // 排序方式
                }
            }
        }
        #endregion

        #region 获取基本字段属性值
        private void AddBasicField()
        {
            int basicFiledType;      // 基本字段类型,-1代表其它字段类型

            if (radlBasicField.Enabled)    // 添加
            {
                hsFieldParam.Add("BasicField", radlBasicField.SelectedValue);
            }
            else  // 编辑
            {
                hsFieldParam.Add("BasicField", hdnBasicField.Value);
            }

            basicFiledType = Utils.ParseInt(hsFieldParam["BasicField"].ToString(), -1);

            if (basicFiledType > 0 && basicFiledType < 15)
            {
                switch (basicFiledType)
                {
                    case 1:  // 单文本属性加载
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 0));           // 文本框长度
                        this.hsFieldParam.Add("TextBoxMaxLength", Utils.ParseInt(txtTextBoxMaxLength.Text, 0));   // 最大字符数
                        this.hsFieldParam.Add("ValidationType", radlValidationType.SelectedValue);               // 验证规则
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));  // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                             // 默认值

                        if (radlValidationType.SelectedValue.Trim() != "-1")    // 定义了验证规则
                        {
                            this.hsFieldParam.Add("ValidationMessage", txtValidationMessage.Text);                // 提示错误
                            this.hsFieldParam.Add("TextBoxValidation", txtTextBoxValidation.Text);                // 正则表达式
                        }
                        break;
                    case 2:   // 文本域
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 0));           // 宽度
                        this.hsFieldParam.Add("TextBoxHieght", Utils.ParseInt(txtTextBoxHieght.Text, 0));         // 高度     
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));  // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                              // 默认值
                        break;
                    case 3:   // 多行文本（支持HTML）,编辑器类型
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 100));           // 宽度
                        this.hsFieldParam.Add("TextBoxHieght", Utils.ParseInt(txtTextBoxHieght.Text, 0));           // 高度   
                        this.hsFieldParam.Add("EditorType", ddlEditorType.SelectedValue);                            // 编辑器类型
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));    // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                // 默认值

                        switch (ddlEditorType.SelectedValue)
                        {
                            case "1":  // CKEditor编辑器
                                this.hsFieldParam.Add("EditorStyle", radlCKEditorStyle.SelectedValue);
                                break;
                            case "2": // eWebEditor编辑器
                                this.hsFieldParam.Add("EditorStyle", radleWebEditorStyle.SelectedValue);
                                break;
                        }
                        break;
                    case 4:   // 单选
                    case 5:   // 多选
                    case 6:   // 下拉列表
                    case 7:   // 列表（可选择多列） 
                        this.hsFieldParam.Add("DropDownDataType", radlDropDownDataType.SelectedValue);               // 选项数据来源方式
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));    // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                // 默认值

                        if (basicFiledType == 4 || basicFiledType == 5)         // 单选或多选
                        {
                            this.hsFieldParam.Add("OptionCount", Utils.ParseInt(txtOptionCount.Text, -1));           // 添加每行显示项数
                        }

                        if (string.Equals(radlDropDownDataType.SelectedValue, "1"))                                // 文本框输入方式
                        {
                            this.hsFieldParam.Add("OptionsValue", txtOptionsValue.Text);
                        }
                        else if (string.Equals(radlDropDownDataType.SelectedValue, "2"))                           // 数据库读取方式
                        {
                            this.hsFieldParam.Add("DropDownTable", ddlDropDownTable.Items[ddlDropDownTable.SelectedIndex].Text);  // 数据表列表
                            this.hsFieldParam.Add("DropDownTextColumn", ddlDropDownTextColumn.SelectedValue);                     // Text列
                            this.hsFieldParam.Add("DropDownValueColumn", ddlDropDownValueColumn.SelectedValue);                   // Value列  
                            this.hsFieldParam.Add("DropDownSqlWhere", txtDropDownSqlWhere.Text);                                  // sql查询条件
                            this.hsFieldParam.Add("DropDownSql", txtDropDownSql.Text);                                            // sql语句
                        }
                        break;
                    case 8:   // 数字
                    case 9:   // 货币
                        this.hsFieldParam.Add("MinValue", txtMinValue.Text);                                           // 最小值
                        this.hsFieldParam.Add("MaxValue", txtMaxValue.Text);                                           // 最大值
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                   // 默认值
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 100));              // 文本框宽

                        if (basicFiledType == 8)     // 数字类型基本字段
                        {
                            this.hsFieldParam.Add("NumberCount", Utils.ParseInt(NumberCount.SelectedValue, 0));       // 小数位数
                        }
                        break;
                    case 10:  // 日期时间
                        this.hsFieldParam.Add("DateFormatOption", radlDateFormatOption.SelectedValue);                // 日期和时间格式
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 100));             // 文本框宽
                        this.hsFieldParam.Add("DateDefaultOption", radlDateDefaultOption.SelectedValue);              // 默认值类型

                        if (radlDateDefaultOption.SelectedValue.Trim() == "3")           // 指定日期
                        {
                            this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                             // 默认值
                        }
                        break;
                    case 11:  // 图片
                    case 12:  // 文件 
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 100));            // 文本框宽
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));     // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                 // 默认值
                        this.hsFieldParam.Add("IsMultiFile", Utils.ParseBool(radlIsMultiFile.SelectedValue));        // 是否多文件
                        this.hsFieldParam.Add("IsUpload", Utils.ParseBool(radlIsUpload.SelectedValue));              // 是否启用上传
                        this.hsFieldParam.Add("IsSaveFileSize", chkIsSaveFileSize.Checked);                          // 是否在数据库中保存文件大小

                        if (basicFiledType == 11)
                        {
                            this.hsFieldParam.Add("ThumbWidth", Utils.ParseInt(txtThumbWidth.Text.Trim(), 0));            // 缩略图宽
                            this.hsFieldParam.Add("ThumbHeight", Utils.ParseInt(txtThumbHeight.Text.Trim(), 0));          // 缩咯图高

                            if (Utils.ParseBool(radlIsAlbums.SelectedValue))    // 相册
                            {
                                this.hsFieldParam.Add("IsAlbums", 1);

                                if (Utils.ParseBool(radlIsAlbumsUploadThumb.SelectedValue))
                                {
                                    this.hsFieldParam.Add("IsAlbumsUploadThumb", 1);
                                }

                                if (Utils.ParseBool(radlIsAlbumsDesc.SelectedValue))
                                {
                                    this.hsFieldParam.Add("IsAlbumsDesc", 1);
                                }
                            }
                            else
                            {
                                this.hsFieldParam.Add("IsAlbums", 0);
                            }

                        }

                        if (Utils.ParseBool(radlIsMultiFile.SelectedValue))  // 多文件
                        {
                            this.hsFieldParam.Add("TextBoxHieght", Utils.ParseInt(txtTextBoxHieght.Text, 0));         // 高度   
                        }

                        if (Utils.ParseBool(radlIsUpload.SelectedValue))     // 启用上传
                        {
                            this.hsFieldParam.Add("MaxSize", Utils.ParseInt(txtMaxSize.Text, 9999));                  // 允许大小
                            this.hsFieldParam.Add("ImageType", txtImageType.Text);                                    // 允许类型
                        }

                        if (chkIsSaveFileSize.Checked)      // 保存文件大小
                        {
                            this.hsFieldParam.Add("SaveFileName", txtSaveFileName.Text.Trim());                      // 保存字段的名称
                        }
                        break;
                    case 13: // 隐藏域
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));     // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                 // 默认值
                        break;
                    case 14: // 子模型
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));     // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                 // 默认值
                        this.hsFieldParam.Add("RelatedType", ddlRelatedType.SelectedValue);                          // 子模型关联类型

                        if (ddlRelatedType.SelectedValue == "1")  // 关联到子模型
                        {
                            if (this.Action.ToLower() != "edit")
                            {
                                this.hsFieldParam.Add("SubModelName", ddlSubModelName.SelectedValue);
                            }
                        }
                        else  // 关联到分组
                        {
                            if (Request.Form["ddlSubModelGroup"] != null && Request.Form["ddlSubModelGroup"].Trim() != "" && this.Action.ToLower() != "edit")
                            {
                                this.hsFieldParam.Add("SubModelGroupID", Request.Form["ddlSubModelGroup"]);
                            }
                        }
                        break;
                    default: // 系统自定义字段
                        this.hsFieldParam.Add("TextBoxWidth", Utils.ParseInt(txtTextBoxWidth.Text, 100));            // 宽度
                        this.hsFieldParam.Add("TextBoxHieght", Utils.ParseInt(txtTextBoxHieght.Text, 0));            // 高度   
                        this.hsFieldParam.Add("DataColumnLength", Utils.ParseInt(txtDataCoulumnLength.Text, 0));     // 字段表长度
                        this.hsFieldParam.Add("DefaultValue", txtDefaultValue.Text);                                 // 默认值
                        break;
                }
            }
        }
        #endregion

        #region 获取公共属性值
        public void AddCommonField()
        {
            this.hsFieldParam.Add("Name", txtName.Text);                                        // 字段名称
            this.hsFieldParam.Add("ModelFieldGroupId", ddlModelFieldGroupId.SelectedValue);     // 所属字段分组
            this.hsFieldParam.Add("FieldAlias", txtFieldAlias.Text.Trim());                     // 字段别名
            this.hsFieldParam.Add("Message", txtMessage.Text.Trim());                           // 提示信息
            this.hsFieldParam.Add("IsRequired", radlIsRequired.SelectedValue);                  // 是否必填
            this.hsFieldParam.Add("IsInputValue", radlIsInputValue.SelectedValue);              // 是否从页面上输入值
            this.hsFieldParam.Add("IsEnable", radlIsEnable.SelectedValue);                      // 是否启用
            this.hsFieldParam.Add("IsListVisible", radlIsListVisible.SelectedValue);            // 是否在前台列表显示
            this.hsFieldParam.Add("IsSearch", chkIsSearch.Checked);                             // 是否搜索条件
            this.hsFieldParam.Add("IsListEnable", chkIsListEnable.Checked);                     // 列表是否显示
            this.hsFieldParam.Add("IsRss", radlIsRss.SelectedValue);                            // 是否RSS字段
            this.hsFieldParam.Add("IsInterface", radlIsInterface.SelectedValue);                // 是否在接口列表中显示

            if (chkIsSearch.Checked)        // 在搜索栏中显示
            {
                this.hsFieldParam.Add("SearchUIType", ddlSearchUIType.SelectedValue);            // 搜索界面方式
                this.hsFieldParam.Add("SearchWidth", txtSearchWidth.Text.Trim());                // 搜索框长度
                this.hsFieldParam.Add("SearchOrders", txtSearchOrders.Text.Trim());              // 搜索框排序
            }

            if (chkIsListEnable.Checked)   // 在列表列中显示
            {
                this.hsFieldParam.Add("ListWidth", txtListWidth.Text.Trim());                    // 列宽
                this.hsFieldParam.Add("ListAlignment", ddlListAlignment.SelectedValue);          // 对齐方式
                this.hsFieldParam.Add("ListOrders", txtListOrders.Text.Trim());                  // 显示顺序
                this.hsFieldParam.Add("ListIsLink", chkListIsLink.Checked);                      // 是否加链接
                this.hsFieldParam.Add("ListIsOrder", chkListIsOrder.Checked);                    // 是否排序
                this.hsFieldParam.Add("ThumbDisplayType", radlThumbDisplayType.SelectedValue);   // 列表缩略图显示方式

                if (chkListIsLink.Checked)  // 加链接
                {
                    this.hsFieldParam.Add("ListLinkUrl", txtListLinkUrl.Text.Trim());            // 链接地址和参数
                }

                if (chkListIsOrder.Checked) // 排序
                {
                    this.hsFieldParam.Add("ListOrderOption", radlListOrderOption.SelectedValue); // 排序方式
                }
            }
        }
        #endregion
    }
}
