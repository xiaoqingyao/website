/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标// 创建日期：2010-06-20
// 功能描述：模型字段页面操作===========================================================================*/
var id;
function CreateModelConfirm(url, message) { selfconfirm({ msg: message, fn: function(data) { setBroserTitle(data, url) } }) }
function setBroserTitle(data, url) { if (data == "true") { location.href = url; } }

$(function() {
    if ($("#IsListPage").val() == "1") { // 列表页
        $(pageListInit);
    } else if ($("#IsListPage").val() == "0") { // 编辑页
        $(pageEditInit);
    } else { // 字段配置页
        if ($("#hdnBasicField").val() != "") {
            try {
                displayBasicField($("#hdnBasicField").val());
            } catch (e) { }
        }
    }
});

/************************************列表页 :Begin ********************************/
// 面初始加载
function pageListInit() {
    $("#FiledManageList").find("select").each(function() {
        $(this).find("option[value='" + $(this).attr("selectedvalue") + "']").each(function() {
            $(this).attr("selected", "selected");
        });
    });
}

// 修改字段所属分组
function setSelected(selObject) {
    var param, id;
    id = $(selObject).attr("fieldID");
    param = "{fieldID:'" + id + "',fieldGroupID:'" + $(selObject).val() + "'}";

    if ($("#HQB_FileGroup_" + id)[0] != null) {
        $("#HQB_FileGroup_" + id).find("div").each(function() { $(this).css("display", "block"); $(this).html("<img src=\"../image/loading.gif\"/>") });
        $("#HQB_FileGroup_" + id).find("span").each(function() { $(this).css("display", "none"); });
    }

    $.ajax(
    {
        type: "POST",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/EditFileModelGroupID",
        data: param,
        dataType: 'json',
        success: function(result) {
            if ($("#HQB_FileGroup_" + id)[0] != null) {
                fieldGroupReset("HQB_FileGroup_" + id);
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            if ($("#HQB_FileGroup_" + id)[0] != null) {
                $("#HQB_FileGroup_" + id).find("div").each(function() { $(this).html("<a href=\"javascript:fieldGroupReset('HQB_FileGroup_" + id + "')\">失败,点击重试</a>"); $(this).css("display", "block"); });
                $("#HQB_FileGroup_" + id).find("span").each(function() { $(this).css("display", "none"); });
            }
        }
    }
    );
}

// 更新字段分组失败后处理
function fieldGroupReset(id) {

    $("#" + id).find("div").each(function() { $(this).css("display", "none"); });
    $("#" + id).find("span").each(function() { $(this).css("display", "block"); });
}

// 修改搜索、列表、及编辑页的显示相关属性
function openConfig(type, fieldID) {
    var url;
    var configTitle;

    switch (type) {
        case "1":
            configTitle = "搜索相关属性配置";
            break;
        case "2":
            configTitle = "列表列相关属性配置";
            break;
        case "3":
            configTitle = "编辑页相关属性配置";
            break;
    }
    url = "FieldListConfig.aspx?FieldName=" + $("#Title" + fieldID).text() + "&ID=" + fieldID + "&ConfigType=" + type + "&" + $("#hdnUrlParm").val();
    openframe({ url: url, width: '600', height: '300', title: configTitle });
}

// 排序显示,pastUrlParam需传递的URL参数
function sort(fieldName) {
    var sortStr, frontSort, ascSort, descSort, urlParam;

    ascSort = fieldName + " asc ";
    descSort = fieldName + " desc ";
    frontSort = getCookie("_FieldManageListSort_");

    if (frontSort == null || frontSort == "") {
        sortStr = ascSort;
        setCookies("_FieldManageListSort_", "1");
    }
    else if (frontSort == "1") {
        sortStr = descSort;
        setCookies("_FieldManageListSort_", "0");
    }
    else {
        sortStr = ascSort;
        setCookies("_FieldManageListSort_", "1");
    }

    sortStr = "?Sort=" + sortStr + "&" + $("#hdnUrlParm").val();
    location.href = sortStr;
}
/************************************列表页 :End ********************************/


/************************************编辑页 :Begin ********************************/
// 面初始加载
function pageEditInit() {
    getModelName($("#hdnModelID").val());
    controlEventRegisting();
    if ($("#hdnBasicField").val() != "") {
        basicFieldEnable($("#hdnBasicField").val());
        displayBasicField($("#hdnBasicField").val());
    } else {
        if ($("#hdnAction").val() == "add") { // 添加
            displayBasicField("1");
        } else { // 系统字段
            for (var k = 1; k < 15; k++) {  // 隐藏所有基本字段类型对应的属性控件
                $("#BasicField_" + k.toString()).css("display", "none");
            }
        }
    }
}

// 编辑时可操作的编辑类型
function basicFieldEnable(basicType) {
    switch (basicType) {
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "13":
            $("#radlBasicField").find("input[type='radio']").each(
           function() {
               if ($(this).val() == "8" || $(this).val() == "9" || $(this).val() == "10" || $(this).val() == "11" || $(this).val() == "12") {
                   $(this).attr("disabled", "disabled");
               }
           }
        );
            break;
        case "8":
        case "9":
            $("#radlBasicField").find("input[type='radio']").each(function() {
                if ($(this).val() != "8" && $(this).val() != "9") {
                    $(this).attr("disabled", "disabled");
                }
            });
            break;
        case "10":
            $("#radlBasicField").find("input[type='radio']").each(function() {
                if ($(this).val() != "10") {
                    $(this).attr("disabled", "disabled");
                }
            });
            break;
        case "11":
        case "12":
            $("#radlBasicField").find("input[type='radio']").each(function() {
                if ($(this).val() != "11" && $(this).val() != "12") {
                    $(this).attr("disabled", "disabled");
                }
            });
            break;
        case "14":
            $("#radlBasicField").find("input[type='radio']").each(function() {
                $(this).attr("disabled", "disabled");
            });
            break;
    }

}

// 为控件注册事件
function controlEventRegisting() {
    $("#radlBasicField").find("input[type='radio']").each(function() { $(this).click(function() { displayBasicField($(this).val()); }); });         // 基本字段类型单选按钮
    $("#radlValidationType").find("input[type='radio']").each(function() { $(this).click(function() { validationRuleChange($(this)); }); });        // 验证规则单选按钮
    $("#ddlRelatedType").change(function() {
        switch ($(this).val()) {
            case "1":
                $("#BasicField_14_Single").css("display", "block");
                $("#BasicField_14_Group").css("display", "none");

                break;
            case "2":
                $("#BasicField_14_Single").css("display", "none");
                $("#BasicField_14_Group").css("display", "block");
                break;
        }
    });
}

// 验证规则更改
function validationRuleChange(radioObj) {
    if ($(radioObj).val() == "-1") {      // 无
        $("#BasicField_Validation").css("display", "none");
    } else if ($(radioObj).val() == "0") { // 自定义
        $("#BasicField_Validation").css("display", "block");
    } else {
        $("#BasicField_Validation").css("display", "block");
        $("#txtValidationMessage").val($(radioObj).parent().attr("message"));
        $("#txtTextBoxValidation").val($(radioObj).parent().attr("expression"));
    }
}

function getModelName(id) {
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/GetModelName",
        dataType: "json",
        data: "{modelID:'" + id + "'}",
        success: function(msg) {
            $("#ModelName").html(msg.d);
        }
    });
}

// 编辑器类型改变时执行
function onEditorChange() {
    var selectedValue;
    selectedValue = $("#ddlEditorType").val();

    switch (selectedValue) {
        case "1":
            $("#Editor_eWebEditor").css("display", "none");
            $("#Editor_CKEditor").css("display", "block");
            break;
        case "2":
            $("#Editor_CKEditor").css("display", "none");
            $("#Editor_eWebEditor").css("display", "block");
            break;
    }
}

// 下拉列表数据来源方式
function onDropDownDataTypeChange(type) {
    if (type == 1) {    // 文本框输入
        $("#DropDownDataType2").css("display", "none");
        $("#DropDownDataType1").css("display", "block");
    } else {    // 数据库读取 
        $("#DropDownDataType1").css("display", "none");
        $("#DropDownDataType2").css("display", "block");
    }
    selectColumnSql();
}

//  列表数据来源于表时，绑定列与选取的表名同步
function selectColumn(tableID) {
    var selectOptions = "";

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/GetTableFieldByID",
        dataType: "json",
        data: "{tableID:'" + tableID + "'}",
        success: function(msg) {
            var sourceHtml = "";
            if (msg.d != null) {
                $(msg.d).each(function() {
                    if (this != null && this.toString() != undefined) {
                        selectOptions += "<option value='" + this.toString() + "'>" + this.toString() + "</option>";
                    }
                }
            );
            }

            $("#ddlDropDownTextColumn").html(selectOptions);
            $("#ddlDropDownValueColumn").html(selectOptions);
            selectColumnSql();
        }
    });
}

// 选择下拉列后自动生成sql语句
function selectColumnSql() {
    var strWhere = $("#txtDropDownSqlWhere").val();
    strWhere = strWhere != "" ? " where " + strWhere : "";  //如果有条件 则自动加上where 关键字
    var textColumn = $("#ddlDropDownTextColumn").val();
    var valueColumn = $("#ddlDropDownValueColumn").val();
    $("#txtDropDownSql").val("select " + textColumn + "," + valueColumn + " from " + $("#ddlDropDownTable option:selected").text() + strWhere);
    $("#hidValueColumn").val(valueColumn);
    $("#hidTextColumn").val(textColumn);
}

// 显示与隐藏容器控件,container 容器控件ID true 或 1 显示 false 或 0 隐藏
function displayContainer(container, selValue) {
    if (selValue == true || selValue == "1") {
        $("#" + container).css("display", "block");
    }
    else {
        $("#" + container).css("display", "none");
    }

}

// 显示特定基本字段类型对应的属性控件
function displayBasicField(basicType) {
    var relatedType;

    for (var k = 1; k < 15; k++) {  // 隐藏所有基本字段类型对应的属性控件
        $("#BasicField_" + k.toString()).css("display", "none");
    }

    $("#BasicField_TextBoxHeight").css("display", "none");       // 隐藏文本框高
    $("#BasicField_TextBoxWidth").css("display", "none");        // 隐藏文本框宽
    $("#BasicField_DefaultValue").css("display", "none");        // 隐藏缺省值
    $("#BasicField_ColumnLength").css("display", "none");        // 隐藏字段表长度

    switch (basicType) {
        case "1":   // 单行文件
            $("#BasicField_1").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            break;
        case "2":   // 多行文本（不支持HTML）
            $("#BasicField_TextBoxHeight").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            break;
        case "3":   // 多行文本（支持HTML）
            $("#BasicField_3").css("display", "block");
            $("#BasicField_TextBoxHeight").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            break;
        case "4":   // 单选
        case "5":   // 多选
            $("#BasicField_4").css("display", "block");
            $("#BasicField_5").css("display", "block");     // 每行显示项数
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            $("#radlDropDownDataType").find("input[type='radio']").each(function() {
                if ($(this).attr("checked")) { onDropDownDataTypeChange($(this).val()); }
            });
            break;
        case "6":   // 下拉列表
        case "7":   // 列表（可选择多列）
            $("#BasicField_4").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            $("#radlDropDownDataType").find("input[type='radio']").each(function() {
                if ($(this).attr("checked")) { onDropDownDataTypeChange($(this).val()); }
            });
            break;
        case "8":   // 数字
            $("#BasicField_NumberCount").css("display", "block");
            $("#BasicField_8").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            break;
        case "9":   // 货币
            $("#BasicField_NumberCount").css("display", "none");
            $("#BasicField_8").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_DefaultValue").css("display", "block");
            break;
        case "10":  // 日期时间
            $("#BasicField_10").css("display", "block");
            $("#BasicField_TextBoxWidth").css("display", "block");
            break;
        case "11":  // 图片
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_ImagesThumb").css("display", "block");             // 缩略图尺寸
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            $("#BasicField_11").css("display", "block");
            break;
        case "12":  // 文件
            $("#BasicField_TextBoxWidth").css("display", "block");
            $("#BasicField_ImagesThumb").css("display", "none");             // 缩略图尺寸
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            $("#BasicField_11").css("display", "block");
            break;
        case "13":  // 隐藏域
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            break;
        case "14":  // 子模型
            relatedType = $("#ddlRelatedType").val();
            $("#BasicField_DefaultValue").css("display", "block");
            $("#BasicField_ColumnLength").css("display", "block");
            $("#BasicField_14").css("display", "block");
            
            if ($("#hdnAction").val() != "add") { // 添加
                $("#BtnAddSubModelGroupName").css("display", "none");
            }
            
            switch (relatedType) {
                case "1":
                    $("#BasicField_14_Single").css("display", "block");
                    $("#BasicField_14_Group").css("display", "none");

                    break;
                case "2":
                    $("#BasicField_14_Single").css("display", "none");
                    $("#BasicField_14_Group").css("display", "block");
                    break;
            }
            break;
    }
}

function isMultiFieldClick(isTure) {
    if (isTure) {
        displayContainer('BasicField_TextBoxHeight', true);
        displayContainer('BasicField_IsAlbums', true);

    } else {
        displayContainer('BasicField_TextBoxHeight', false);
        displayContainer('BasicField_IsAlbums', false);
    }
}

function isAlbumsClick(isTure) {
    displayContainer('BasicField_TextBoxHeight', isTure)
    displayContainer('BasicField_TextBoxWidth', isTure)

}

// 字段名是否重复
function CheckNameRepeat(tableName, fieldName, msgContainer) {
    var jsonParam;

    jsonParam = "{tableName:'" + tableName + "',fieldName:'" + fieldName + "',fieldValue:'" + $("#txt" + fieldName).val() + "'}";
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/CheckTitleRepeat",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d) {
                $("#" + msgContainer).html("对不起，已经存在此字段或是当前字段名与数据库中关键字相同。");
            }
            else {
                $("#" + msgContainer).html("恭喜您，此字段名可用！");
            }
        }
    });
}
// 添加子模型分组
function AddSubModelGroup() {
    var jsonParam;
    var obj;
    var groupName;

    groupName = $("#SubModelGroupName").val();
    jsonParam = "{groupName:'" + groupName + "'}";

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "/sysadmin/Model/ModelAjaxDeal.asmx/AddSubModelGroup",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d != "") {
                obj = window.document.getElementById("ddlSubModelGroup");
                obj.options[obj.options.length] = new Option(groupName, msg.d);

                if (obj.options.length > 1) {
                    for (var i = obj.options.length - 1; i > 0; i--) {
                        obj.options[i].text = obj.options[i - 1].text;
                        obj.options[i].value = obj.options[i - 1].value;
                    }

                    obj.options[0].text = groupName;
                    obj.options[0].value = msg.d;
                }

                $("#AddSubModelGroupNamePrompt").html("");
            }
            else {
                $("#AddSubModelGroupNamePrompt").html("对不起，添加失败！");
            }
        }
    });
}

/************************************编辑页 :End ********************************/
// 关闭对话框
function ClosedWithMsg(msgContent) {
    $("body").find("#norDialog").remove().end();
    $("#norDialogBackground").remove();
    alertClose({ title: "操作提示", msg: msgContent, width: 450 }, function() { location.href = location.href; });
}
