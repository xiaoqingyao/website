#region 程序集引用
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KingTop.Common;
using KingTop.Model.Content;
using System.Text;
#endregion

#region 版权注释
/*================================================================
    Copyright (C) 2010 华强北在线
    作者:      周武
    创建时间： 2010年3月12日
    功能描述： 模板字段添加/修改
--===============================================================*/
#endregion

namespace KingTop.Web.Admin
{
    public partial class ModelFieldEdit : AdminPage
    {
        #region 变量成员
        string strModelId;   // 所属模型
        ModelField modelFiled = null;
        BLL.Content.ModelField bllModelField;
        Model.Content.ModelManage modelManage;
        Model.Content.CustomForm modelForm;

        private string _action = null;
        private string strType = null;
        private string _id = null;

        private DataRow drModelField = null;
        protected string jsMessage;
        #endregion

        #region 属性
        public object ModelMange
        {
            get { return ViewState["ModelMange"]; }
            set { ViewState["ModelMange"] = value; }
        }  
     
        /// <summary>
        /// 字段类型
        /// </summary>
        public string StrType
        {
            get
            {
                if (strType == null)
                {
                    strType = Utils.UrlDecode(Utils.ReqUrlParameter("Type"));
                }
                if (strType == "")
                {
                    return "1";
                }
                return strType;
            }
        }
        
        public DataTable DtModelField
        {
            get { return ViewState["ModelField"] as DataTable; }
            set { ViewState["ModelField"] = value; }
        }

        /// <summary>
        /// 获取用户操作
        /// </summary>
        public string Action
        {
            get
            {
                if (this._action == null)
                {
                    this._action = Utils.ReqUrlParameter("Action").ToUpper();
                    if (_action == "")
                    {
                        _action = "NEW";
                    }
                }

                return this._action;
            }
        }

        /// <summary>
        /// 操作ID
        /// </summary>
        public string ID
        {
            get
            {
                if (this._id == null)
                {
                    this._id = Utils.ReqUrlParameter("ID");
                }

                return this._id;
            }
        }

        /// <summary>
        /// 分页页面参数
        /// </summary>       
        public string StrPageParams
        {
            get
            {
                string strPageParams = KingTop.Common.Utils.GetCookie(SystemConst.COOKIES_PAGE_KEY, Session.SessionID).Replace("|", "&");
                if (strPageParams.Length > 0)
                {
                    return "?" + strPageParams;
                }
                else
                {
                    return "";
                }
            }
        }

        /// <summary>
        /// 所属模型
        /// </summary>
        public string StrModelId
        {
            get
            {
                if (strModelId == null)
                {
                    strModelId = Utils.ReqUrlParameter("modelId");
                }
                return strModelId;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        { 
            bllModelField = new KingTop.BLL.Content.ModelField();
            modelManage = new ModelManage();
            modelForm = new CustomForm();

            if (!IsPostBack)
            {
                PageInit(); //数据初始化
            }
        }

        void PageInit()
        {           
            //绑定模型属性
            KingTop.BLL.Content.ModelManage bllModelManage = new KingTop.BLL.Content.ModelManage();
            KingTop.BLL.Content.CustomForm bllModelFrom = new KingTop.BLL.Content.CustomForm();
            DataTable dtModelManage = null;
            if (StrType == "1")
            {
                dtModelManage = bllModelManage.GetList("ONE", Utils.getOneParams(StrModelId));
                if (dtModelManage.Rows.Count > 0)
                {
                    modelManage.Title = dtModelManage.Rows[0]["title"].ToString();
                    modelManage.TableName = dtModelManage.Rows[0]["tablename"].ToString();
                    ModelMange = modelManage;
                    lblModelName.Text  = modelManage.Title;
                }
            }
            else if (StrType == "2")
            {
                dtModelManage = bllModelFrom.GetList("ONE", Utils.getOneParams(StrModelId));
                if (dtModelManage.Rows.Count > 0)
                {
                    modelForm.Name = dtModelManage.Rows[0]["Name"].ToString();
                    modelForm.TableName = dtModelManage.Rows[0]["tablename"].ToString();
                    ModelMange = modelForm;
                    lblModelName.Text = modelForm.Name;
                }
            }

          
            Dictionary<string, string> dicWhere = new Dictionary<string, string>();
            dicWhere.Add("TranType", "TABLE");
            dicWhere.Add("s1","");
            ControlUtils.DropDownDataBind(ddlDataBase, bllModelField.GetTableOrColumn(dicWhere).Tables[0],"NAME","ID"); //绑定表
            dicWhere.Clear();
            dicWhere.Add("TranType", "Column");
            dicWhere.Add("s1", ddlDataBase.SelectedValue);
            DataSet dsColumns = bllModelField.GetTableOrColumn(dicWhere);  //查询默认列
            //绑定表下面的列
            ControlUtils.DropDownDataBind(ddlTextColumn, dsColumns.Tables[0], "Name", "Name",false);
            ControlUtils.DropDownDataBind(ddlValueColumn, dsColumns.Tables[0], "Name", "Name",true);
            dsColumns.Dispose();

            KingTop.BLL.Content.ModelFieldGroup bllModelFieldGroup = new KingTop.BLL.Content.ModelFieldGroup();
            ControlUtils.DropDownDataBind(ddlFileGroup, bllModelFieldGroup.GetList("ALL", Utils.getOneParams(StrModelId)), "Name", "ID");  //模板分组下拉绑定               
            ControlUtils.RadioButtonListDataBind(rbtlFieldControls, Utils.GetXmlDataSet("../Configuraion/Model/FieldControls.xml").Tables[0], "Name", "value");  //绑定系统预定义控件      
            DataTable dtValidationType = Utils.GetXmlDataSet("../Configuraion/Model/ValidationTypes.xml").Tables[0];
            ControlUtils.RadioButtonListDataBind(rbtlValidationType, dtValidationType, "Name", "value");  //绑定验证类型
            ListItem litem = null;          
            #region 循环加入属性           
            for (int i = 0; i < rbtlValidationType.Items.Count; i++)
            {
                litem = rbtlValidationType.Items[i];
                litem.Attributes.Add("message", dtValidationType.Rows[i]["message"].ToString());
                litem.Attributes.Add("Validation", dtValidationType.Rows[i]["Validation"].ToString());
            }
            rbtlValidationType.Items.Insert(0, new ListItem(Utils.GetResourcesValue("Common","Null"), "-1"));
            litem = new ListItem(Utils.GetResourcesValue("Model","Customize"), "0");
            litem.Attributes.Add("message", "");
            litem.Attributes.Add("Validation", "");
            rbtlValidationType.Items.Add(litem);
            rbtlValidationType.SelectedIndex = 0;
            #endregion            

            
            #region 如果用户操作为修改或者复制,则初始化绑定

            if (Action == "EDIT" || Action=="COPY")
            {
                KingTop.Model.SelectParams selParams = new KingTop.Model.SelectParams();
                selParams.S1 = ID;
                DataTable dtModelField = bllModelField.GetList("ONE", selParams);
                DtModelField = dtModelField;
                if (dtModelField != null && dtModelField.Rows.Count > 0)
                {
                    drModelField = dtModelField.Rows[0];
                    InitEditorStyle(drModelField);      // 编辑器样式

                    if (Action == "EDIT")  //用户修改操作绑定
                    {
                        radlThumbDisplayType.SelectedValue = drModelField["ThumbDisplayType"].ToString();
                        txtFieldName.Text = drModelField["Name"].ToString();
                        txtFieldName.Enabled = false;
                        ddlFileGroup.SelectedValue = drModelField["ModelFieldGroupId"].ToString();
                        txtFieldAlias.Text = drModelField["FieldAlias"].ToString();
                        txtMessage.Text = drModelField["Message"].ToString();
                        if (!string.IsNullOrEmpty(drModelField["BasicField"].ToString()))
                        {
                            jsMessage += "ModelField.BasicFieldInit(\"" + drModelField["BasicField"].ToString() + "\");";
                        }
                        else
                        {
                            jsMessage += "ModelField.BasicFieldInit(\"0\");";
                        }
                        hdnBasicField.Value = drModelField["BasicField"].ToString();
                        btnSave.Text = Utils.GetResourcesValue("Common","Update");
                        BasicFieldInit(drModelField);
                    }
                    else
                    {
                        btnSave.Text = Utils.GetResourcesValue("Common","Add");
                    }
                    //字段类型绑定
                    if (drModelField["Controls"].ToString() != "")
                    {
                        rbtlFieldControls.SelectedValue = drModelField["Controls"].ToString();
                    }
                    else
                    {
                        rbtlBasicField.SelectedValue = drModelField["BasicField"].ToString();
                    }
                    rbtlIsRequired.SelectedValue = Utils.ParseBoolToInt(drModelField["IsRequired"].ToString()).ToString();  //是否必填
                    rbtlIsEnable.SelectedValue = Utils.ParseBoolToInt(drModelField["IsEnable"].ToString()).ToString();//是否启用
                    rbtlIsInput.SelectedValue = Utils.ParseBoolToInt(drModelField["IsInputValue"].ToString()).ToString(); //是否从页面上输入
                    rbtlIsListVisible.SelectedValue = Utils.ParseBoolToInt(drModelField["IsListVisible"].ToString()).ToString(); //是否显示在前台页面
                    //是否搜索条件
                    IsSearch.Checked = Utils.ParseBool(drModelField["IsSearch"].ToString());
                    if (IsSearch.Checked)
                    {
                        txtSearchWidth.Text = drModelField["SearchWidth"].ToString();
                        txtSearchOrders.Text = drModelField["SearchOrders"].ToString();
                    }
                    IsListEnable.Checked = Utils.ParseBool(drModelField["IsListEnable"].ToString());
                    txtListWidth.Text = drModelField["ListWidth"].ToString();
                    ListAlignment.SelectedValue = drModelField["ListAlignment"].ToString();
                    txtDataCoulumnLength.Text = drModelField["DataColumnLength"].ToString();
                    txtListOrders.Text = drModelField["ListOrders"].ToString();                 
                    //列表是否加链接
                    ListIsLink.Checked = Utils.ParseBool(drModelField["ListIsLink"].ToString());
                    if (ListIsLink.Checked)
                    {
                        txtListLinkUrl.Text = drModelField["ListLinkUrl"].ToString();
                    }
                    //列表是否要排序
                    ListIsOrder.Checked = Utils.ParseBool(drModelField["ListIsOrder"].ToString());
                    if (ListIsOrder.Checked)
                    {
                        rbtlListOrderOption.SelectedValue = drModelField["ListOrderOption"].ToString();
                    }
                    //是否要默认排序
                    ListIsDefaultOrder.Checked = Utils.ParseBool(drModelField["ListIsDefaultOrder"].ToString());
                    if (ListIsDefaultOrder.Checked)
                    {
                        rbtlListDefaultOrderOption.SelectedValue = drModelField["ListDefaultOrderOption"].ToString();
                    }
                    rbtlIsRss.SelectedValue = Utils.ParseBoolToInt(drModelField["IsRss"].ToString()).ToString();//是否RSS字段       
                    ControlUtils.SetGetCheckBoxListSelectValue(cblUserGroup, drModelField["UserGroupId"].ToString());
                    ControlUtils.SetGetCheckBoxListSelectValue(cblRoleGroup, drModelField["RoleGroupId"].ToString());
                    ddlUiType.SelectedValue = drModelField["SearchUIType"].ToString();
                    Utils.RunJavaScript(this, "ModelField.EditLoad();");
                    //禁止修改字段类型以级其相关的值
                    rbtlFieldControls.Enabled = false;
                    rbtlBasicField.Enabled = false;
                    //plField.Visible = false;
                    dtModelField.Dispose();
                }
                else
                {
                    Utils.UrlRedirect(this, "ModelFieldList.aspx" + StrPageParams,Utils.GetResourcesValue("Model","LinkErrorMessage"));
                }
                dtValidationType.Dispose();
              //  dtModelManage.Dispose();
            }
            #endregion
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            StringBuilder sbLog = new StringBuilder(16);
            modelFiled = new ModelField();
            EditorStyleAddToModel(ref modelFiled);  // 编辑器样式
            ModelSaveOrUpdate();
            string strAction = Action;
            if (Action == "NEW" || Action == "COPY") //如果当前操作为新增或者复制,则运算出id的值
            {
                sbLog.Append("新增");
                if (Action == "NEW")
                {
                    ModelSave();
                }
                else
                {
                    strAction = "NEW";
                    ModelCopy();
                }
                string[] strTableIdOrOrders = GetTableID("0", "K_ModelField");
                modelFiled.ID = strTableIdOrOrders[0];
                modelFiled.Orders = Utils.ParseInt(strTableIdOrOrders[1], 1) ; 
            }
            else  //否则直接绑定当前id
            {
                sbLog.Append("修改");
                modelFiled.ID = ID;
                BasicFieldUpdate(ref modelFiled);
            }
             string[] strMessage= null;
            //用户添加/修改操作
            if (StrType == "1")
            {
                strMessage = bllModelField.SavaOrUpdateNext(IsSaveFileSize.Checked, Action, modelFiled, (ModelMange as ModelManage).TableName);  //实际保存操作
            }
            else if (StrType == "2")
            {
                strMessage = bllModelField.SavaOrUpdateNext(IsSaveFileSize.Checked, Action, modelFiled, (ModelMange as CustomForm).TableName);  //实际保存操作
            }
            sbLog.Append(strMessage[1]);
            WriteLog(sbLog.ToString(),"",2);
            if(strMessage[0]=="0")  //操作失败
            {
                 Utils.AlertJavaScript(this, strMessage[1]);
            }
            else //成功
            {
                 Utils.UrlRedirect(this, "ModelFieldList.aspx" + StrPageParams, strMessage[1]);
            }            

          //用户操作
            if (DtModelField != null)
            {
                DtModelField.Dispose();
            }          
        }

        /// <summary>
        /// 添加操作所用到的属性绑定
        /// </summary>
        private void ModelSave()
        {
            modelFiled.ModelId = StrModelId;
            modelFiled.Name = txtFieldName.Text.Trim();
            modelFiled.BasicField = rbtlBasicField.SelectedValue;
            modelFiled.Controls = rbtlFieldControls.SelectedValue;
            modelFiled.TextBoxMaxLength = Utils.ParseInt(txtMaxLength.Text.Trim(), 10);
            modelFiled.TextBoxValidation = TextBoxValidation.Text.Trim();
            modelFiled.ValidationType = rbtlValidationType.SelectedValue;
            modelFiled.ValidationMessage = txtValidationMessage.Text.Trim();
            modelFiled.EditorType = ddlEditorType.SelectedValue;
            modelFiled.OptionsValue = txtOptionsValue.Text.Trim();
            modelFiled.OptionCount = Utils.ParseInt(txtOptionCount.Text.Trim(), 5);
            modelFiled.MinValue = txtMinValue.Text.Trim();
            modelFiled.MaxValue = txtMaxValue.Text.Trim();
            modelFiled.DateDefaultOption = rbtlDateDefaultOption.SelectedValue;
            modelFiled.DateFormatOption = rbtlDateFormatOption.SelectedValue;
            modelFiled.IsUpload = Utils.ParseBool(rbtlIsUpload.SelectedValue);
            modelFiled.MaxSize = Utils.ParseInt(txtMaxSize.Text.Trim(), 500);
            modelFiled.ImageType = txtImageType.Text.Trim();
            modelFiled.IsSaveFileSize = IsSaveFileSize.Checked;
            modelFiled.SaveFileName = txtSaveFileName.Text.Trim();
            if (rbtlBasicField.SelectedValue == "11")
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtImagesWidth.Text.Trim(), 100);
                modelFiled.ThumbWidth = Utils.ParseInt(txtThumbWidth.Text.Trim(), 0);         // 缩略图宽
                modelFiled.ThumbHeight = Utils.ParseInt(txtThumbHeight.Text.Trim(), 0);       // 缩略图高
            }

            if (rbtlBasicField.SelectedValue == "12")
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtImagesWidth.Text.Trim(), 100);
            }
            if (rbtlBasicField.SelectedValue == "10")
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtDataBoxWidth.Text.Trim(), 100);
            }
            if (rbtlBasicField.SelectedValue == "8" || rbtlBasicField.SelectedValue == "9")
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtDigitBoxWidth.Text.Trim(), 100);
            }
            if (rbtlBasicField.SelectedValue == "4" || rbtlBasicField.SelectedValue == "5" || rbtlBasicField.SelectedValue == "6" || rbtlBasicField.SelectedValue == "7")  //如果当前选择的是下拉 则插入数据,否则为-1
            {
                modelFiled.DropDownDataType = rbtlDropDownDataType.SelectedValue;
                modelFiled.DropDownSql = txtDropDownSql.Text.Trim();              
                if (rbtlDropDownDataType.SelectedValue == "2") //如果是从数据库中读取数据才保存表名
                {
                    modelFiled.DropDownTable = ddlDataBase.Items[ddlDataBase.SelectedIndex].Text;
                    if (hidTextColumn.Value != "")
                    {
                        modelFiled.DropDownTextColumn = hidTextColumn.Value;
                        modelFiled.DropDownValueColumn = hidValueColumn.Value;
                    }
                    else
                    {
                        modelFiled.DropDownTextColumn = ddlTextColumn.SelectedValue;
                        modelFiled.DropDownValueColumn = ddlValueColumn.SelectedValue;
                    }
                }
                else
                {
                    modelFiled.DropDownTable = "";
                    modelFiled.DropDownTextColumn = "";
                    modelFiled.DropDownValueColumn = "";
                }
            }
            else
            {
                modelFiled.DropDownDataType = "-1";
                modelFiled.DropDownSql = "";
                modelFiled.DropDownTable = "";
                modelFiled.DropDownTextColumn = "";
                modelFiled.DropDownValueColumn = "";
            }           
            modelFiled.NumberCount = Utils.ParseInt(NumberCount.SelectedValue, 0);        
           // modelFiled.UserNo = Utils.GetUserNo();
            modelFiled.TextBoxHieght = Utils.ParseInt(txtHieght.Text.Trim(), 15);
            modelFiled.DropDownSqlWhere = txtSqlWhere.Text.Trim();
            modelFiled.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text.Trim(),100);
            if (rbtlBasicField.SelectedValue == "2")
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtWidth.Text.Trim(), 15);
            }
            else
            {
                modelFiled.TextBoxWidth = Utils.ParseInt(txtBoxWidth.Text.Trim(), 10);
            }
            if (rbtlBasicField.SelectedValue == "10")
            {
                modelFiled.DefaultValue = txtDefaultDateValue.Text.Trim();
            }
            else
            {
                modelFiled.DefaultValue = txtDefaultValue.Text.Trim();
            }

            modelFiled.ModelFieldType = Utils.ParseInt(StrType, 1);           
           
        }

        /// <summary>
        /// 复制操作所用到的属性绑定
        /// </summary>
        private void ModelCopy()
        {
            drModelField = DtModelField.Rows[0];
            modelFiled.ModelId = StrModelId;
            modelFiled.Name = txtFieldName.Text.Trim();
            modelFiled.BasicField = drModelField["BasicField"].ToString();
            modelFiled.Controls = drModelField["Controls"].ToString();
            modelFiled.TextBoxMaxLength = Utils.ParseInt(drModelField["TextBoxMaxLength"].ToString(), 10);
            modelFiled.TextBoxValidation = drModelField["TextBoxValidation"].ToString();
            modelFiled.ValidationType = drModelField["ValidationType"].ToString();
            modelFiled.ValidationMessage = drModelField["ValidationMessage"].ToString();
            modelFiled.EditorType = drModelField["EditorType"].ToString();
            modelFiled.OptionsValue = drModelField["OptionsValue"].ToString();
            modelFiled.OptionCount = Utils.ParseInt(drModelField["OptionCount"], 5);
            modelFiled.MinValue = drModelField["MinValue"].ToString();
            modelFiled.MaxValue = drModelField["MaxValue"].ToString();
            modelFiled.DateDefaultOption = drModelField["DateDefaultOption"].ToString();
            modelFiled.DateFormatOption = drModelField["DateFormatOption"].ToString();
            modelFiled.IsUpload = Utils.ParseBool(drModelField["IsUpload"]);
            modelFiled.MaxSize = Utils.ParseInt(drModelField["MaxSize"], 500);
            modelFiled.ImageType = drModelField["ImageType"].ToString();
            modelFiled.IsSaveFileSize = Utils.ParseBool(drModelField["IsSaveFileSize"]);
            modelFiled.SaveFileName = drModelField["SaveFileName"].ToString();
            modelFiled.DropDownDataType = drModelField["DropDownDataType"].ToString();
            modelFiled.DropDownSql = drModelField["DropDownSql"].ToString();
            modelFiled.NumberCount = Utils.ParseInt(drModelField["NumberCount"], 0);
           // modelFiled.UserNo = Utils.GetUserNo();
            modelFiled.TextBoxHieght = Utils.ParseInt(drModelField["TextBoxHieght"], 15);
            modelFiled.TextBoxWidth = Utils.ParseInt(drModelField["TextBoxWidth"], 15);
            modelFiled.DefaultValue = drModelField["DefaultValue"].ToString();
            modelFiled.DropDownTextColumn = drModelField["DropDownTextColumn"].ToString();
            modelFiled.DropDownValueColumn = drModelField["DropDownValueColumn"].ToString();
            modelFiled.DropDownSqlWhere = drModelField["DropDownSqlWhere"].ToString();
            modelFiled.DropDownTable = drModelField["DropDownTable"].ToString();
            modelFiled.DataColumnLength = Utils.ParseInt(drModelField["DataColumnLength"], 100);
            modelFiled.ModelFieldType = Utils.ParseInt(drModelField["ModelFieldType"], 1);  
        }

        /// <summary>
        /// 基本属性绑定
        /// </summary>
        private void ModelSaveOrUpdate()
        {
            modelFiled.ThumbDisplayType = Utils.ParseInt(radlThumbDisplayType.SelectedValue,1);
            modelFiled.ModelFieldGroupId = ddlFileGroup.SelectedValue;
            modelFiled.FieldAlias = txtFieldAlias.Text.Trim();
            modelFiled.Message = txtMessage.Text.Trim();           
            modelFiled.IsRequired = Utils.ParseBool(rbtlIsRequired.SelectedValue);
            modelFiled.IsInputValue = Utils.ParseBool(rbtlIsInput.SelectedValue);
            modelFiled.IsEnable = Utils.ParseBool(rbtlIsEnable.SelectedValue);           
            modelFiled.IsSearch = IsSearch.Checked;
            modelFiled.SearchWidth = Utils.ParseInt(txtSearchWidth.Text.Trim(),1);
            modelFiled.SearchOrders = Utils.ParseInt(txtSearchOrders.Text.Trim(), 1);
            modelFiled.ListWidth = txtListWidth.Text.Trim();
            modelFiled.ListAlignment = ListAlignment.SelectedValue;
            modelFiled.ListOrders = Utils.ParseInt(txtListOrders.Text.Trim(), 1);
            modelFiled.ListIsLink = ListIsLink.Checked;
            modelFiled.ListLinkUrl = txtListLinkUrl.Text.Trim();
            modelFiled.ListIsOrder = ListIsOrder.Checked;
            modelFiled.ListOrderOption = rbtlListOrderOption.SelectedValue;
            modelFiled.ListIsDefaultOrder = ListIsDefaultOrder.Checked;
            modelFiled.ListDefaultOrderOption = rbtlListDefaultOrderOption.SelectedValue;
            modelFiled.IsRss = Utils.ParseBool(rbtlIsRss.SelectedValue);
            modelFiled.UserGroupId =  ControlUtils.GetCheckBoxListSelectValue(cblUserGroup);
            modelFiled.RoleGroupId = ControlUtils.GetCheckBoxListSelectValue(cblRoleGroup);           
            modelFiled.IsListEnable = IsListEnable.Checked;
            modelFiled.SearchUIType = ddlUiType.SelectedValue;
            modelFiled.IsListVisible = Utils.ParseBool(rbtlIsListVisible.SelectedValue);
            modelFiled.IsMultiFile = Utils.ParseBool(radlIsMultiFile.SelectedValue);            // 是否多文件(图片）
        }

        #region 编辑器类型添加
        /// <summary>
        /// 作者：吴岸标
        /// </summary>
        /// <param name="mModeField"></param>
        private void EditorStyleAddToModel(ref Model.Content.ModelField mModeField)
        {
            string editorType;   // 编辑器类型
            string editorStyle;  // 编辑器样式

            editorType = ddlEditorType.SelectedValue;
            switch (editorType)
            {
                case "1":  // CKEditor编辑器
                    editorStyle = radlCKEditorStyle.SelectedValue;
                    break;
                case "2": // eWebEditor编辑器
                    editorStyle = radleWebEditorStyle.SelectedValue;
                    break;
                default:
                    editorStyle = null;
                    break;
            }

            mModeField.EditorStyle = editorStyle;
        }
        #endregion

        #region 编辑器类型加载
        /// <summary>
        /// 作者：吴岸标
        /// </summary>
        /// <param name="drModelField"></param>
        private void InitEditorStyle(DataRow drModelField)
        {
            string editorType;   // 编辑器类型
            string editorStyle;  // 编辑器样式

            if (drModelField != null)
            {
                editorType = drModelField["EditorType"].ToString();
                editorStyle = drModelField["EditorStyle"].ToString();

                switch (editorType)
                {
                    case "1":   // CKEditor编辑器
                        radlCKEditorStyle.SelectedValue = editorStyle;
                        break;
                    case "2":   // eWebEditor编辑器
                        radleWebEditorStyle.SelectedValue = editorStyle;
                        break;
                }
            }
        }
        #endregion

        #region  基本字段初始加载
        /// <summary>
        /// 作者：吴岸标
        /// </summary>
        /// <param name="fieldDR"></param>
        private void BasicFieldInit(DataRow fieldDR)
        {
            string basicField = fieldDR["BasicField"].ToString();
            if (!string.IsNullOrEmpty(basicField))
            {
                switch (basicField)
                {
                    case "1":  // 单文本属性加载
                        txtBoxWidth.Text = fieldDR["TextBoxWidth"].ToString();                      // 文本框长度
                        txtMaxLength.Text = fieldDR["TextBoxMaxLength"].ToString();                 // 最大字符数
                        rbtlValidationType.SelectedValue = fieldDR["ValidationType"].ToString();    // 验证规则
                        txtValidationMessage.Text = fieldDR["ValidationMessage"].ToString();        // 提示错误
                        TextBoxValidation.Text = fieldDR["TextBoxValidation"].ToString();           // 正则表达式
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();         // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                  // 默认值
                        break;  
                    case "2":   // 文本域
                        txtWidth.Text = fieldDR["TextBoxWidth"].ToString();                         // 宽度
                        txtHieght.Text = fieldDR["TextBoxHieght"].ToString();                       // 高度
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();         // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                  // 默认值
                        break;
                    case "3":   // 多行文本（支持HTML）,编辑器类型
                        txtWidth.Text = fieldDR["TextBoxWidth"].ToString();                         // 宽度
                        txtHieght.Text = fieldDR["TextBoxHieght"].ToString();                       // 高度
                        ddlEditorType.SelectedValue = fieldDR["EditorType"].ToString();             // 编辑器类型
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();         // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                  // 默认值
                        break;
                    case "4":   // 单选
                    case "5":   // 多选
                    case "6":   // 下拉列表
                    case "7":   // 列表（可选择多列） 
                        rbtlDropDownDataType.SelectedValue = fieldDR["DropDownDataType"].ToString();
                        if (string.Equals(fieldDR["DropDownDataType"].ToString(), "1"))             // 文本框输入方式
                        {
                            txtOptionsValue.Text = fieldDR["OptionsValue"].ToString();
                        }
                        else if (string.Equals(fieldDR["DropDownDataType"].ToString(), "2"))         // 数据库读取方式
                        {
                            foreach (ListItem li in ddlDataBase.Items)  // 数据表列表
                            {
                                if(li.Text == fieldDR["DropDownTable"].ToString())  //是当前值
                                {
                                    li.Selected = true;
                                }
                                break;
                            }                                 
                            ddlTextColumn.SelectedValue = fieldDR["DropDownTextColumn"].ToString();  // Text列
                            ddlValueColumn.SelectedValue = fieldDR["DropDownValueColumn"].ToString();// Value列
                            txtSqlWhere.Text = fieldDR["DropDownSqlWhere"].ToString();               // sql查询条件
                            txtDropDownSql.Text = fieldDR["DropDownSql"].ToString();                 // sql语句
                        }

                        txtOptionCount.Text = fieldDR["OptionCount"].ToString();                     // 选项
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();          // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                   // 默认值
                        if (Utils.ParseBool(fieldDR["IsSystemFiierd"].ToString()))
                        {
                            jsMessage += "$(\"#columnLength\").hide();";
                        }
                        break;
                    case "8":   // 数字
                    case "9":   // 货币
                       NumberCount.SelectedValue = fieldDR["NumberCount"].ToString();                // 小数位数
                       txtMinValue.Text = fieldDR["MinValue"].ToString();                            // 最小值
                       txtMaxValue.Text = fieldDR["MaxValue"].ToString();                            // 最大值
                       txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();           // 字段表长度
                       txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                    // 默认值
                       txtDigitBoxWidth.Text = fieldDR["TextBoxWidth"].ToString();
                       break;
                    case "10":  // 日期时间
                        rbtlDateFormatOption.SelectedValue = fieldDR["DateFormatOption"].ToString();  // 日期和时间格式
                        rbtlDateDefaultOption.SelectedValue = fieldDR["DateDefaultOption"].ToString();// 默认值
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();           // 字段表长度
                        txtDataBoxWidth.Text = fieldDR["TextBoxWidth"].ToString();                    // 文本框长度
                        break;
                    case "11":  // 图片
                        if (Utils.ParseBool(fieldDR["IsMultiFile"].ToString()))                   // 启用多文件
                        {
                            radlIsMultiFile.SelectedValue = "1";
                            txtMultiFieldHeight.Text = fieldDR["TextBoxHieght"].ToString();          // 高度
                        }
                        else
                        {
                            radlIsMultiFile.SelectedValue = "0";
                        }
                        txtImagesWidth.Text = fieldDR["TextBoxWidth"].ToString();                       // 文本框宽度
                        rbtlIsUpload.SelectedValue = fieldDR["IsUpload"].ToString();                    // 是否启用上传
                        txtMaxSize.Text = fieldDR["MaxSize"].ToString();                                // 允许大小
                        txtImageType.Text = fieldDR["ImageType"].ToString();                            // 允许类型
                        IsSaveFileSize.Checked = Utils.ParseBool(fieldDR["IsSaveFileSize"].ToString()); // 是否在数据库中保存文件大小
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();             // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                      // 默认值
                        txtThumbWidth.Text = fieldDR["ThumbWidth"].ToString();
                        txtThumbHeight.Text = fieldDR["ThumbHeight"].ToString();
                        break;
                    case "12":  // 文件
                        if (Utils.ParseBool(fieldDR["IsMultiFile"].ToString()))                   // 启用多文件
                        {
                            radlIsMultiFile.SelectedValue = "1";
                            txtMultiFieldHeight.Text = fieldDR["TextBoxHieght"].ToString();          // 高度
                        }
                        else
                        {
                            radlIsMultiFile.SelectedValue = "0";
                        }
                        txtImagesWidth.Text = fieldDR["TextBoxWidth"].ToString();                       // 文本框宽度
                        rbtlIsUpload.SelectedValue = fieldDR["IsUpload"].ToString();                    // 是否启用上传
                        txtMaxSize.Text = fieldDR["MaxSize"].ToString();                                // 允许大小
                        txtImageType.Text = fieldDR["ImageType"].ToString();                            // 允许类型
                        IsSaveFileSize.Checked = Utils.ParseBool(fieldDR["IsSaveFileSize"].ToString()); // 是否在数据库中保存文件大小
                        txtDataCoulumnLength.Text = fieldDR["DataColumnLength"].ToString();             // 字段表长度
                        txtDefaultValue.Text = fieldDR["DefaultValue"].ToString();                      // 默认值
                        break;
                }
            }
        }
        #endregion

        #region 更新基本字段属性值
        /// <summary>
        /// 作者：吴岸标
        /// </summary>
        /// <param name="mModelField"></param>
        private void BasicFieldUpdate(ref KingTop.Model.Content.ModelField mModelField)
        {
            int basicFiledType;      // 基本字段类型

            basicFiledType = Utils.ParseInt(hdnBasicField.Value, -1);

            if (basicFiledType > 0 && basicFiledType < 13)
            {
                mModelField.BasicField = hdnBasicField.Value;
                mModelField.ModelId = StrModelId;

                switch (basicFiledType)
                {
                    case 1:  // 单文本属性加载
                        mModelField.TextBoxWidth = Utils.ParseInt(txtBoxWidth.Text, 0);              // 文本框长度
                        mModelField.TextBoxMaxLength = Utils.ParseInt(txtMaxLength.Text, 0);        // 最大字符数
                        mModelField.ValidationType = rbtlValidationType.SelectedValue;              // 验证规则
                        mModelField.ValidationMessage = txtValidationMessage.Text;                  // 提示错误
                        mModelField.TextBoxValidation = TextBoxValidation.Text;                     // 正则表达式
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0); // 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                           // 默认值
                        break;
                    case 2:   // 文本域
                        mModelField.TextBoxWidth = Utils.ParseInt(txtWidth.Text, 0);                 // 宽度
                        mModelField.TextBoxHieght = Utils.ParseInt(txtHieght.Text, 0);               // 高度
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);// 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                           // 默认值
                        break;
                    case 3:   // 多行文本（支持HTML）,编辑器类型
                        mModelField.TextBoxWidth = Utils.ParseInt(txtWidth.Text, 0);                // 宽度
                        mModelField.TextBoxHieght = Utils.ParseInt(txtHieght.Text, 0);               // 高度
                        mModelField.EditorType = ddlEditorType.SelectedValue;                       // 编辑器类型
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);// 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                            // 默认值
                        break;
                    case 4:   // 单选
                    case 5:   // 多选
                    case 6:   // 下拉列表
                    case 7:   // 列表（可选择多列） 
                        mModelField.DropDownDataType = rbtlDropDownDataType.SelectedValue          // 文本框输入方式
                            ;
                        if (string.Equals(mModelField.DropDownDataType, "1"))
                        {
                            mModelField.OptionsValue = txtOptionsValue.Text;
                        }
                        else if (string.Equals(mModelField.DropDownDataType, "2"))                   // 数据库读取方式
                        {
                            mModelField.DropDownTable = ddlDataBase.Items[ddlDataBase.SelectedIndex].Text;                   // 数据表列表
                            modelFiled.DropDownTextColumn = hidTextColumn.Value;  // Text列
                            modelFiled.DropDownValueColumn = hidValueColumn.Value;// Value列      
                            mModelField.DropDownSqlWhere = txtSqlWhere.Text;                         // sql查询条件
                            mModelField.DropDownSql = txtDropDownSql.Text;                           // sql语句
                        }

                        mModelField.OptionCount = Utils.ParseInt(txtOptionCount.Text, -1);            // 选项
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0); // 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                             // 默认值
                        break;
                    case 8:   // 数字
                    case 9:   // 货币
                        mModelField.NumberCount = Utils.ParseInt(NumberCount.SelectedValue, 0);       // 小数位数
                        mModelField.MinValue = txtMinValue.Text;                                      // 最小值
                        mModelField.MaxValue = txtMaxValue.Text;                                      // 最大值
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);  // 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                              // 默认值
                        mModelField.TextBoxWidth = Utils.ParseInt(txtDigitBoxWidth.Text,100);         // 文本框宽度
                        break;
                    case 10:  // 日期时间
                        mModelField.DateFormatOption = rbtlDateFormatOption.SelectedValue;            // 日期和时间格式
                        mModelField.DateDefaultOption = rbtlDateDefaultOption.SelectedValue;          // 默认值
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);  // 字段表长度
                        mModelField.TextBoxWidth = Utils.ParseInt(txtDataBoxWidth.Text,100);          // 文本框长度
                        break;
                    case 11:  // 图片
                        mModelField.IsMultiFile = Utils.ParseBool(radlIsMultiFile.SelectedValue);       // 是否多文件
                        if (mModelField.IsMultiFile)    // 多文件
                        {
                            mModelField.TextBoxHieght = Utils.ParseInt(txtMultiFieldHeight.Text, 0);
                        }
                        mModelField.TextBoxWidth = Utils.ParseInt(txtImagesWidth.Text, 0);              // 文本框宽度
                        mModelField.IsUpload = Utils.ParseBool(rbtlIsUpload.SelectedValue);             // 是否启用上传
                        mModelField.MaxSize = Utils.ParseInt(txtMaxSize.Text, 9999);                    // 允许大小
                        mModelField.ImageType = txtImageType.Text;                                      // 允许类型
                        mModelField.IsSaveFileSize = IsSaveFileSize.Checked;                            // 是否在数据库中保存文件大小
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);    // 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                                // 默认值
                        mModelField.ThumbWidth = Utils.ParseInt(txtThumbWidth.Text.Trim(), 0);        // 缩略图宽
                        mModelField.ThumbHeight = Utils.ParseInt(txtThumbHeight.Text.Trim(), 0);      // 缩咯图高
                        break;
                    case 12:  // 文件
                        mModelField.IsMultiFile = Utils.ParseBool(radlIsMultiFile.SelectedValue);       // 是否多文件
                        if (mModelField.IsMultiFile)    // 多文件
                        {
                            mModelField.TextBoxHieght = Utils.ParseInt(txtMultiFieldHeight.Text, 0);
                        }
                        mModelField.TextBoxWidth = Utils.ParseInt(txtImagesWidth.Text, 0);               // 文本框宽度
                        mModelField.IsUpload = Utils.ParseBool(rbtlIsUpload.SelectedValue);              // 是否启用上传
                        mModelField.MaxSize = Utils.ParseInt(txtMaxSize.Text, 9999);                     // 允许大小
                        mModelField.ImageType = txtImageType.Text;                                       // 允许类型
                        mModelField.IsSaveFileSize = IsSaveFileSize.Checked;                             // 是否在数据库中保存文件大小
                        mModelField.DataColumnLength = Utils.ParseInt(txtDataCoulumnLength.Text, 0);     // 字段表长度
                        mModelField.DefaultValue = txtDefaultValue.Text;                                 // 默认值
                        break;
                }
            }
        }
        #endregion
    }
}
