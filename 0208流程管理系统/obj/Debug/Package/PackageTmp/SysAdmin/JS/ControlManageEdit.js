/// <reference path="jquery-3.2-vsdoc2.js" />
/// <reference path="Common.js" />

/*===========================================================================
// Copyright (C) 2010 华强北在线 
// 作者：吴岸标// 创建日期：2010-03-25
// 功能描述：模型编辑页面通用的JS功能代码
===========================================================================*/
var id;

$(function() {
    var promptTitle;
    var promptListUrl;
    var promptEditUrl;
    var promptAddUrl;
    var pageName;

    pageName = cutTableNamePreFix($("#hdnTableName").val());
    promptListUrl = pageName + "list.aspx?" + $("#hdnBackUrlParam").val();
    promptEditUrl = pageName + "edit.aspx?action=edit&ID=" + id + "&" + $("#hdnBackUrlParam").val();
    promptAddUrl = pageName + "edit.aspx?action=add&" + $("#hdnBackUrlParam").val();

    try {
        promptTitle = $("#Title").val() + " 编辑";
    } catch (e) {
        promptTitle = "记录编辑";
    }

    showEditMessage(promptTitle, promptListUrl, promptAddUrl, promptEditUrl);
});

// 去掉字符串中的表名前缀
function cutTableNamePreFix(strContent) {
    strContent = strContent.replace("K_U_", "");
    strContent = strContent.replace("K_F_", "");
    strContent = strContent.replace("K_G_", "")

    return strContent;
}

// 页面初始化执行操作
$(function() {
    if ($("#hdnActionType").val() == "browse") {  // 模型列表的浏览操作 
        if (location.href.indexOf("Url=") > -1) {
            var backUrl;

            try {
                backUrl = location.href.split("Url=")[1];
                if (backUrl != "") {
                    $("#HQB_Operation_Button").html("<input type='button' value='返回' class=\"AddBtn\" onclick=\"location.href='" + backUrl + "'\" />");
                } else {
                    $("#HQB_Operation_Button").html("<input type='button' value='返回' class=\"AddBtn\" onclick=\"location.href='ModelManageList.aspx?" + $("#hdnBackUrlParam").val() + "'\" />");
                }
            } catch (e) {
                $("#HQB_Operation_Button").html("<input type='button' value='返回' class=\"AddBtn\" onclick=\"location.href='ModelManageList.aspx?" + $("#hdnBackUrlParam").val() + "'\" />");
            }
        } else {
            $("#HQB_Operation_Button").html("<input type='button' value='返回' class=\"AddBtn\" onclick=\"location.href='ModelManageList.aspx?" + $("#hdnBackUrlParam").val() + "'\" />");
        }
    }

    if ($("#hdnActionType").val() == "add") {
        $("#CurrentOpNavName").html("添加" + $("#hdnModelAlias").val().replace(/模型/g, ""));
    } else {
        $("#CurrentOpNavName").html("编辑" + $("#hdnModelAlias").val().replace(/模型/g, ""));
    }

    try {
        if ($("#hdnCreateHtmlRighte").val() != "1") {
            $("body").find("input[name='IsHtml']").each(function() { $(this).css("display", "none"); if ($(this).val() == "0") { $(this).attr("checked", "checked"); } });
        }
    } catch (e) { }
});

// 检测标题是否重复
function CheckTitleRepeat(tableName, fieldName, msgContainer) {
    var jsonParam;

    jsonParam = "{tableName:'" + tableName + "',fieldName:'" + fieldName + "',fieldValue:'" + $("#" + fieldName).val() + "'}";
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "ModelAjaxDeal.asmx/CheckTitleRepeat",
        dataType: "json",
        data: jsonParam,
        success: function(msg) {
            if (msg.d) {
                $("#" + msgContainer).html("对不起，已经存在此标题。");
            }
            else {
                $("#" + msgContainer).html("恭喜您，此文章标题可用！");
            }
        }
    });
}

// 更改或添加至其它节点
function OpenShowSiteNode(actionType) {
    var openUrl;

    // 更换节点
    if (actionType == 1) {
        openUrl = "ShowSiteNode.aspx?action=change&NodeCode=" + $("#hdnNodeID").val();
        openframe({ title: "更换节点", url: openUrl, width: '280', height: '350' })
    }
    else { // 添加至其它节点
        openUrl = "ShowSiteNode.aspx?action=add&NodeCode=" + $("#hdnNodeID").val();
        openframe({ title: "添加至其它节点", url: openUrl, width: '280', height: '350' })
    }
}
function back() {
    var pageName;

    pageName = cutTableNamePreFix($("#hdnTableName").val());
    location.href = pageName + "list.aspx?" + $("#hdnBackUrlParam").val();
}

// 关闭Dialog
function CloseDialog() {
    $("#norDialog").remove();
    $("#norDialogBackground").remove();
}

/***************************** 资源自定义系统字段 Begin **************************/
// 加载推荐作者
function loadRecommendAuthor(showContainer) {
    var showTemplate;

    showTemplate = "【<span style='cursor:default;' onclick=\"addRecommendAuthor('Author','{Name}')\">{Name}</span>】";

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "ModelAjaxDeal.asmx/GetRecommendAuthor",
        dataType: "json",
        data: "{}",
        success: function(msg) {
            var authorHtml = "";

            if (msg.d != null) {
                $(msg.d).each(function() {
                    if (this != null && this.toString() != "undefined" && this.toString() != "object HTMLDocument") {
                        authorHtml += showTemplate.replace("{Name}", this.toString()).replace("{Name}", this.toString());
                    }
                }
            );
                $("#" + showContainer).html(authorHtml);
            }
            else {
                $("#" + showContainer).html("");
            }
        }
    });
}

// 添加推荐作者至文本框中
function addRecommendAuthor(txtobj, authorName) {
    var originalValue;
    originalValue = "|" + $("#" + txtobj).val() + "|";

    if (originalValue.indexOf("|" + authorName + "|") == -1) {
        originalValue = $("#" + txtobj).val();

        if (originalValue == "") {
            originalValue = authorName;
        }
        else {
            originalValue += "|" + authorName;
        }

        $("#" + txtobj).val(originalValue);
    }
}
// 加载推荐来源
function loadRecommendSource(showContainer) {
    var showTemplate;

    showTemplate = "【<span style='cursor:default;' onclick=\"addRecommendSource('Source','{Name}')\">{Name}</span>】";

    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "ModelAjaxDeal.asmx/GetRecommendSource",
        dataType: "json",
        data: "{}",
        success: function(msg) {
            var sourceHtml = "";
            if (msg.d != null) {
                $(msg.d).each(function() {
                    if (this != null && this.toString() != undefined) {
                        sourceHtml += showTemplate.replace("{Name}", this.toString()).replace("{Name}", this.toString());
                    }
                }
            );
                $("#" + showContainer).html(sourceHtml);
            }
            else {
                $("#" + showContainer).html("");
            }
        }
    });
}


// 添加推荐来源至文本框中
function addRecommendSource(txtobj, authorName) {
    var originalValue;
    originalValue = $("#" + txtobj).val();

    if (originalValue != authorName) {
        $("#" + txtobj).val(authorName);
    }
}

// 加载推荐关键字
function loadRecommendKeyword(showContainer) {
}
/***************************** 资源自定义系统字段 End **************************/


/***************************** 多文件（图片）字段 Begin **************************/
// 多选择下拉列表 初始加载
function MultiFileInit(multiFileID, hdnID) {
    var arrUrl;

    arrUrl = $("#" + hdnID).val().split("$$$");

    for (var i = 0; i < arrUrl.length; i++) {
        if (arrUrl[i] != "") {
            $("#" + multiFileID)[0].options[$("#" + multiFileID)[0].options.length] = new Option(arrUrl[i], arrUrl[i]);
        }
    }

}
// 控件值当前操作内容与保存控件值的隐藏域同步
function MultiFileSynchronousHideValue(multiFileID, hdnID) {
    var obj = document.getElementById(hdnID);
    var photoUrls = document.getElementById(multiFileID);
    var value = "";
    for (i = 0; i < photoUrls.length; i++) {
        if (value != "") {
            value = value + "$$$";
        }
        value = value + photoUrls.options[i].value;
    }
    obj.value = value;
}

// 多选择下拉列表中删除选中项
function MultiFileItemDel(multiFileID, hdnID) {
    var obj = document.getElementById(multiFileID);
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert({ title: "操作提示", msg: "请先选择操作选项。" });
        return false;
    }
    for (var i = 0; i < document.getElementById(multiFileID).options.length; i++) {
        if (document.getElementById(multiFileID).options[i].selected == true) {
            document.getElementById(multiFileID).options[i] = null;
        }
    }
    MultiFileSynchronousHideValue(multiFileID, hdnID);
}

// 多选择下拉列表中添加外部地址选项
function MultiFileItemAdd(multiFileID, hdnID) {
    prompt({ msg: "请输入值：", title: "添加文件", fn: function(data) { AddItemToMultiFile(data, multiFileID, hdnID, true) } });
    MultiFileSynchronousHideValue(multiFileID, hdnID);
}

// 多选择下拉列表中修改选中项
function MultiFileItemModify(multiFileID, hdnID) {
    var obj = document.getElementById(multiFileID);
    if (obj == null) return false;
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert({ title: "操作提示", msg: "请选择要操作的选项。" });
        return false;
    }
    prompt({ msg: '请输入值：', title: '修改文件', value: thisurl, fn: function(data) { AddItemToMultiFile(data, multiFileID, hdnID, false) } });
}

// 向多选列表中添加选项
function AddItemToMultiFile(data, multiFileID, hdnID, isAdd) {
    if (data != '' && data != "null") {
        var obj = document.getElementById(multiFileID);
        if (isAdd) {
            obj.options[obj.options.length] = new Option(data, data);
        }
        else {
            obj.options[obj.selectedIndex] = new Option(data, data);
        }
        MultiFileSynchronousHideValue(multiFileID, hdnID);
    }
}

// 多选择下拉列表中将选中项往上移
function UpOrder(multiFileID) {
    var sel = document.getElementById(multiFileID);
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
function DownOrder(multiFileID) {
    var sel = document.getElementById(multiFileID);
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
/***************************** 多文件（图片）字段 End **************************/

/***************************** 区域推荐自定义系统字段 Begin **************************/
// 初始加载推荐区域
function AreaRecommendLoad(areaName) {
    var xmlObj;
    var xmlTags;
    var showTemplate;
    var areaTags, areaName, areaRecommendHtml;
    var areaRecommendValue;
    var xmlDoc;

    try //Internet Explorer
    {
        xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    }
    catch (e) {
        try //Firefox, Mozilla, Opera, etc.
          {
            xmlDoc = document.implementation.createDocument("", "", null);
        }
        catch (e) {
            alert(e.message);
            return;
        }
    }

    xmlDoc.async = false;
    xmlDoc.load("../Configuraion/Model/RecommendArea.xml");
    showTemplate = "<input type='checkbox' value='{AreaTag}' {checked} onclick=\"AreaRecommend_Onclick(this,'" + areaName + "')\" />{AreaName}&nbsp;";
    xmlTags = xmlDoc.getElementsByTagName("config/" + areaName + "/area");
    areaRecommendValue = $("#RA_" + areaName).val().split(",");

    for (var i = 0; i < xmlTags.length; i++) {
        areaName = xmlTags[i].getAttribute("name");
        areaTags = xmlTags[i].getAttribute("tags");
        areaRecommendHtml = showTemplate.replace("{AreaTag}", areaTags).replace("{AreaName}", areaName);

        if (AreaRecommendInit(areaRecommendValue, areaTags)) {
            areaRecommendHtml = areaRecommendHtml.replace("{checked}", " checked='checked' ");
        }
        else {
            areaRecommendHtml = areaRecommendHtml.replace("{checked}", "");
        }
        document.write(areaRecommendHtml);
    }
}

// 初始值
function AreaRecommendInit(areaTags, currentValue) {
    var isTrue = false;

    for (var i = 0; i < areaTags.length; i++) {
        if (currentValue == areaTags[i]) {
            isTrue = true;
            break;
        }
    }

    return isTrue;
}

// 区域推荐自定义系统字段
function AreaRecommend_Onclick(chk, areaName) {
    var chkValue;
    var isChecked;
    var area;

    chkValue = $(chk).val();
    isChecked = $(chk).attr("checked");
    area = $("#RA_" + areaName).val();

    if (isChecked) {
        if (area == "") {
            area = chkValue + ",";
        } else {
            area = area + chkValue + ",";
        }
    } else {
        area = area.replace(chkValue + ",", "");
        area = area.replace(chkValue, "");
    }

    $("#RA_" + areaName).val(area);
}
/***************************** 区域推荐自定义系统字段 End **************************/

/***************************** 发布范围自定义系统字段 Begin **************************/
// 当用用户名替代用户ID时，提取用户名
function PublishRangeGetUserName() {
    var arrUserInfo, arrUser;
    var userName;               // 保存用户名，用户名之间用逗号隔开
    var userInfo;               // 选中的发布用户，格式：站点ID&&用户名

    userInfo = $("#PublishRange").val();
    userName = "";

    if (userInfo != "") {
        arrUserInfo = userInfo.split(",");

        for (var k = 0; k < arrUserInfo.length; k++) {
            if (arrUserInfo[k] != "") {
                arrUser = arrUserInfo[k].split("$$");   // [0]  站点ID  [1] 用户名
                if (userName == "") {
                    userName = arrUser[1];
                } else {
                    userName = userName + "," + arrUser[1];
                }
            }
        }
    }

    $("#HQB_PublishRange").val(userName);
}
/***************************** 发布范围自定义系统字段 End **************************/

/***************************** 子模型 基本字段 Begin **************************/
// 加载子模型字段所在分组的所有子模型
function LoadSubModel(selID, subModelGroupID, initValue, id) {
    var title, tableName;
    var objSelect;

    if (Common.trim(initValue) != "") {
        $("#" + selID).attr("disabled","disabled");
    }
    
    $("#SubModel" + selID).html("<img src='../image/loading.gif'>");
    $.ajax({
        type: "post",
        url: "ModelAjaxDeal.asmx/GetSubModelList",
        data: "subModelGroupID=" + subModelGroupID,
        dataType: "xml",
        success: function(msg) {
            objSelect = window.document.getElementById(selID);
            $(msg).find("SubModel").each(function() {
                $(this).find("TableName").each(function() { tableName = $(this).text(); });
                $(this).find("Title").each(function() { title = $(this).text(); });

                if (title != "" && tableName != "") {
                    objSelect.options[objSelect.options.length] = new Option(title, tableName);
                }
            });

            if (initValue != "") {
                $(objSelect).find("option").each(function() {
                    if ($(this)[0].value == initValue) {
                        $(this).attr("selected", "selected");
                    }
                });
            }

            if (objSelect.options.length > 0) {
                LoadSubModelField(selID, id);
            }
        }
    });
}

// 子模型字段初始加载
function InitSubModelField(tableName, id, selID) {
    if ($("#hdnActionType").val() == "edit") {
        $.ajax({
            type: "post",
            contentType: "application/json",
            dataType: "json",
            data: "{tableName:'" + tableName + "',parentID:'" + id + "'}",
            url: "ModelAjaxDeal.asmx/InitSubModelField",
            success: function(msg) {
                LoadFieldValue(tableName,  eval(msg.d));
            }
        });
    }
}

// 编辑时填充字段值
function LoadFieldValue(tableName, fieldValueCollect) {
    var fieldID;
    var fieldValue;
    var fieldValueCollect;
    var arrSubFieldValue;

    if (fieldValueCollect != null && fieldValueCollect .length > 0) {
        for (var k = 0; k < fieldValueCollect.length; k++) {
            fieldID = tableName + "___" + fieldValueCollect[k].fieldName;
            fieldValue = Common.trim(fieldValueCollect[k].fieldValue);

            if (window.document.getElementById(fieldID) && fieldValue != "") {
                switch ($("#" + fieldID).attr("type").toLowerCase()) {
                    case "text":
                    case "hidden":
                    case "textarea":
                        $("#" + fieldID).val(fieldValue);
                        break;
                    case "checkbox":
                        arrSubFieldValue = fieldValue.split(",");

                        $("#SubModel" + selID).find("input[name='" + fieldID + "']").each(function() {
                            for (var i = 0; i < arrSubFieldValue.length; i++) {
                                if ($(this).val() == arrSubFieldValue[i]) {
                                    $(this).attr("checked", "checked");
                                }
                            }
                        });
                        break;
                    case "radio":
                        $("#SubModel" + selID).find("input[name='" + fieldID + "']").each(function() {
                            if ($(this).val() == fieldValue) {
                                $(this).attr("checked", "checked");
                            }
                        });
                        break;
                    case "select-one":
                        $("#" + fieldID).find("option").each(function() {
                            if ($(this).val() == fieldValue) {
                                $(this).attr("selected", "selected");
                            }
                        });
                        break
                    case "select-multiple":
                        arrSubFieldValue = fieldValue.split(",");
                        $("#" + fieldID).find("option").each(function() {
                            for (var i = 0; i < arrSubFieldValue.length; i++) {
                                if ($(this).val() == arrSubFieldValue[i]) {
                                    $(this).attr("selected", "selected");
                                }
                            }
                        });
                        break
                }
            }
        }
    }
}

// 加载字模型字段  容器ID  SubModel + selID
function LoadSubModelField(selID, id) {
    $("#SubModel" + selID).html("<img src='../image/loading.gif'>");
    $.ajax({
        type: "post",
        contentType: "application/json",
        url: "ModelAjaxDeal.asmx/GetSubModelField",
        data: "{tableName:'" + $("#" + selID).val() + "'}",
        dataType: "json",
        success: function(msg) {
            $("#SubModel" + selID).html(msg.d);
            InitSubModelField($("#" + selID).val(), id, selID)
        }
    });
}
/***************************** 子模型 基本字段 End ****************************/
