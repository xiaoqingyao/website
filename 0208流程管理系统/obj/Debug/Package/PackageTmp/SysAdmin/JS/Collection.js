/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />
/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标// 创建日期：2010-07-13
// 功能描述：信息采集--采集任务操作
===========================================================================*/

/***************************** 采集任务 Begin **************************/
// 初始加载
function pageInitTaskEdit() {
    isLoginCollection();    // 是否登录采集
    if ($("#SetTableNameList").val() == "1") {
        SetTableNameList();
    }

    displayContainer($("#chkIsEnabledThread").attr("checked"), "ResourceWaitInterval");
    $("#chkIsEnabledThread").click(function() { displayContainer($(this).attr("checked"), "ResourceWaitInterval") });
}

// 设置表列样式
function SetTableNameList() {
    $("#txtTableNameList").css("border", "1px solid #ff0000");
    $("#TableNameListHeader").css("color", "#ff0000");
}

// 检测英文名称是否重复
function checkEnNameRepeat(msgContainer) {
    var jsonParam;

    jsonParam = "{tableName:'K_CollectionTask',fieldName:'EnName',fieldValue:'" + $("#txtEnName").val() + "'}";
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "../Model/ModelAjaxDeal.asmx/CheckTitleRepeat",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d) {
                $("#" + msgContainer).html("对不起，已经存在此英文名称。");
            }
            else {
                $("#" + msgContainer).html("恭喜您，此英文名称可用！");
            }
        }
    });
}

// 是否登录采集
function isLoginCollection() {
    if ($("#chkIsLogin").attr("checked")) {
        $("#LoginCollection").css("display", "block");
    } else {
        $("#LoginCollection").css("display", "none");
    }
}
/******************************* 采集任务 End **************************

/***************************** 采集地址 Begin **************************/
// 采集地址初始加载
function pageInitAddress() {
    $("#btnSave").click(function() {
        var itemCount;

        itemCount = document.getElementById("lstbCollectionAddress").options.length;
        for (var i = itemCount; i >= 0; i--) {
            $(document.getElementById("lstbCollectionAddress").options[i]).attr("selected", true);
        }
    });
}

// 清除
function AddressRemoveAll(multiSelectID) {
    var itemCount;

    itemCount = document.getElementById(multiSelectID).options.length;
    for (var i = itemCount; i >= 0; i--) {
        document.getElementById(multiSelectID).options[i] = null;
    }
}
// 多选择下拉列表中删除选中项
function AddressItemDel(multiSelectID) {
    var obj = document.getElementById(multiSelectID);
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert({ title: "操作提示", msg: "请先选择操作选项。" });
        return false;
    }
    for (var i = 0; i < document.getElementById(multiSelectID).options.length; i++) {
        if (document.getElementById(multiSelectID).options[i].selected == true) {
            document.getElementById(multiSelectID).options[i] = null;
        }
    }
}

// 多选择下拉列表中添加外部地址选项
function AddressItemAdd(multiSelectID) {
    prompt({ msg: "请输入值：", title: "添加文件", fn: function(data) { AddItemToAddress(data, multiSelectID, true) } });
}

// 多选择下拉列表中修改选中项
function AddressItemModify(multiSelectID) {
    var obj = document.getElementById(multiSelectID);
    if (obj == null) return false;
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert({ title: "操作提示", msg: "请选择要操作的选项。" });
        return false;
    }
    prompt({ msg: '请输入值：', title: '修改地址', value: thisurl, fn: function(data) { AddItemToAddress(data, multiSelectID, false) } });
}

// 向多选列表中添加选项
function AddItemToAddress(data, multiSelectID, isAdd) {
    if (data != '' && data != "null") {
        var obj = document.getElementById(multiSelectID);
        if (isAdd) {
            obj.options[obj.options.length] = new Option(data, data);
        }
        else {
            obj.options[obj.selectedIndex] = new Option(data, data);
        }
    }
}

// 多选择下拉列表中将选中项往上移
function UpOrder(multiSelectID) {
    var sel = document.getElementById(multiSelectID);
    if (sel.selectedIndex >= 0) {
        var tempValue = sel.options[sel.selectedIndex].value;
        var tempText = sel.options[sel.selectedIndex].text;
    } else {
        alert({ title: "操作提示", msg: "请至少选择一个选项！" });
        return;
    }

    if (sel.selectedIndex > 0) {
        sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex - 1].text;
        sel.options[sel.selectedIndex - 1].text = tempText;
        sel.options[sel.selectedIndex].value = sel.options[sel.selectedIndex - 1].value;
        sel.options[sel.selectedIndex - 1].value = tempValue;
        sel.selectedIndex = sel.selectedIndex - 1;
    }
    if (sel.onchange) {
        sel.onchange();
    }
}

// 多选择下拉列表中将选中项往下移
function DownOrder(multiSelectID) {
    var sel = document.getElementById(multiSelectID);
    if (sel.selectedIndex >= 0) {
        var tempValue = sel.options[sel.selectedIndex].value;
        var tempText = sel.options[sel.selectedIndex].text;
    } else {
        alert({ title: "操作提示", msg: "请至少选择一个选项！" });
        return;
    }
    if (sel.selectedIndex < sel.options.length - 1) {
        sel.options[sel.selectedIndex].text = sel.options[sel.selectedIndex + 1].text;
        sel.options[sel.selectedIndex + 1].text = tempText;
        sel.options[sel.selectedIndex].value = sel.options[sel.selectedIndex + 1].value;
        sel.options[sel.selectedIndex + 1].value = tempValue;
        sel.selectedIndex = sel.selectedIndex + 1;
    }
    if (sel.onchange) {
        sel.onchange();
    }
}


// 显示地址生成界面
function CreateAddress(isBatch) {
    if (isBatch) {  // 批量生成
        $("#CreateSpecialAdress").hide();
        $("#CreateBatchAdress").show();
    } else {    // 特殊生成
        $("#CreateBatchAdress").hide();
        $("#CreateSpecialAdress").show();
    }
}

// 批量生成地址
function BatchCreateAddress(multiSelectID) {
    var beginValue, endValue, intervalValue;
    var maxZeroCount;
    var addressTemplate;

    try {
        addressTemplate = $("#AddressTemplate").val();
        beginValue = parseInt($("#BatchAddressStartNumber").val(), 10);
        endValue = parseInt($("#BatchAddressEndNumber").val(), 10);
        intervalValue = parseInt($("#BatchAddressInterval").val(), 10);

        if ($("#BatchAddressAddZero").attr("checked")) {    // 补零
            var strZero = "";
            maxZeroCount = $("#BatchAddressEndNumber").val().length;
            for (var i = 0; i <= $("#BatchAddressEndNumber").val().length - $("#BatchAddressStartNumber").val().length; i++) {
                strZero += "0";
            }

            for (var i = beginValue; i <= endValue; i = i + intervalValue) {
                AddItemToAddress(addressTemplate.replace(/\{\*\}/g, strZero.substr(0, maxZeroCount - i.toString().length) + i.toString()), multiSelectID, true);
            }
        } else {
            for (var i = beginValue; i <= endValue; i = i + intervalValue) {
                AddItemToAddress(addressTemplate.replace(/\{\*\}/g, i.toString()), multiSelectID, true);
            }
        }
    }
    catch (e) {
        return;
    }
}

// 生成特殊地址
function createSpecialAddress(labelVarValue) {
    var labelVarName;       // 当前选中的标签变量名称
    var arrLabelVarValue;   // 标签变量值
    var currentAddress;     // 临时变量，生成的当前地址

    labelVarName = document.getElementById("ddlLabelVar").options[document.getElementById("ddlLabelVar").selectedIndex].text;

    if ($("#SpecialAddressTemplate").val().indexOf(labelVarName) > 0) {  // 地址中引用了当前标签变量
        $("#SpecialAddress").val("");
        arrLabelVarValue = labelVarValue.split("<br/>");

        for (var i = 0; i < arrLabelVarValue.length; i++) {
            if (arrLabelVarValue[i] != "") {
                currentAddress = $("#SpecialAddressTemplate").val().replace(labelVarName, arrLabelVarValue[i]);
                currentAddress = currentAddress;

                if ($("#SpecialAddress").val() != "") {
                    currentAddress = "\r\n" + currentAddress;
                }

                $("#SpecialAddress").val($("#SpecialAddress").val() + currentAddress);
            }
        }
    }
}

// 将生成的地址添加至地址列表中
function addSpecialAddress(multiSelectID) {
    var arrSpecialAddress;

    arrSpecialAddress = $("#SpecialAddress").val().split("\n");
    for (var i = 0; i < arrSpecialAddress.length; i++) {
        if (arrSpecialAddress[i] != "") {
            AddItemToAddress(arrSpecialAddress[i], multiSelectID, true);
        }
    }
}

// 变量标签与值联动
function loadLabelVarValue(labelVarID) {
    var jsonParam;

    jsonParam = "{labelVarID:'" + labelVarID + "'}";
    $("#ddLabelVarValueList").html("数据加载中...");

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "../Model/ModelAjaxDeal.asmx/GetLabelVarValue",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            $("#ddLabelVarValueList").html(msg.d);
            createSpecialAddress(msg.d);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $("#ddLabelVarValueList").html("对不起，数据加载失败，请重试。");
        }
    });
}
/***************************** 采集地址 End **************************/

/***************************** 标签变量 Begin ************************/
// 确定输入按钮事件
function PaserLabelVarValue(lbValue, multiSelectID) {
    if ($("#btnEnsureInput").attr("optype") == "input") {  // 确定输入
        var arrValue;

        arrValue = lbValue.split("$$$");
        for (var i = 0; i < arrValue.length; i++) {
            AddItemToAddress(arrValue[i], multiSelectID, true)
        }
    } else {  // 确定修改
        AddItemToAddress(lbValue, multiSelectID, false)
        $("#btnEnsureInput").val("确定输入");
        $("#btnEnsureInput").attr("optype", "input");
    }
    $("#InputValue").val("");
}

// 修改变量值
function VarValueItemModify(multiSelectID) {
    var obj = document.getElementById(multiSelectID);
    if (obj == null) return false;
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert({ title: "操作提示", msg: "请选择要操作的选项。" });
        return false;
    }

    $("#InputValue").val(thisurl);
    $("#btnEnsureInput").val("确定修改");
    $("#btnEnsureInput").attr("optype", "edit");
}

function setLabelVarValue(multiSelectID) {
    for (var i = 0; i < document.getElementById(multiSelectID).options.length; i++) {
        if ($("#hdnLabelVarValue").val() == "") {
            $("#hdnLabelVarValue").val(document.getElementById(multiSelectID).options[i].value);
        } else {
            $("#hdnLabelVarValue").val($("#hdnLabelVarValue").val() + "$$$" + document.getElementById(multiSelectID).options[i].value);
        }
    }
}
/***************************** 标签变量 End   ************************/

/***************************** 采集规则 Begin **************************/
// 采集规则初始化加载
function PageInitRuleEdit() {
    RuleEditContainerInit();
    RuleEditRegEvent();
    RuleTypeOnChange();
    SA_ParseTypeOnChange();
    CA_ParseTypeOnChange();
    displayContainer($("#chkIsPostUrl").attr("checked"), "txtSA_PostUrl");
    displayContainer($("#chkCAIsPostUrl").attr("checked"), "txtCA_PostUrl");
    displayContainer($("#chkSA_IsJoinContent").attr("checked"), "ContentType1");
}

// 采集规则页加载时注册事件
function RuleEditRegEvent() {
    $("#ddlRuleType").change(function() { RuleTypeOnChange(); });
    $("#chkIsSA").click(function() { displayContainer($(this).attr("checked"), "SAContainer"); });
    $("#chkIsCA").click(function() { displayContainer($(this).attr("checked"), "CAContainer"); });
    $("#chkIsPostUrl").click(function() { displayContainer($(this).attr("checked"), "txtSA_PostUrl"); });
    $("#chkCAIsPostUrl").click(function() { displayContainer($(this).attr("checked"), "txtCA_PostUrl"); });
    $("#ddlSA_ParseType").change(function() { SA_ParseTypeOnChange(); });
    $("#ddlSA_GetRange").change(function() { SA_GetRangeOnChange(); });
    $("#ddlCA_ParseType").change(function() { CA_ParseTypeOnChange(); });
    $("#chkSA_IsJoinContent").click(function() { displayContainer($(this).attr("checked"), "ContentType1"); });
}

// 分页链接类型变化时执行
function SA_ParseTypeOnChange() {
    switch ($("#ddlSA_ParseType").val()) {
        case "1":   // 自动识别
            SA_GetRangeOnChange();
            $("#SA_Param").css("display", "none");
            $("#SA_OtherParam").css("display", "none");
            $("#chkIsPostUrl").attr("disabled", "disabled");
            $("#txtSA_PostUrl").css("display", "none");
            break;
        case "2":   // Get自定义链接
            $("#SA_Param").css("display", "block");
            $("#SA_OtherParam").css("display", "block");
            $("#chkIsPostUrl").attr("disabled", "disabled");
            $("#txtSA_PostUrl").css("display", "none");
            SA_GetRangeOnChange();
            break;
        case "3":   // Post自定义链接
            $("#SA_Param").css("display", "block");
            $("#SA_OtherParam").css("display", "block");
            $("#chkIsPostUrl").removeAttr("disabled");
            displayContainer($("#chkIsPostUrl").attr("checked"), "txtSA_PostUrl");
            SA_GetRangeOnChange();
            break;
    }

}

// 下层地址链接类型变化时执行
function CA_ParseTypeOnChange() {
    switch ($("#ddlCA_ParseType").val()) {
        case "1":   // 自动识别
            $("#CA_Param").css("display", "none");
            $("#SA_OtherParam").css("display", "none");
            $("#chkIsPostUrl").attr("disabled", "disabled");
            $("#txtSA_PostUrl").css("display", "none");
            break;
        case "2":   // Get自定义链接
            $("#CA_Param").css("display", "block");
            $("#chkCAIsPostUrl").attr("disabled", "disabled");
            $("#txtCA_PostUrl").css("display", "none");
            break;
        case "3":   // Post自定义链接
            $("#CA_Param").css("display", "block");
            $("#chkCAIsPostUrl").removeAttr("disabled");
            displayContainer($("#chkCAIsPostUrl").attr("checked"), "txtCA_PostUrl");
            break;
    }

}

// 分页链接范围变量时执行
function SA_GetRangeOnChange() {
    switch ($("#ddlSA_GetRange").val()) {
        case "1":       // 所有分页
        case "2":       // 第一页
            $("#SA_Param").css("display", "block");
            $("#SA_OtherParam").css("display", "none");
            break;
        case "3":       // 第一页和下N页
            $("#SA_Param").css("display", "block");
            $("#SA_OtherParam").css("display", "block");
            $("#SA_OtherParam").find("li").each(function() { if ($(this).text().indexOf("函数") > -1) { $(this).html($(this).html().replace("函数", "下N页")); } });
            break;
        case "4":       //  第一页函数型
            $("#SA_Param").css("display", "block");
            $("#SA_OtherParam").css("display", "block");
            $("#SA_OtherParam").find("li").each(function() { if ($(this).text().indexOf("下N页") > -1) { $(this).html($(this).html().replace("下N页", "函数")); } });
            break;
    }
}


// 规则类型变化时执行
function RuleTypeOnChange() {
    switch ($("#ddlRuleType").val()) {
        case "1":   // 导航
            $("#chkIsCA").removeAttr("disabled");
            $("#chkIsSA").removeAttr("disabled");
            for (var i = 0; i < 2; i++) {
                $("#ContentType" + i.toString()).css("display", "none");
            }
            break;
        case "2":   // 内容
            $("#chkIsCA").attr("disabled", "disabled");
            $("#chkIsSA").removeAttr("disabled");
            $("#chkIsCA").removeAttr("checked");

            for (var i = 0; i < 2; i++) {
                $("#ContentType" + i.toString()).css("display", "block");
            }

            displayContainer($("#chkSA_IsJoinContent").attr("checked"), "ContentType1");
            break;
        case "3":   // 导航和内容
            for (var i = 0; i < 2; i++) {
                $("#ContentType" + i.toString()).css("display", "block");
            }
            $("#chkIsCA").removeAttr("disabled");
            $("#chkIsSA").removeAttr("disabled");
            break;
    }

    RuleEditContainerInit();
}

// 采集规则容器显示初始化
function RuleEditContainerInit() {
    if ($("#chkIsSA").attr("checked")) {
        $("#SAContainer").css("display", "block");
    } else {
        $("#SAContainer").css("display", "none");
    }

    if ($("#chkIsCA").attr("checked")) {
        $("#CAContainer").css("display", "block");
    } else {
        $("#CAContainer").css("display", "none");
    }
}

// 是否显示容器
function displayContainer(isShow, container) {
    if (isShow) {
        $("#" + container).css("display", "block");
    } else {
        $("#" + container).css("display", "none");
    }
}

var HQB_Cursor_Start, HQB_Cursor_End;
var HQB_TextAreaID;

// 显示信息采集中的系统标签
function showSysLabelVar(clickedObject, txtAreaID) {
    var position;

    HQB_TextAreaID = txtAreaID;
    setCaret();
    position = $(clickedObject).position();
    $("#HQB_Collection_SysLabel").css("top", position.top);
    $("#HQB_Collection_SysLabel").css("left", position.left);
    $("#HQB_Collection_SysLabel").css("display", "block");
}

// 保存光标位置
function setCaret() {
    HQB_Cursor_Start = 0;
    HQB_Cursor_End = 0;

    var obj = $("#" + HQB_TextAreaID)[0];

    if (document.selection) {
        obj.focus();
        var sel = document.selection.createRange();
        document.selection.empty();
        sel.text = "{$$$$}";
    } else {
        HQB_Cursor_Start = obj.selectionStart;
        HQB_Cursor_End = obj.selectionEnd;
    }
}

// 往文本域的光标处插入文字内容
function insertTextAtCursor(textFeildValue) {
    var txtContent;

    txtContent = $("#" + HQB_TextAreaID).val();

    if (document.selection) {
        txtContent = txtContent.replace("{$$$$}", textFeildValue);
    } else {
        var tempStr1 = txtContent.substring(0, HQB_Cursor_Start);
        var tempStr2 = txtContent.substring(HQB_Cursor_End);
        txtContent = tempStr1 + textFeildValue + tempStr2;

    }

    $("#" + HQB_TextAreaID).val(txtContent);
    $("#" + HQB_TextAreaID)[0].focus();
    $("#HQB_Collection_SysLabel").css("display", "none");
}

// 关闭信息采集中的系统标签
function closeSysLabelVar() {
    $("#HQB_Collection_SysLabel").css("display", "none");
    $("#" + HQB_TextAreaID).val($("#" + HQB_TextAreaID).val().replace("{$$$$}", ""));
}
/***************************** 采集规则 End **************************/

/***************************** 采集字段 Begin ************************/
// 初始加载
function pageInitFieldEdit() {
    fieldEditControlRegEvent();
    specialSet();               // 特殊结果设置
    fileDownLoadSet();          // 文件下载选项
    displayContainer($("#chkIsDownImg").attr("checked"), "ImagePattern");
    displayContainer($("#chkIsSpecialDeal").attr("checked"), "SpecialSet");
    labelInit();
}

// 标签设置初始加载
function labelInit() {
    var isTrue;

    if ($("#RemaindAllTag").attr("checked")) {
        labelSelect(true, "disabled");
        isTrue = true;
    }
    if ($("#ClearAllTag").attr("checked")) {
        labelSelect(true, "disabled");
        isTrue = true;
    }

    if (!isTrue) {
        if (!$("#RemaindPartTag").attr("checked") && !$("#ClearPartTag").attr("checked")) {
            labelSelect(true, "disabled");
        }
    }
}

// 注册事件
function fieldEditControlRegEvent() {
    $("#chkIsSpecialDeal").click(function() { displayContainer($("#chkIsSpecialDeal").attr("checked"), "SpecialSet"); });
    $("#radlSpecialType").find("input[type='radio']").each(function() { $(this).click(function() { specialSet(); }); });
    $("#chkIsDownImg").click(function() { fileDownLoadSet(); });
    $("#chkIsDownFlash").click(function() { fileDownLoadSet(); });
    $("#chkIsDownOther").click(function() { fileDownLoadSet(); });
    $("#AddALLLabel").click(function() { labelSelect(true, "checked"); });     // HTML标签处理 全部添加
    $("#DelAllLabel").click(function() { labelSelect(false, "checked"); });    // HTML标签处理 全部取消
    $("#RemaindAllTag").click(function() { labelSelect(true, "disabled"); });
    $("#RemaindPartTag").click(function() { labelSelect(false, "disabled"); });
    $("#ClearPartTag").click(function() { labelSelect(false, "disabled"); });
    $("#ClearAllTag").click(function() { labelSelect(true, "disabled"); });
    $("#chkIsDownImg").click(function() { displayContainer($(this).attr("checked"), "ImagePattern"); });
}

//  文件下载选项设置
function fileDownLoadSet() {
    var isTrue = false;

    if ($("#chkIsDownImg").attr("checked")) {   // 下载图片
        isTrue = true;
        $("#OtherFileType").css("display", "none");
    }

    if ($("#chkIsDownFlash").attr("checked")) { // FLASH下载
        isTrue = true;
        $("#OtherFileType").css("display", "none");
    }

    if ($("#chkIsDownOther").attr("checked")) { // 其它文件下载
        isTrue = true;
        $("#OtherFileType").css("display", "block");
    }

    if (isTrue) {
        $("#FileDownLoadParam").css("display", "block");
    } else {
        $("#FileDownLoadParam").css("display", "none");
        $("#OtherFileType").css("display", "none");
    }
}

// HTML标签处理 全部选中/取消或启用/禁用
function labelSelect(isTrue, attrName) {
    if (isTrue) {
        $("#chklTags").find("input[type='checkbox']").each(function() {
            $(this).attr(attrName, attrName);
        });
    } else {
        $("#chklTags").find("input[type='checkbox']").each(function() {
            $(this).removeAttr(attrName);
        });
    }
}



// 特殊结果设置
function specialSet() {
    $("#Special_FixCharContent").css("display", "none");
    $("#Special_RuleList").css("display", "none");

    $("#radlSpecialType").find("input[type='radio']").each(function() {
        if ($(this).attr("checked")) {
            if ($(this).parent().attr("tag") == "1") {
                $("#Special_FixCharContent").css("display", "block");
            } else if ($(this).parent().attr("tag") == "2") {
                $("#Special_RuleList").css("display", "block");
            }
        }
    });
}
/***************************** 采集字段 End **************************/

/***************************** HttpHeader Begin ************************/
function pageInitHttpHeaderEdit() {
    $("#ProtectedHeader").change(function() { $("#txtRequestHeader").val($(this).val()); });
    if ($("#txtRequestHeader").val() == "") {
        $("#txtRequestHeader").val($("#ProtectedHeader").val());
    }
}
/***************************** HttpHeader End **************************/

/***************************** PublishTask Begin **************************/
function pageInitPublishTask() {
    $("#ddlPublishType").change(function() { if ($(this).val() == "1") { $("#OtherType").css("display", "none"); $("#LocalHost").css("display", "block"); } else { $("#OtherType").css("display", "block"); $("#LocalHost").css("display", "none"); } });
    if ($("#ddlPublishType").val() == "1") {
        $("#OtherType").css("display", "none");
        $("#LocalHost").css("display", "block");
    } else {
        $("#OtherType").css("display", "block");
        $("#LocalHost").css("display", "none");
    }

    if ($("#OpType").val() == "Add") {
        $("#DMCode").css("display", "none");
    }
}

// 字段映射编辑时设置字段缺省值对话框
function showSiteMenu(fieldName) {
    var openUrl;

    if (fieldName.toLowerCase() == "nodecode") {
        openUrl = "../Model/ShowSiteNode.aspx?action=current";
        openframe({ title: "更换节点", url: openUrl, width: '600', height: '250' })
    }

    if (fieldName.toLowerCase() == "siteid") {
        $("#DefaultSiteID").val($("#hdnSiteID").val());
    }

    if (fieldName.toLowerCase() == "addman") {
        $("#DefaultAddMan").val($("#hdnUser").val());
    }
    
    if (fieldName.toLowerCase() == "id") {
        $("#DefaultID").val("dbo.CreateTableID()");
    }

    if (fieldName.toLowerCase() == "flowstate") {
        $("#DefaultFlowState").val("99");
    }
}

//  编辑字段映射
function openFieldMapping(sourceTableName) {
    var urlAddress, targetTableName;

    targetTableName = $("#target_" + sourceTableName).val();

    if (targetTableName != "") {  // 忽略
        urlAddress = "FieldMapping.aspx?SourceTableName=" + sourceTableName + "&TargetTableName=" + targetTableName + "&PublishTaskID=" + $("#PublishTaskID").val() + "&CollectionTaskID=" + $("#CollectionTaskID").val();
        openframe({ title: "字段映射", url: urlAddress, width: '650', height: '300' });
    } else {
        alert({ title: "操作提示", msg: "请选择映射的目标表！" });
    }
}

// 设置字段映射
function setFieldMapping() {
    var fieldName, srcFieldName, tgFieldName, defaultValue, fieldType, mappingConfig, sourceTableName;

    sourceTableName = $("#SourceTableName").val();
    mappingConfig = "<table source=\"" + sourceTableName + "\" target=\"" + $("#TargetTableName").val() + "\">";

    $("#FiledList").find("ul").each(function() {
        fieldName = $(this).attr("id");
        srcFieldName = $("#source_" + fieldName).val();
        defaultValue = $("#Default" + fieldName).val().replace(/(^\s*)|(\s*$)/g, "");

        if (srcFieldName != "" || (srcFieldName == "" && defaultValue != "是" && defaultValue != "否")) {
            tgFieldName = $("#Target" + fieldName).text();
            fieldType = $("#Type" + fieldName).text().replace(/(^\s*)|(\s*$)/g, "");

            if (srcFieldName != "") {
                mappingConfig += "<field><source>" + srcFieldName + "</source><target>" + tgFieldName + "</target><type>" + fieldType + "</type></field>";

            } else {
                mappingConfig += "<field><target>" + tgFieldName + "</target><default>" + defaultValue + "</default><type>" + fieldType + "</type></field>";
            }

        }
    });

    mappingConfig += "</table>";
    $(parent.document.getElementById("hdn_Field_" + sourceTableName)).val(mappingConfig);
    parent.Closed();
}
/***************************** PublishTask End   **************************/
